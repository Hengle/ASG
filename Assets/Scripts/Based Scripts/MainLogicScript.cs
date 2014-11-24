using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class MainLogicScript : MonoBehaviour {

// used for filtering radar scan results etc. -> powers of two
	public enum SideEnum {Friendly = 1, Enemy = 2, Neutral = 4};
	public enum DifficultyLevel {WallrusLike = 0, TechnicalStyle = 1, StarAdmiralQuality = 2};
	
	public GameObject selectedPointer;
	
// turnnumber and the side (friendly = 0, enemy = 1, neutral = 2) whose turn it is
	public static int Turn;
	public static SideEnum Side;
	public static DifficultyLevel Difficulty = DifficultyLevel.WallrusLike;
	
	public static List<GameObject> Enemies = new List<GameObject>();
	public static List<GameObject> Friendlies = new List<GameObject>();
	public static Dictionary<GameObject, int> RadarHits = new Dictionary<GameObject, int>();
	
	public static bool TurnForFree = false, MovieSlowdowns = true;

	private enum StateMachine {Pathfinding, Turning, Aiming};
	private StateMachine stateNow = StateMachine.Pathfinding;
	
	private GameObject selected = null;
//	private FriendlyScript selectedScript = null;
	private List<Hexagon2> selectedPath;
	private int selectedActionCost = 0;
	
	private LineRenderer greenRenderer, redRenderer, yellowRenderer;
	private Hexagon2 pointerLastAt = null;
	
	private float nextSelectPossible, lastGroundClick, nextKeyPressPossible;
	private int currentEnemyPtr = 0;
	private bool allFinished = false;
	
	private RandomTerrainScript terrain;
	
	public void Start () {
		terrain = GameObject.Find ("Terrain").GetComponent<RandomTerrainScript>();
	}
	
	void Update () {
	}

	public static List<Hexagon2> GetPath(Hexagon2 fromHex, Hexagon2 toHex, out int pathCost) {
		if ((toHex == null) || (fromHex == null)) {
			pathCost = int.MaxValue;
			return null;
		}
		
//Debug.Log ("pathing from "+fromHex+" to "+toHex);
		int minF;
		Hexagon2 minFHex = null;
		
// trying for a path from start to start?
		if (toHex == fromHex) {
			pathCost = int.MaxValue;
			return null;
		}
		
// halutaanko validista paikasta validiin paikkaan?
/*		if (!terrain.ValidHex(toHex) || !terrain.ValidHex(fromHex)) {
			pathCost = int.MaxValue;
			return null;
		}*/
		
// just to be on the safer side:
		fromHex.ClearPathingInfo(null);
		toHex.ClearPathingInfo(null);
		
		List<Hexagon2> openList = new List<Hexagon2>();
		List<Hexagon2> closedList = new List<Hexagon2>();
		
		openList.Add(fromHex);

//Debug.Log("i: from "+fromHex.AllToString()+ " -> "+toHex.AllToString());
		findAdjacentWalkable(fromHex, toHex, openList, closedList);
		
		openList.Remove(fromHex);
		closedList.Add (fromHex);
		
		while ((openList.Count != 0) && (!openList.Contains(toHex))) {
			minFHex = null;
			minF = int.MaxValue;

// find the lowest FScore
			foreach (Hexagon2 hex in openList) {
				int tmp = hex.GetPathScores(toHex);

				if (tmp < minF) {
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
		
// if path not found
		if (openList.Count == 0) Debug.Log ("path not found "+fromHex +"->"+ toHex);
		if (openList.Count == 0) {
			pathCost = -1;
			return null;
		}
		
		List<Hexagon2> retList = new List<Hexagon2>();
		
		Hexagon2 tmphex = openList.Find(hex => hex.Equals(toHex));
		
		pathCost = tmphex.GScore;
		
		while (tmphex != fromHex) {	
//Debug.Log ("tmp: "+tmphex.AllToString());
			retList.Add(tmphex);
			tmphex = tmphex.Neighbours[tmphex.PathParent];
		}
	
		fromHex.PathParent = fromHex.DirectionTo(retList[retList.Count-1]);
		retList.Insert(retList.Count, fromHex);
		
		return retList;
	}

	private static void findAdjacentWalkable(Hexagon2 fromHex, Hexagon2 toHex, List<Hexagon2> openList, List<Hexagon2> closedList) {
		foreach (Hexagon2 neighHex in fromHex.Neighbours) if (neighHex != null) {
			if (openList.Contains(neighHex) || closedList.Contains(neighHex)) continue;

			neighHex.ClearPathingInfo(fromHex);
			neighHex.GetPathScores(toHex);
			openList.Add (neighHex);
		}
	}
	
// does a quick ping on active radar
	private static List<RaycastHit> continuingRaycast(Vector3 origin, Vector3 end) {
		List<RaycastHit> ret = new List<RaycastHit>();
		RaycastHit hit;
		
		Vector3 dir = end-origin, nowAt = origin, inc = dir.normalized*0.5f;
		
		while ((end - nowAt).sqrMagnitude > 0.001f) {
			if (!Physics.Raycast(nowAt, dir, out hit, (end-nowAt).magnitude)) break;
Debug.DrawLine(nowAt, hit.point);
Debug.DrawLine(hit.point, hit.point+Vector3.up*25, Color.green);

//Debug.DrawLine(hit.point, hit.point+inc, Color.blue);

			ret.Add (hit);
			nowAt = hit.point + inc;
		}
	
		return ret;
	}

	public void DrawLine (Vector3 start, Vector3 end, Color color, bool onlyOne) {
		if (color == Color.yellow) {
			yellowRenderer.enabled = true;
			
			if (onlyOne) {
				greenRenderer.enabled = redRenderer.enabled = false;
			}

			yellowRenderer.SetPosition(0, start);
			yellowRenderer.SetPosition(1, end);
		} if (color == Color.red) {
			redRenderer.enabled = true;
			
			if (onlyOne) {
				greenRenderer.enabled = yellowRenderer.enabled = false;
			}
			
			redRenderer.SetVertexCount(2);
			redRenderer.SetPosition(0, start);
			redRenderer.SetPosition(1, end);
		}
	}

	public void DrawLine (List<Hexagon2> list, Color color, bool onlyOne) {
		if (color == Color.green) {
			greenRenderer.enabled = true;
			
			if (onlyOne) {
				yellowRenderer.enabled = redRenderer.enabled = false;
			}
			
			greenRenderer.SetVertexCount(list.Count);
			
			for (int i=0; i<list.Count; i++) greenRenderer.SetPosition(i, terrain.GetHexCenterWorld(list[i])+Vector3.up*0.5f);
		} else if (color == Color.red) {
			redRenderer.enabled = true;
			
			if (onlyOne) {
				greenRenderer.enabled = redRenderer.enabled = false;
			}
			
			redRenderer.SetVertexCount(list.Count);
			
			for (int i=0; i<list.Count; i++) redRenderer.SetPosition(i, terrain.GetHexCenterWorld(list[i])+Vector3.up*0.5f);
		}
	}
}