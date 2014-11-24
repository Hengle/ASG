using UnityEngine;
using System.Collections.Generic;

public class RandomTerrainScript : MonoBehaviour {

	public Texture2D HeightMap;
	public int RandSeed;
	public bool Randomize = true;
	public bool Hexagonize = true;
	public bool SetFauna = false;
	public bool SmoothNeighbours = false;
	public int HexScale = 200;
	public int MaxTrees = 1500;
	
	private int xSize, ySize, zSize;
	private float[,] heights;
	private float[,,] alphas;
	private TerrainData terra;

	private float HexLittleRow, HexBigR, HexS, HexPadding;
	private int numHexesX, numHexesY;
	private Hexagon2[,] hexes;
	private GameObject hexGrid;
	
	private float thermalThreshold;
	
	private bool erosionOn = false;
	
// this in Awake so it definately gets run first!
	void Awake () {

        Application.targetFrameRate = 60;

        int timeStart = System.Environment.TickCount;



		if (Randomize) {
			RandSeed = (int)(System.Environment.TickCount + System.DateTime.Now.Ticks);
		}

		Random.seed = RandSeed;
		
        Debug.Log ("Randomseed: "+RandSeed);
		
		terra = GetComponent<Terrain>().terrainData;
		
		xSize = terra.heightmapWidth;
		ySize = terra.heightmapHeight;
		zSize = terra.heightmapHeight;
	
		thermalThreshold = 4.0f/(float)(xSize);

		HeightMap = new Texture2D(xSize, ySize);
		
Debug.Log ("terrain: "+xSize+ " X "+ySize+" X "+zSize);

// null the terrain & trees
		terra.SetHeights(0, 0, new float[xSize, ySize]);
		
// !! The heights from set/get are 0...1 !!
		heights = terra.GetHeights(0, 0, xSize, ySize);
		
		heights[0,0] = Random.Range(0.1995f, 0.8005f);
		heights[xSize-1,0] = Random.Range(0.2995f, 0.9005f);
		heights[0,ySize-1] = Random.Range(0.2995f, 1.005f);
		heights[xSize-1,ySize-1] = Random.Range(0.1995f, 0.6005f);

		diamondSquare(0, 0, xSize-1, ySize-1, 0.4f, 0.5f);

		voronoi(12);
		
		heightsToTex();
		
		if (Hexagonize) {
//			setHexFauna();
			hexagonize();
		}
		
		terra.SetHeights(0, 0, heights);

		if (SetFauna) setFauna();
		
		GetComponent<Terrain>().Flush();


        Debug.Log("Terrain generated " + (System.Environment.TickCount - timeStart) + "ms");


	}

	private void diamondSquare(int xbegin, int ybegin, int xend, int yend, float randomRange, float randomDiminish) {
		float randomNow = randomRange, sum;
		int sqrSize = xend-xbegin;
		int x0, y0, x1, y1;
		
		int dSStart = System.Environment.TickCount;
		
		while (sqrSize > 1) {
			for (x0 = xbegin; x0<xend; x0+=sqrSize) {
				x1 = x0+sqrSize;
				
				for (y0 = ybegin; y0<yend; y0+=sqrSize) {
					y1 = y0+sqrSize;
				
// diamond step
					int midx = x0+(x1-x0)/2;
					int midy = y0+(y1-y0)/2;
					
					sum = (heights[x0, y0] + heights[x0, y1] + heights[x1, y0] + heights[x1, y1]) / 4.0f;
					heights[midx, midy] = sum*(1+Random.Range(-randomNow, randomNow));
				}
			}
			
			for (x0 = xbegin; x0<xend; x0+=sqrSize) {
				x1 = x0+sqrSize;
				
				for (y0 = ybegin; y0<yend; y0+=sqrSize) {
					y1 = y0+sqrSize;

					int midx = x0+(x1-x0)/2;
					int midy = y0+(y1-y0)/2;
			
// square step
					if (y0 == ybegin) {
						sum = (heights[x0, y0] + heights[x1, y0] + heights[midx, midy])/3.0f;
						heights[midx, y0] = sum*((1.0f+Random.Range(-randomNow, randomNow)));
					} else {
						sum = (heights[x0, y0] + heights[x1, y0] + heights[midx, midy] + heights[midx, midy-sqrSize])/4.0f;
						heights[midx, y0] = sum*((1.0f+Random.Range(-randomNow, randomNow)));
					}

					if (y1 == yend) {
						sum = (heights[x0, y1] + heights[x1, y1] + heights[midx, midy])/3.0f;
						heights[midx, y1] = sum*((1.0f+Random.Range(-randomNow, randomNow)));
					} else {
						sum = (heights[x0, y1] + heights[x1, y1] + heights[midx, midy] + heights[midx, midy+sqrSize])/4.0f;
						heights[midx, y1] = sum*((1.0f+Random.Range(-randomNow, randomNow)));
					}

					if (x0 == xbegin) {
						sum = (heights[x0, y0] + heights[x0, y1] + heights[midx, midy])/3.0f;
						heights[x0, midy] = sum*((1.0f+Random.Range(-randomNow, randomNow)));
					} else {
						sum = (heights[x0, y0] + heights[x0, y1] + heights[midx, midy] + heights[midx-sqrSize, midy])/4.0f;
						heights[x0, midy] = sum*((1.0f+Random.Range(-randomNow, randomNow)));
					}

					if (x1 == xend) {
						sum = (heights[x1, y0] + heights[x1, y1] + heights[midx, midy])/3.0f;
						heights[x1, midy] = sum*((1.0f+Random.Range(-randomNow, randomNow)));
					} else {
						sum = (heights[x1, y0] + heights[x1, y1] + heights[midx, midy] + heights[midx+sqrSize, midy])/4.0f;
						heights[x1, midy] = sum*((1.0f+Random.Range(-randomNow, randomNow)));
					}
				}
			}
		
			sqrSize /= 2;
			randomNow *= randomDiminish;
		}
	
		Debug.Log ("diamondSquare finished "+(System.Environment.TickCount - dSStart)+"ms");
	}
	
