using System.Collections.Generic;
using UnityEngine;

public class Hexagon2 {

// move directions from hexes, (dir+3)%6 is the opposite
	public static Vector2[] HexDir
		= new Vector2[]{new Vector2(0, 1), new Vector2(1, 0), new Vector2(1, -1), new Vector2(0, -1), new Vector2(-1, 0), new Vector2(-1, 1)};
	
	public int HexX, HexY, HexHeight;
	public Vector3 LocalCenter;
	public Hexagon2[] Neighbours = new Hexagon2[6];
	public bool[] Roads = new bool[6]{false, false, false, false, false, false};
	public int GScore, HScore, FScore, PathParent = -1;
	public bool ScoresReady = false;
	
	public Hexagon2(int hx, int hy, int hheight, Vector3 heightMapCoords) {
		HexX = hx;
		HexY = hy;
		HexHeight = hheight;
		
		LocalCenter = heightMapCoords;
	}

	public Hexagon2(int[] coords, int hheight, Vector3 heightMapCoords) : this (coords[0], coords[1], hheight, heightMapCoords) {
	}
	
	public bool Equals(Hexagon2 hex) {
		if ((hex.HexX != this.HexX) || (hex.HexY != this.HexY)) return false;
		
		return true;
	}

	private int findDirTo(int toX, int toY) {
		int dX = toX - HexX;
		int dY = toY - HexY;
	
		if ((dX == 0) && (dY == 1)) return 0;
		if ((dX == 1) && (dY == 0)) return 1;
		if ((dX == 1) && (dY == -1)) return 2;
		if ((dX == 0) && (dY == -1)) return 3;
		if ((dX == -1) && (dY == 0)) return 4;
		
		return 5;
	}
	
	public int DirectionTo(Hexagon2 toHex) {
		if (this == toHex) {
			Debug.LogWarning("tried to get direction where from == to");
			return -1;
		}
		
		Vector3 dir = toHex.LocalCenter - this.LocalCenter;
		float angle = Vector3.Angle(dir, Vector3.right);
		Vector3 rhs = Vector3.Cross(dir, Vector3.right);

		if (rhs.y < 0) return 5-(int)(angle/60); else return (int)(angle/60);
	}
	
    /// <summary>
    /// Sets the hexagon last the path came from
    /// </summary>
    /// <param name="parentHex"></param>
	public void ClearPathingInfo(Hexagon2 parentHex) {
		ScoresReady = false;
		
		FScore = GScore = HScore = 0;
		
		if (parentHex == null) {
			PathParent = -1;
		} else {
			for (int i=0; i<6; i++) {
				if (this.Neighbours[i] == parentHex) PathParent = i;
			}
		}
//Debug.Log (this +" pp: "+PathParent + " "+Neighbours[PathParent]);
	}
	
	public int GetPathScores(Hexagon2 goal) {
		if (ScoresReady) return FScore;
		
		HScore = GroundDistanceTo (goal) * 10;

        // calculate GScore 
		if (PathParent == -1) {
			GScore = 0;
		} else {
            // Get the score of the parent hex
			GScore = Neighbours[PathParent].GScore;
			
			float heightDelta = this.HexHeight - Neighbours[PathParent].HexHeight;

			if (heightDelta < -7.5f) {
				GScore += 7;
			} else if (heightDelta > 7.5f) {
				GScore += 13;
			} else {
				GScore += 10;
			}
		}

		ScoresReady = true;
		
		FScore = HScore + GScore;
		
		return FScore;
	}

	public override string ToString() {
		return "{"+HexX+", "+HexY+", "+HexHeight+"}";
	}

	public string ScoresToString() {
		return ("F: "+FScore+" = H:"+ HScore+" +G:"+ GScore);
	}
	
	public string AllToString() {
		return ToString()+" "+ScoresToString()+ " Parent: "+PathParent+ ((PathParent >=0) ? Neighbours[PathParent].ToString() : "") + " Roads: "
			+Roads[0]+" "+Roads[1]+" "+Roads[2]+" "+Roads[3]+" "+Roads[4]+" "+Roads[5];
	}
	
	public static int[] HexCoordsToArrayCoords(int hx, int hy) {
		int[] ret = new int[]{hx, hy};
		ret[0] += (int)(ret[1]*0.5f);
		
		return ret;
	}
	
	public static int[] HexCoordsToArrayCoords(Hexagon2 hex) {
		return HexCoordsToArrayCoords(hex.HexX, hex.HexY);
	}

	public static int[] ArrayCoordsToHexCoords(int ax, int ay) {
		int[] ret = new int[2]{ax, ay};
		ret[0] -= (int)(ret[1]*0.5f);
		
		return ret;
	}

	public static int[] ArrayCoordsToHexCoords(Vector2 arrayCoords) {
		return ArrayCoordsToHexCoords((int)(arrayCoords.x), (int)(arrayCoords.y));
	}

	public int GroundDistanceTo(int toX, int toY) {
		int deltaX = Mathf.Abs(toX - this.HexX);
		int deltaY = Mathf.Abs(toY - this.HexY);
		int deltaZ = Mathf.Abs(-(toX+toY) - (-(this.HexX+this.HexY)));
	
		return Mathf.Max(deltaX, deltaY, deltaZ);
	}

	public int GroundDistanceTo(Hexagon2 toHex) {
		return GroundDistanceTo (toHex.HexX, toHex.HexY);
	}

	public List<Hexagon2> AllWithinDistance(int whatDist) {
		if (whatDist < 1) return null;
		
		if (whatDist == 1) return new List<Hexagon2>(this.Neighbours);
		
		List<Hexagon2> allList = new List<Hexagon2>();
		
		foreach (Hexagon2 neighHex in this.Neighbours) if (neighHex != null) {
			neighHex.AllWithinDistanceFrom(this, whatDist, allList);
		}
		
		return allList;
	}

	public void AllWithinDistanceFrom(Hexagon2 whatFrom, int whatDist, List<Hexagon2> retList) {
		if (this.GroundDistanceTo(whatFrom) == whatDist) {
			if (!retList.Contains(this)) retList.Add(this);
			return;
		}
		
		int myDist = this.GroundDistanceTo(whatFrom);

		foreach (Hexagon2 neighHex in this.Neighbours) if (neighHex != null) {
			int neighDist = neighHex.GroundDistanceTo(whatFrom);
			if (neighDist == whatDist) if (!retList.Contains(neighHex)) {
				retList.Add(neighHex);
				continue;
			}
			
			if (neighDist > myDist) neighHex.AllWithinDistanceFrom(whatFrom, whatDist, retList);
		}
	}

	public List<Hexagon2> AllWithinDistance(int whatDistStart, int whatDistEnd) {
		if (whatDistEnd == whatDistStart) return AllWithinDistance(whatDistStart);

		if (whatDistEnd < whatDistStart) {
			int tmp = whatDistEnd;
			whatDistEnd = whatDistStart;
			whatDistStart = tmp;
		}
		
		List<Hexagon2> allList = new List<Hexagon2>();

		for (int i=whatDistStart; i<=whatDistEnd; i++) {
//			Hexagon2[] tmp = AllWithinDistance(i);
			
//			foreach (Hexagon2 hex in tmp) if ((hex != null) && (!allList.Contains (hex))) allList.Add (hex);
		}
		
		return allList;
	}
}