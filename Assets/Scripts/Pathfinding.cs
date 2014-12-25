using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;

public class Pathfinding : MonoBehaviour
{

    /*
    frontier = PriorityQueue()
    frontier.put(start, 0)
    came_from = {}
    cost_so_far = {}
    came_from[start] = None
    cost_so_far[start] = 0

    while not frontier.empty():
       current = frontier.get()

       for next in graph.neighborDirs(current):
          new_cost = cost_so_far[current] + graph.cost(current, next)
          if next not in cost_so_far or new_cost < cost_so_far[next]:
     * 
             cost_so_far[next] = new_cost
             priority = new_cost + heuristic(goal, next)
             frontier.put(next, priority)
         came_from[next] = current
    */


    public static List<Hex> GetPath(Hex fromHex, Hex toHex, int pathCost) //, out int pathCost
    {

        Stopwatch sw = new Stopwatch();
        sw.Start();

  		int pathStart = System.Environment.TickCount;


        //Debug.Log("Getting path from " + fromHex.arrayCoord + " to " + toHex.arrayCoord);

        if (toHex == null || fromHex == null || toHex == fromHex)
        {
            pathCost = 0;
            return null;
        }

        
        int minF, tmp;
        Hex minFHex = null;


        // just to be on the safer side:
        fromHex.SetPathParent(null);
        toHex.SetPathParent(null);

        List<Hex> openList = new List<Hex>();
        List<Hex> closedList = new List<Hex>();

        openList.Add(fromHex);

        findAdjacentWalkable(fromHex, toHex, openList, closedList);

        openList.Remove(fromHex);
        closedList.Add(fromHex);

        while (openList.Count != 0 && !openList.Contains(toHex))
        {
            minFHex = null;
            minF = int.MaxValue;

            // find the lowest FScore
            foreach (Hex hex in openList)
            {
                tmp = hex.GetPathScores(toHex);

                if (tmp < minF)
                {
                    minF = tmp;
                    minFHex = hex;
                }
            }

            //Debug.Log ("minF: "+minFHex.FScore+" " +minFHex.HScore);
            // after that, check the surrounding squares
            openList.Remove(minFHex);
            closedList.Add(minFHex);

            findAdjacentWalkable(minFHex, toHex, openList, closedList);
        }

        UnityEngine.Debug.Log("Scanned " + closedList.Count);

        // if path not found
        if (openList.Count == 0) UnityEngine.Debug.Log("path not found " + fromHex + "->" + toHex);

        if (openList.Count == 0)
        {
            pathCost = -1;
            return null;
        }
        

        // Find path hex to with the info
        List<Hex> retList = new List<Hex>();

        // Get the to hex
        Hex tmphex = openList.Find(hex => hex.Equals(toHex));

        pathCost = tmphex.pathScore;

        // Reconstruct the path
        while (tmphex != fromHex)
        {
            //Debug.Log ("tmp: "+tmphex.AllToString());
            retList.Add(tmphex);
            tmphex = tmphex.neighbors[tmphex.pathParent];
        }

        fromHex.pathParent = fromHex.DirectionTo(retList[retList.Count - 1]);
        retList.Insert(retList.Count, fromHex);


        UnityEngine.Debug.Log("Path found in: " + (System.Environment.TickCount - pathStart) + "ms");

        retList.Reverse();

        sw.Stop();
        print("Path Found: " + sw.ElapsedMilliseconds + " ms");

        return retList;
    }

    public static List<Hex> FindPath(Hex startHex, Hex targetHex, int maxSize)
    {
        Stopwatch sw = new Stopwatch();
        sw.Start();

        if (startHex == null || targetHex == null || startHex == targetHex)
        {
            UnityEngine.Debug.Log("Invalid Path");
            return null;
        }

        Heap<Hex> openSet = new Heap<Hex>(maxSize);
        HashSet<Hex> closedSet = new HashSet<Hex>();
        openSet.Add(startHex);

        while (openSet.Count > 0)
        {
            Hex currentHex = openSet.RemoveFirst();
            closedSet.Add(currentHex);

            if (currentHex == targetHex)
            {
                sw.Stop();
                print("Path Found: " + sw.ElapsedMilliseconds + " ms");
                return RetracePath(startHex, targetHex);
            }

            foreach (Hex neighbour in currentHex.neighbors)
            {
                if (closedSet.Contains(neighbour))
                {
                    continue;
                }

                int newMovementCostToNeighbour = currentHex.gCost + (int)Vector3.Distance(neighbour.worldPos, targetHex.worldPos);
                if (newMovementCostToNeighbour < neighbour.gCost || !openSet.Contains(neighbour))
                {
                    neighbour.gCost = newMovementCostToNeighbour;
                    neighbour.hCost = (int)Vector3.Distance(neighbour.worldPos, targetHex.worldPos); // might break things
                    neighbour.parent = currentHex;

                    if (!openSet.Contains(neighbour))
                        openSet.Add(neighbour);
                }
            }
        }

        sw.Stop();
        print("Path Found: " + sw.ElapsedMilliseconds + " ms");
        return null;
    }