	private void voronoi(int featNum) {
		Vector2[] featureP = new Vector2[featNum];
		float[] featDist = new float[featNum+2];
		
		float maxDist = Mathf.Max(xSize*xSize, ySize*ySize);
		
		int vorStart = System.Environment.TickCount;
		Debug.Log ("voronoi start");
		
		for (int i=0; i<featureP.Length; i++) {
			featureP[i].x = Random.Range (0, xSize);
			featureP[i].y = Random.Range (0, ySize);
		}
	
		for (int x=0; x<xSize; x++)
		for (int y=0; y<ySize; y++) {

// calc distances
			featDist[0] = featDist[1] = int.MaxValue;
			
			for (int i=0; i<featureP.Length; i++) {
				featDist[i+2] = ((featureP[i].x - x) * (featureP[i].x - x) + (featureP[i].y - y) * (featureP[i].y - y))/(maxDist*0.5f);
				
				if (featDist[i+2] < featDist[0]) {
					featDist[1] = featDist[0];
					featDist[0] = featDist[i+2];
				} else if (featDist[i+2] < featDist[1]) {
					featDist[1] = featDist[i+2];
				}
			}
			
			heights[x,y] = heights[x,y] + 0.33f * (featDist[0] * -1 + featDist[1] * 1);
		}
	
		Debug.Log ("voronoi finished "+(System.Environment.TickCount - vorStart)+"ms");
	}

	private void heightsToTex() {
		Color[] heightColor = new Color[xSize * ySize];
		
		for (int x=0; x<xSize; x++)
		for (int y=0; y<ySize; y++) {
			heightColor[x+(y*xSize)] = new Color(heights[x,y], heights[x,y], heights[x,y]);
		}
	
		HeightMap.SetPixels(heightColor);
		HeightMap.Apply();
		
		byte[] png = HeightMap.EncodeToPNG();
		System.IO.File.WriteAllBytes("encoded.png", png);
	}
	
	private void setFauna() {
		/*float [,,] */alphas = terra.GetAlphamaps(0, 0, terra.alphamapWidth, terra.alphamapHeight);
//		int[,] details = terra.GetDetailLayer(0, 0, terra.detailWidth, terra.detailHeight, 0);
		
		int[,] details = new int[terra.detailWidth, terra.detailHeight];
		List<TreeInstance> trees = new List<TreeInstance>();

		TreeInstance ins = new TreeInstance();
			
		float heightMin = float.PositiveInfinity, heightMax = float.NegativeInfinity;
		
		Vector2 alpha2height = new Vector2(xSize / terra.alphamapWidth, ySize / terra.alphamapHeight);
		Vector2 alpha2detail = new Vector2(terra.detailWidth / terra.alphamapWidth, terra.detailHeight / terra.alphamapHeight);

		Debug.Log ("amap: "+terra.alphamapWidth+"X"+terra.alphamapHeight);
		Debug.Log ("hmap: "+xSize+"X"+ySize);

//		heights = terra.GetHeights(0, 0, xSize, ySize);
		
		for (int x=0; x<xSize; x++)
		for (int y=0; y<ySize; y++) {
			if (heights[x,y] > heightMax) heightMax = heights[x,y];
			if (heights[x,y] < heightMin) heightMin = heights[x,y];						
		}
		
		for (int x=0; x<terra.alphamapWidth; x++)
		for (int y=0; y<terra.alphamapHeight; y++) {
			Vector3 norm = terra.GetInterpolatedNormal((float)(x)/terra.alphamapWidth, (float)(y)/terra.alphamapHeight);
			float ang = Vector3.Angle(norm, Vector3.up);
			
			if ((ang < 15) && (Random.value > 0.85f) && (trees.Count < MaxTrees)) {
				ins.heightScale = 1+Random.value;
				ins.widthScale = 1+Random.value*0.5f;
				ins.position = new Vector3(y / (float)(terra.alphamapHeight), heights[(int)(x*alpha2height.x),
					(int)(y*alpha2height.y)], x / (float)(terra.alphamapWidth));

				ins.prototypeIndex = 0;
				ins.color = Color.white;
				ins.lightmapColor = Color.white;
				
				trees.Add(ins);
			}

			if (ang > 40) {
				alphas[x,y,0] = 0.0f;
				alphas[x,y,1] = 1.0f;
				alphas[x,y,2] = 0.0f;
				alphas[x,y,3] = 0.0f;
				alphas[x,y,4] = 0.0f;
				alphas[x,y,5] = 0.0f;
			} else if (((heights[(int)(x*alpha2height.x), (int)(y*alpha2height.y)]-heightMin) / (heightMax - heightMin)) > 0.5f) {
				details[(int)(x*alpha2detail.x), (int)(y*alpha2detail.y)] = (int)(Random.value*20);
				alphas[x,y,0] = 1.0f;
				alphas[x,y,1] = 0.0f;
				alphas[x,y,2] = 0.0f;
				alphas[x,y,3] = 0.0f;
				alphas[x,y,4] = 0.0f;
				alphas[x,y,5] = 0.0f;
			} else {
				alphas[x,y,0] = 0.0f;
				alphas[x,y,1] = 0.0f;
				alphas[x,y,2] = 1.0f;
				alphas[x,y,3] = 0.0f;
				alphas[x,y,4] = 0.0f;
				alphas[x,y,5] = 0.0f;
			}
		
			if (((heights[(int)(x*alpha2height.x), (int)(y*alpha2height.y)]-heightMin) / (heightMax - heightMin)) > 0.85f) {
				alphas[x,y,0] = 0.0f;
				alphas[x,y,1] = 0.0f;
				alphas[x,y,2] = 0.0f;
				alphas[x,y,3] = 1.0f;
				alphas[x,y,4] = 0.0f;
				alphas[x,y,5] = 0.0f;
			}
		}
	
		terra.treeInstances = trees.ToArray();
		terra.SetDetailLayer(0, 0, 0, details);
		terra.SetDetailLayer(0, 0, 1, new int[terra.detailWidth,terra.detailHeight]);
		terra.SetAlphamaps(0, 0, alphas);
	}
	
	private void setHexFauna() {
		/*float [,,]*/ alphas = terra.GetAlphamaps(0, 0, terra.alphamapWidth, terra.alphamapHeight);
//		int[,] details = terra.GetDetailLayer(0, 0, terra.detailWidth, terra.detailHeight, 0);
		
// first, clear everything to hexframecolor:
		for (int x=0; x<terra.alphamapWidth; x++)
		for (int y=0; y<terra.alphamapHeight; y++)
		for (int i=0; i<6; i++) {
			alphas[x,y,i] = (i==5) ? 1 : 0;
		}

		return;
			
		int[,] details = new int[terra.detailWidth, terra.detailHeight];
		List<TreeInstance> trees = new List<TreeInstance>();

		TreeInstance ins = new TreeInstance();
			
		float heightMin = float.PositiveInfinity, heightMax = float.NegativeInfinity;
		
		Vector2 alpha2height = new Vector2(xSize / terra.alphamapWidth, ySize / terra.alphamapHeight);
		Vector2 alpha2detail = new Vector2(terra.detailWidth / terra.alphamapWidth, terra.detailHeight / terra.alphamapHeight);

		Debug.Log ("amap: "+terra.alphamapWidth+"X"+terra.alphamapHeight);
		Debug.Log ("hmap: "+xSize+"X"+ySize);

//		heights = terra.GetHeights(0, 0, xSize, ySize);
		
		for (int x=0; x<xSize; x++)
		for (int y=0; y<ySize; y++) {
			if (heights[x,y] > heightMax) heightMax = heights[x,y];
			if (heights[x,y] < heightMin) heightMin = heights[x,y];						
		}
		
		for (int x=0; x<terra.alphamapWidth; x++)
		for (int y=0; y<terra.alphamapHeight; y++) {
			Vector3 norm = terra.GetInterpolatedNormal((float)(x)/terra.alphamapWidth, (float)(y)/terra.alphamapHeight);
			float ang = Vector3.Angle(norm, Vector3.up);
			
			if ((ang < 15) && (Random.value > 0.85f) && (trees.Count < MaxTrees)) {
				ins.heightScale = 1+Random.value;
				ins.widthScale = 1+Random.value*0.5f;
				ins.position = new Vector3(y / (float)(terra.alphamapHeight), heights[(int)(x*alpha2height.x),
					(int)(y*alpha2height.y)], x / (float)(terra.alphamapWidth));

				ins.prototypeIndex = 0;
				ins.color = Color.white;
				ins.lightmapColor = Color.white;
				
				trees.Add(ins);
			}

			if (ang > 40) {
				alphas[x,y,0] = 0.0f;
				alphas[x,y,1] = 1.0f;
				alphas[x,y,2] = 0.0f;
				alphas[x,y,3] = 0.0f;
			} else if (((heights[(int)(x*alpha2height.x), (int)(y*alpha2height.y)]-heightMin) / (heightMax - heightMin)) > 0.5f) {
				details[(int)(x*alpha2detail.x), (int)(y*alpha2detail.y)] = (int)(Random.value*20);
				alphas[x,y,0] = 1.0f;
				alphas[x,y,1] = 0.0f;
				alphas[x,y,2] = 0.0f;
				alphas[x,y,3] = 0.0f;
			} else {
				alphas[x,y,0] = 0.0f;
				alphas[x,y,1] = 0.0f;
				alphas[x,y,2] = 1.0f;
				alphas[x,y,3] = 0.0f;
			}
		
			if (((heights[(int)(x*alpha2height.x), (int)(y*alpha2height.y)]-heightMin) / (heightMax - heightMin)) > 0.85f) {
				alphas[x,y,0] = 0.0f;
				alphas[x,y,1] = 0.0f;
				alphas[x,y,2] = 0.0f;
				alphas[x,y,3] = 1.0f;
			}
		}
	
		terra.treeInstances = trees.ToArray();
		terra.SetDetailLayer(0, 0, 0, details);
		terra.SetDetailLayer(0, 0, 1, new int[terra.detailWidth,terra.detailHeight]);
		terra.SetAlphamaps(0, 0, alphas);
	}