    public static List<Hex> RetracePath(Hex startHex, Hex endHex)
    {
        List<Hex> path = new List<Hex>();
        Hex currentHex = endHex;

        while (currentHex != startHex)
        {
            path.Add(currentHex);
            currentHex = currentHex.parent;
        }
        path.Reverse();

        return path;
    }




    private static void GetAdjacentHexes(Hex fromHex, Hex toHex, List<Hex> openList, List<Hex> closedList)
    {
        //for (int n = 0; n < Hex.neighborDirs.Length; n++)
        //{
        //    arrayPos = Hex.CubeToOffsetOddQ(hexGrid[x, y].cubeCoord + Hex.neighborDirs[n]);

        for (int n = 0; n < fromHex.neighbors.Count; n++)
        {
            if (fromHex.neighbors[n] != null)
            {
                if (openList.Contains(fromHex.neighbors[n]) || closedList.Contains(fromHex.neighbors[n])) 
                    continue;

                fromHex.neighbors[n].SetPathParent(fromHex);
                fromHex.neighbors[n].GetPathScores(toHex);
                openList.Add(fromHex.neighbors[n]);
            }
        }
    }


    private static void findAdjacentWalkable(Hex fromHex, Hex toHex, List<Hex> openList, List<Hex> closedList)
    {
        foreach (Hex neighHex in fromHex.neighbors) if (neighHex != null)
            {
                if (openList.Contains(neighHex) || closedList.Contains(neighHex)) continue;

                neighHex.SetPathParent(fromHex);
                neighHex.GetPathScores(toHex);
                openList.Add(neighHex);
            }
    }






    /*
    void GetPath (Hex start, Hex goal)
    {
        // The hexes we have already visited
        List<Hex> visited = new List<Hex>();
        // The hexes open to evaluation
        List<Hex> openSet = new List<Hex>();
        // The map of navigated Hexs
        List<Hex> path = new List<Hex>();

        int cost = 0;

        Hex current;

        while (openSet.Count > 0)
        {
            current = null;
            if (current == goal)
                return CreatePath(path, goal);

        }


    }

    List<Hex> CreatePath(List<Hex> path, Hex goal)
    {
        return null;
    }



    /*
     function A*(start,goal)
    closedset := the empty set    // The set of Hexs already evaluated.
    openset := {start}    // The set of tentative Hexs to be evaluated, initially containing the start Hex
    came_from := the empty map    // The map of navigated Hexs.
 
    g_score[start] := 0    // Cost from start along best known path.
    // Estimated total cost from start to goal through y.
    f_score[start] := g_score[start] + heuristic_cost_estimate(start, goal)
 
    while openset is not empty
        current := the Hex in openset having the lowest f_score[] value
        if current = goal
            return reconstruct_path(came_from, goal)
 
        remove current from openset
        add current to closedset
        for each neighbor in neighbor_Hexs(current)
            if neighbor in closedset
                continue
            tentative_g_score := g_score[current] + dist_between(current,neighbor)
 
            if neighbor not in openset or tentative_g_score < g_score[neighbor] 
                came_from[neighbor] := current
                g_score[neighbor] := tentative_g_score
                f_score[neighbor] := g_score[neighbor] + heuristic_cost_estimate(neighbor, goal)
                if neighbor not in openset
                    add neighbor to openset
 
    return failure
 
    function reconstruct_path(came_from,current)
        total_path := [current]
        while current in came_from:
            current := came_from[current]
            total_path.append(current)
        return total_path
     */


}