	private void thermalErode(int iterations) {
		int erodeStart = System.Environment.TickCount;
		Debug.Log ("thermal erode start (threshold "+thermalThreshold+")");
		
		float deltaMax, deltaTotal, heightHere;
		float[] deltaI = new float[4];
		
		float totmax = 0;
		
		for (int i=0; i<iterations; i++)
		for (int x=0; x<xSize; x++)
		for (int y=0; y<ySize; y++) {
			deltaMax = deltaTotal = 0;	
			heightHere = heights[x,y];
				
			if (x > 0) {
				deltaI[0] = heightHere - heights[x-1,y];
				
				if (deltaI[0] > thermalThreshold) {
					deltaTotal += deltaI[0];
					
					if (deltaI[0] > deltaMax) deltaMax = deltaI[0];
				}
			}

			if (y > 0) {
				deltaI[1] = heightHere - heights[x,y-1];
				
				if (deltaI[1] > thermalThreshold) {
					deltaTotal += deltaI[1];
					
					if (deltaI[1] > deltaMax) deltaMax = deltaI[1];
				}
			}

			if (x < (xSize-1)) {
				deltaI[2] = heightHere - heights[x+1,y];
				
				if (deltaI[2] > thermalThreshold) {
					deltaTotal += deltaI[2];
					
					if (deltaI[2] > deltaMax) deltaMax = deltaI[2];
				}
			}

			if (y < (ySize-1)) {
				deltaI[3] = heightHere - heights[x,y+1];
				
				if (deltaI[3] > thermalThreshold) {
					deltaTotal += deltaI[3];
					
					if (deltaI[3] > deltaMax) deltaMax = deltaI[3];
				}
			}

			if (deltaTotal > totmax) totmax = deltaTotal;
				
			if ((x>0) && (deltaI[0] > thermalThreshold)) heights[x-1,y] += 0.75f * (deltaMax - thermalThreshold) * deltaI[0]/deltaTotal;
			if ((y>0) && (deltaI[1] > thermalThreshold)) heights[x,y-1] += 0.75f * (deltaMax - thermalThreshold) * deltaI[1]/deltaTotal;
			if ((x<(xSize-1)) && (deltaI[2] > thermalThreshold)) heights[x+1,y] += 0.75f * (deltaMax - thermalThreshold) * deltaI[2]/deltaTotal;
			if ((y<(ySize-1)) && (deltaI[3] > thermalThreshold)) heights[x,y+1] += 0.75f * (deltaMax - thermalThreshold) * deltaI[3]/deltaTotal;
		}
		
		terra.SetHeights(0, 0, heights);
		
		Debug.Log ("thermal erode finished "+(System.Environment.TickCount - erodeStart)+"ms");
		Debug.Log ("totmax: "+totmax);
	}
	
	private void hydraulicErode(int iterations, bool _8neighbours) {
		int erodeStart = System.Environment.TickCount;
		
		float[,] W = new float[terra.heightmapWidth, terra.heightmapHeight], S = new float[terra.heightmapWidth, terra.heightmapHeight];
		float Kr = 0.01f, Ks = 0.01f, Ke = 0.5f, Kc = 0.01f, deltaTotal, heightAverage = 0, deltaW, deltaS;
		float[] deltaI;
		
		if (_8neighbours) deltaI = new float[8]; else deltaI = new float[4];

		
		for (int i=0; i<iterations; i++) {
			for (int x=0; x<terra.heightmapWidth; x++)
			for (int y=0; y<terra.heightmapHeight; y++) {	
				W[x,y] += Kr;
				heights[x,y] -= Ks*W[x,y];
				S[x,y] += Ks*W[x,y];
				
				deltaTotal = getDeltas(x, y, W, ref deltaI, ref heightAverage);

				if ((x>0) && (deltaI[0]>0)) {
					deltaW = Mathf.Min (W[x,y], (heights[x,y]+W[x,y]) - heightAverage) * (deltaI[0] / deltaTotal);
					deltaS = S[x,y] * (deltaW / W[x,y]);
	
					W[x,y] -= deltaW;
					W[x-1,y] += deltaW;
					
					S[x,y] -= deltaS;
					S[x-1,y] += deltaS;
				}		

				if ((y>0) && (deltaI[1]>0)) {
					deltaW = Mathf.Min (W[x,y], (heights[x,y]+W[x,y]) - heightAverage) * (deltaI[1] / deltaTotal);
					deltaS = S[x,y] * (deltaW / W[x,y]);
	
					W[x,y] -= deltaW;
					W[x,y-1] += deltaW;
					
					S[x,y] -= deltaS;
					S[x,y-1] += deltaS;
				}
				
				if ((x<(xSize-1)) && (deltaI[2]>0)) {
					deltaW = Mathf.Min (W[x,y], (heights[x,y]+W[x,y]) - heightAverage) * (deltaI[2] / deltaTotal);
					deltaS = S[x,y] * (deltaW / W[x,y]);
	
					W[x,y] -= deltaW;
					W[x+1,y] += deltaW;
					
					S[x,y] -= deltaS;
					S[x+1,y] += deltaS;
				}
				
				if ((y<(ySize-1)) && (deltaI[3]>0)) {
					deltaW = Mathf.Min (W[x,y], (heights[x,y]+W[x,y]) - heightAverage) * (deltaI[3] / deltaTotal);
					deltaS = S[x,y] * (deltaW / W[x,y]);
	
					W[x,y] -= deltaW;
					W[x,y+1] += deltaW;
					
					S[x,y] -= deltaS;
					S[x,y+1] += deltaS;
				}		
//			}

// evaporation
//			for (int x=0; x<terra.heightmapWidth; x++)
//			for (int y=0; y<terra.heightmapHeight; y++) {
				W[x,y] *= (1.0f - Ke);
				float Smax = W[x,y] * Kc;
				
				if (S[x,y] > Smax) {
					float Sdelta = S[x,y]-Smax;
					S[x,y] -= Sdelta;
					heights[x,y] += Sdelta;
				}
			}
		}
		
		terra.SetHeights(0, 0, heights);
		
		Debug.Log ("hydraulic erode finished "+(System.Environment.TickCount - erodeStart)+"ms");
	}
	
	private float getDeltas(int x, int y, float[,] water, ref float[] deltas, ref float avg) {
		float ret = 0;
		float totalH, currentH;
		avg = 0;
		int div = 0;
		
		currentH = (heights[x,y] + water[x,y]);
		
		if (x>0) if (water != null) {
			totalH = (heights[x-1,y] + water[x-1,y]);
			deltas[0] = currentH - totalH;
			avg += totalH;
			
			ret += deltas[0];
			div++;
		} else deltas[0] = 0.0f;
		
		if (y>0) if (water != null) {
			totalH = (heights[x,y-1] + water[x,y-1]);
			deltas[1] = currentH - totalH;
			avg += totalH;
			
			ret += deltas[1];
			div++;
		} else deltas[1] = 0.0f;
		
		if (x<(xSize-1)) if (water != null) {
			totalH = (heights[x+1,y] + water[x+1,y]);
			deltas[2] = currentH - totalH;
			avg += totalH;
			
			ret += deltas[2];
			div++;
		} else deltas[2] = 0.0f;
		
		if (y<(ySize-1)) if (water != null) {
			totalH = (heights[x,y+1] + water[x,y+1]);
			deltas[3] = currentH - totalH;
			avg += totalH;
			
			ret += deltas[3];
			div++;
		} else deltas[3] = 0.0f;
		
		if (div != 0) avg /= div;
		
		return ret;
	}
	
	private void hexagonize() {		
		int hexagonizeStart = System.Environment.TickCount;

		hexGrid = new GameObject();
		
		HexLittleRow = terra.heightmapWidth / HexScale; // c

		HexBigR = 2*HexLittleRow / Mathf.Sqrt(3); // Get hex large rows

		HexS = Mathf.Sqrt(4*(HexBigR*HexBigR - HexLittleRow*HexLittleRow)); // Hex Size
		HexPadding = Mathf.Max (3, 0.07f*HexLittleRow); // Paddig

        Debug.Log ("r,R,S,P: "+HexLittleRow+", "+HexBigR+", "+HexS+", "+HexPadding);

		numHexesX = (int)(terra.heightmapWidth / ((HexLittleRow * 2) + HexPadding)) +1; // Get number of hexes X and Y
		numHexesY = (int)(terra.heightmapHeight/Mathf.Sqrt(3*HexLittleRow*HexLittleRow + 3*HexLittleRow*HexPadding + 0.75f*HexPadding*HexPadding)) +1;
		
        Debug.Log ("hexgridsize: "+numHexesX+"X"+numHexesY+" = "+numHexesX*numHexesY);

		hexes = new Hexagon2[numHexesX, numHexesY]; // Generate hex grid array

		bool even = true;
		int arrayY = 0;
		float hy = HexBigR;
		
		while ((hy + HexBigR) < terra.heightmapHeight) {
			int arrayX = 0;
			float hx = HexLittleRow + ((even) ? 0 : HexLittleRow+HexPadding*0.5f);
			
			while ((hx + HexLittleRow) < terra.heightmapWidth) {
				float tmpHeight = heights[(int)(hx), (int)(hy)];
				convertToHex(new Vector2(hx, hy), tmpHeight);
				
				hexes[arrayX, arrayY] = new Hexagon2(Hexagon2.ArrayCoordsToHexCoords(arrayX, arrayY), (int)(tmpHeight*terra.size.y), new Vector3(hy, tmpHeight*terra.size.y, hx));
                //if (arrayX==0 && arrayY==0) Debug.Log (hexes[arrayX,arrayY].LocalCenter);
				
				arrayX++;
				hx += 2*HexLittleRow + HexPadding;
			}

			even = !even;
			arrayY++;
			hy += Mathf.Sqrt(3*HexLittleRow*HexLittleRow + 3*HexLittleRow*HexPadding + 0.75f*HexPadding*HexPadding);
		}

        //		return;
		for (int x=0; x<numHexesX; x++)
		for (int y=0; y<numHexesY; y++) {
		
			if (hexes[x,y] == null) continue;

            // set up the neighbours
			for (int i=0; i<6; i++) {
				Vector2 dir = Hexagon2.HexDir[i];
				int[] hexCoords = Hexagon2.ArrayCoordsToHexCoords(x,y);
				int[] neighbourArrayCoords = Hexagon2.HexCoordsToArrayCoords((int)(hexCoords[0]+dir.x), (int)(hexCoords[1]+dir.y));
				
                //				if ((x+dir.x)>-1 && (x+dir.x)<numXhexes && (y+dir.y)>-1 && (y+dir.y)<numYhexes) hexes[x,y].Neighbour[i] = hexes[(int)(x+dir.x), (int)(y+dir.y)];
				if ((neighbourArrayCoords[0] >= 0) && (neighbourArrayCoords[1] >= 0)
					&& (neighbourArrayCoords[0] < numHexesX) && (neighbourArrayCoords[1] < numHexesY)) hexes[x,y].Neighbours[i]
						= hexes[(int)(neighbourArrayCoords[0]), (int)(neighbourArrayCoords[1])];
				
				else hexes[x,y].Neighbours[i] = null;

                /*if (hexCoords[0] == 1 && hexCoords[1] == 1) Debug.Log ("i"+i+" dir: "+dir+" hC: "+hexCoords[0]+", "+hexCoords[1]+" nHC: "+
					Hexagon2.ArrayCoordsToHexCoords(neighbourArrayCoords)[0]+","+Hexagon2.ArrayCoordsToHexCoords(neighbourArrayCoords)[1]); */
								
				if ((hexes[x,y].Neighbours[i] != null) && (SmoothNeighbours)) {
					smoothNeighbour(hexes[x,y], hexes[x,y].Neighbours[i]);
				}
			}			
		}
		
        //		terra.SetAlphamaps(0, 0, alphas);
		Debug.Log ("hexagonize finished "+(System.Environment.TickCount - hexagonizeStart)+"ms");
	}
	
/*	private Vector2 hex2height(int hx, int hy) {
		return new Vector2(HexLittleRow + (HexLittleRow + HexPadding) * hy + 2*HexLittleRow * hx + HexPadding * hx,
			HexBigR + hy * Mathf.Sqrt(3*HexLittleRow * HexLittleRow + 3*HexLittleRow*HexPadding + 0.75f*HexPadding*HexPadding));
	} */
	
// return the world coord center of the hex closest to world coord point
	public Hexagon2 WorldToHex(Vector3 point) {
		int[] hexCoords = WorldToHexCoords(point);
		
//		Debug.Log ("local:" +local +" hC: "+hexCoords);
		hexCoords = Hexagon2.HexCoordsToArrayCoords(hexCoords[0], hexCoords[1]);
		
		if ((hexCoords[0] >=0) && (hexCoords[1] >=0) && (hexCoords[0]<numHexesX) && (hexCoords[1]<numHexesY)) {
			return hexes[hexCoords[0], hexCoords[1]];
		} else return null;
	}

	public Vector3 WorldToHexCenterWorld(Vector3 point) {
		int[] hexCoords = WorldToHexCoords(point);

		hexCoords = Hexagon2.HexCoordsToArrayCoords(hexCoords[0], hexCoords[1]);
		
		Debug.Log ("local:" +" hC: "+hexCoords[0]+" " +hexCoords[1]);

		if ((hexCoords[0] >=0) && (hexCoords[1] >=0) && (hexCoords[0]<numHexesX) && (hexCoords[1]<numHexesY)) {
			Vector3 local = transform.TransformPoint(hexes[hexCoords[0], hexCoords[1]].LocalCenter);
		
			return local;
		} else throw new System.NullReferenceException();
	}

// returns true if suitable coordinates were found from the world point
	public bool WorldToHexCenterWorld(ref Vector3 point) {
		int[] hexCoords = WorldToHexCoords(point);

//		Debug.Log ("local:" +local +" hC: "+hexCoords);
		hexCoords = Hexagon2.HexCoordsToArrayCoords(hexCoords[0], hexCoords[1]);
		
		if ((hexCoords[0] >=0) && (hexCoords[1] >=0) && (hexCoords[0]<numHexesX) && (hexCoords[1]<numHexesY)) {
			point = transform.TransformPoint(hexes[hexCoords[0], hexCoords[1]].LocalCenter);
		
			return true;
		} else {
//			point = point;
			
			return false;
		}
	}

	public int[] WorldToHexCoords(Vector3 point) {
		Vector3 local = transform.InverseTransformPoint(point);
		
		Vector2 hexCoords = new Vector2(0, (local.x-HexBigR)/Mathf.Sqrt(3*HexLittleRow * HexLittleRow + 3*HexLittleRow*HexPadding + 0.75f*HexPadding*HexPadding));
		hexCoords.x = (local.z - HexLittleRow - (HexLittleRow + HexPadding*0.5f) * (int)(hexCoords.y+0.5f)) / (2*HexLittleRow + HexPadding);

Debug.Log (hexCoords+" hc: "+(int)(hexCoords.x+0.5f)+" "+ (int)(hexCoords.y+0.5f));
		
		hexCoords.x += (hexCoords.x < 0) ? -0.5f : 0.5f;
		hexCoords.y += 0.5f;
		
		return new int[]{(int)(hexCoords.x), (int)(hexCoords.y)};
	}
	
	public int[] WorldToHexArrayCoords(Vector3 point) {
		int[] hexCoords = WorldToHexCoords(point);
		
		return Hexagon2.HexCoordsToArrayCoords(hexCoords[0], hexCoords[1]);
	}

	public Vector3 GetHexCenterWorld(Hexagon2 hex) {
		if (hex == null) throw new System.NullReferenceException("GetHexCenterWorld was given null hex as argument");
		
		Vector3 local = hex.LocalCenter;
		 
		local = transform.TransformPoint (hex.LocalCenter);
		
		return local;
	}
	
	public Hexagon2 GetHexAtWorldPos(Vector3 whereAt) {
		int[] hexCoords = WorldToHexArrayCoords(whereAt);

		if (!ValidArrayCoords(hexCoords)) return null;
		
		return hexes[hexCoords[0], hexCoords[1]];
	}
	
	public Hexagon2 GetHexAtHexCoords (int[] hc) {
		int[] ac = Hexagon2.HexCoordsToArrayCoords(hc[0], hc[1]);
		if (!ValidArrayCoords(ac)) return null;
	
		return hexes[ac[0], ac[1]];
	}

	public Hexagon2 GetHexAtHexCoords (int hx, int hy) {
		return GetHexAtHexCoords(new int[]{hx, hy});
	}

	public Hexagon2 GetHexAtArrayCoords (int ax, int ay) {
		return hexes[ax, ay];
	}
	
	public bool ValidHex(Hexagon2 whatHex) {
		int[] ac = Hexagon2.HexCoordsToArrayCoords(whatHex);
		if ((ac[0] >=0) && (ac[1] >=0) && (ac[0]<numHexesX) && (ac[1]<numHexesY)) return true; else return false;
	}

	public bool ValidArrayCoords(int[] ac) {
		if ((ac[0] >=0) && (ac[1] >=0) && (ac[0]<numHexesX) && (ac[1]<numHexesY)) return true; else return false;
	}

	private void smoothNeighbour(Hexagon2 which, Hexagon2 neighbour) {
		Vector2 whichCenter = new Vector2(which.LocalCenter.x, which.LocalCenter.z);//hex2height(which.HexX, which.HexY);
		Vector2 neighbourCenter = new Vector2(neighbour.LocalCenter.x, neighbour.LocalCenter.z);//hex2height(neighbour.HexX, neighbour.HexY);

// if the neighbour is to the left, we don't smooth it -> no duplicate smooths! \o/
		if (neighbourCenter.x < whichCenter.x) return;

		Vector2 startPoint, startDelta, pointDelta;
		float heightDelta = (neighbour.HexHeight - which.HexHeight) / terra.size.y / HexPadding;

// the neighbour is allways to the right ->
// then its either to the upright, right or downright
//Debug.Log (which+" -> "+neighbour);
		
		if (neighbourCenter.y > whichCenter.y) {
//			return;
			startPoint.x = whichCenter.x;
			startPoint.y = whichCenter.y + HexBigR;
			startDelta.x = HexLittleRow / HexS;
			startDelta.y = -Mathf.Sqrt(HexS*HexS - HexLittleRow*HexLittleRow) / HexS;
			pointDelta.x = 0.5f;
			pointDelta.y = Mathf.Sqrt(3.0f/4.0f);
//			Debug.Log (": "+pointDelta);
		} else if (neighbourCenter.y < whichCenter.y) {
//			return;
			startPoint.x = whichCenter.x;
			startPoint.y = whichCenter.y - HexBigR;
			startDelta.x = HexLittleRow / HexS;
			startDelta.y = Mathf.Sqrt(HexS*HexS - HexLittleRow*HexLittleRow) / HexS;
			pointDelta.x = 0.5f;
			pointDelta.y = -Mathf.Sqrt(3.0f/4.0f);
		} else {
//			return;
			startPoint.x = whichCenter.x + HexLittleRow;
			startPoint.y = whichCenter.y + 0.5f * HexS;
			startDelta.x = 0;
			startDelta.y = -1;
			pointDelta.x = 1;
			pointDelta.y = 0;
		}
		
// first the hexlines
		for (float i=0; i<=HexS; i+=0.25f) {
			Vector2 pointAt = startPoint;
			float heightAt = which.HexHeight / terra.size.y;
			
			for (float j=0; j<=HexPadding; j+= 0.5f) {
				if ((pointAt.x >= terra.heightmapWidth) || (pointAt.y >= terra.heightmapHeight)) continue;

				heights[(int)(pointAt.x), (int)(pointAt.y)] = heightAt;
//				if (j==1) break;
				
				pointAt += pointDelta * 0.5f;
				heightAt += heightDelta * 0.5f;
			}

			startPoint += startDelta * 0.25f;
		}
		
//Debug.Log (startX +" -> "+endX);
//Debug.Log (startY +" -> "+endY);
//Debug.Log (startHeight +" ++ "+deltaHeight);

	} 
	
	private void convertToHex(Vector2 center, float heightToSet) {
		Vector2 tmpOrigo = new Vector2(center.x - HexLittleRow, center.y + 0.5f*HexS);
		Vector2 height2alpha = new Vector2(((float)(terra.alphamapWidth) / terra.heightmapWidth), ((float)(terra.alphamapHeight) / terra.heightmapHeight)); 
		
		int upY = (int)Mathf.Min (terra.heightmapHeight-1, center.y + HexBigR);
		int downY = (int)Mathf.Max(0, center.y - HexBigR);
		float hexX = HexBigR - 0.5f*HexS;

		int startX = -1, endX = -1, texToUse=-1;
		
        // what should we use as a tex?
		if (heightToSet < 0.3f) {
			texToUse = 2;
		} else if (heightToSet < 0.7f) {
			texToUse = 0;
		} else {
			texToUse = 1;
		}
			
		for (int hy=upY; hy>downY; hy--) {
            // switch between where you are
			if (hy > (center.y+0.5f*HexS)) {
				
				startX = (int)Mathf.Max(0, center.x - HexLittleRow * ((upY-hy) / hexX));
				endX = (int)Mathf.Min(terra.heightmapWidth, center.x + HexLittleRow * ((upY-hy) / hexX));
            //Debug.Log (startX +" -> "+endX+" ,"+hy);
			} else if (hy > (center.y-0.5f*HexS)) {
				startX = (int)Mathf.Max(0, tmpOrigo.x);
				endX = (int)Mathf.Min(terra.heightmapWidth-1, tmpOrigo.x + 2*HexLittleRow);
				
            //				Debug.Log (startX +" -> "+endX);
			} else {
				startX = (int)Mathf.Max(0, center.x - HexLittleRow * ((hy-downY) / hexX));
				endX = (int)Mathf.Min(terra.heightmapWidth-1, center.x + HexLittleRow * ((hy-downY) / hexX));
            //				Debug.Log (startX +" -> "+endX+ "  "+((hy-downY) / hexX));
			}			

            // finally actually set the heights
			for (int hx = startX; hx<endX; hx++) {
				heights[hx, hy] = heightToSet;
/*				alphas[(int)(hx * height2alpha.x), (int)(hy * height2alpha.y), texToUse] = 1;
				alphas[(int)(hx * height2alpha.x), (int)(hy * height2alpha.y), 5] = 0; */
			}
		}
	}
	
	public float LittleR() {
		return HexLittleRow;
	}

	void Update () {				
//		if (Input.GetKey(KeyCode.Space)) erosionOn = !erosionOn;
//		if (erosionOn) thermalErode(25);
		if (erosionOn) hydraulicErode(5, false);
	}
}