using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class CamMove : MonoBehaviour {

	public GameObject InstantCapsule;
	public Transform HexPointer;
	
	public float TransitionDuration = 2f;
	
	private float moveDelta = 10;
	private int numFrames = 50;
	private float framesStart, fps = -1;

	private RandomTerrainScript rndTerrain;
	private MainLogicScript mainLogic;
	
	private GameObject cap;
	private Vector3 transitionTarget = new Vector3();
	private Quaternion transitionQuaternionTarget = Quaternion.identity;
	
	private bool transitionInProgress = false, oneSet = false, twoSet = false;

	private List<GameObject> pathCubes = new List<GameObject>();

	void Start () {	
		framesStart = Time.time;
		
		rndTerrain = GameObject.Find ("Terrain").GetComponent<RandomTerrainScript>();
		mainLogic = GameObject.Find ("MainGameLogic").GetComponent<MainLogicScript>();
	
		cap = GameObject.CreatePrimitive(PrimitiveType.Sphere);
		cap.transform.localScale = new Vector3(3,3,3);
	}
	
	void Update () {
		Ray ray;
		RaycastHit hit;
		
		numFrames--;
		
		if (numFrames == 0) {
			numFrames = 50;
			fps = 50/(Time.time - framesStart);
		
			framesStart = Time.time;
		}
		
		if (Input.GetKey (KeyCode.LeftShift) || Input.GetKey (KeyCode.RightShift)) moveDelta = 50f; else moveDelta = 10;
		
		if (Input.GetKey (KeyCode.W)) transform.position += transform.forward * Time.deltaTime * moveDelta;
		if (Input.GetKey (KeyCode.S)) transform.position -= transform.forward * Time.deltaTime * moveDelta;
		if (Input.GetKey (KeyCode.A)) transform.position -= transform.right * Time.deltaTime * moveDelta;
		if (Input.GetKey (KeyCode.D)) transform.position += transform.right * Time.deltaTime * moveDelta;
		if (Input.GetKey (KeyCode.Q)) transform.position += Vector3.up * Time.deltaTime * moveDelta;
		if (Input.GetKey (KeyCode.E)) transform.position -= Vector3.up * Time.deltaTime * moveDelta;
		
		if (Input.GetKey (KeyCode.Tab)) {
//			GameObject.Find("MinigunPrefab").GetComponent<MinigunScript>().Fire(40);
//			StartCoroutine(GameObject.Find("TrackedScoutPrefab").GetComponent<MovableUnit>().Weapons[0].FireOnce());
//			GameObject.Find ("MissilerackPrefab").GetComponent<MissilerackScript>().Fire(-123);
//			GameObject.Find ("ArmageddonrackPrefab").GetComponent<MissilerackScript>().Fire(-123);
		}
// set the pointer:
		ray = transform.GetComponent<Camera>().ScreenPointToRay(Input.mousePosition);

		if (Input.GetKeyDown(KeyCode.F1)) {
			ray = transform.GetComponent<Camera>().ScreenPointToRay(Input.mousePosition);
			
			if (Physics.Raycast(ray, out hit)) if (hit.collider.name == "Terrain") {
				GameObject tmp = GameObject.Find ("F1");

				tmp.transform.position = rndTerrain.WorldToHexCenterWorld(hit.point);

				oneSet = true;
				if (twoSet) drawPath();
			}
		}

		if (Input.GetKeyDown(KeyCode.F2)) {
			ray = transform.GetComponent<Camera>().ScreenPointToRay(Input.mousePosition);
			
			if (Physics.Raycast(ray, out hit)) if (hit.collider.name == "Terrain") {
				GameObject tmp = GameObject.Find ("F2");
				
				tmp.transform.position = rndTerrain.WorldToHexCenterWorld(hit.point);

				twoSet = true;
				if (oneSet) drawPath();
			}
		}

		if (Input.GetMouseButton(1)) {
			float turn = Input.GetAxis("Mouse X");
			float pitch = Input.GetAxis("Mouse Y");
			transform.Rotate(-pitch * Time.deltaTime * 100f, turn * Time.deltaTime * 100f, 0);// .RotateAround(Vector3.up, turn * Time.deltaTime * 10f);
		}
	
		if (Input.GetKey (KeyCode.KeypadEnter)) {
			ray = transform.GetComponent<Camera>().ScreenPointToRay(Input.mousePosition);
				
			if (Physics.Raycast(ray, out hit)) if (hit.collider.name == "Terrain")
				GameObject.Instantiate(InstantCapsule, hit.point+(Vector3.up*10), transform.rotation);
		}		
	}
	
// lets float to somewhere else and look at whereAt
	public void FloatToLookAt(Vector3 whereAt, params int[] heightWanted) {
		RaycastHit hit;
		float targetHeight = 0;
		
		if (heightWanted.Length != 0) {
			targetHeight = heightWanted[0];
		} else {
			if (Physics.Raycast(transform.position, Vector3.down, out hit)) {
				targetHeight = (transform.position - hit.point).magnitude;
			} else {
				targetHeight = 50;
			}
		}
Debug.Log ("targetheight after floating: "+targetHeight);
	
		Vector3 tmpDir = transform.position - whereAt;
		transitionTarget = whereAt + tmpDir.normalized * targetHeight;

		if (Physics.Raycast(transitionTarget, Vector3.down, out hit)) {
			transitionTarget = hit.point + new Vector3 (0, targetHeight, 0);
		}
	
		transitionQuaternionTarget = Quaternion.LookRotation (whereAt - transitionTarget);
		
// if not allready transitioning, start a new one
		if (!transitionInProgress) StartCoroutine(transition());
	}
	
	private IEnumerator transition() {
		float t=0;
		Vector3 startPos = transform.position;
		Quaternion startQuat = transform.rotation;
		
		transitionInProgress = true;
		
		while (t < TransitionDuration) {
			t += Time.deltaTime;
			
			transform.position = Vector3.Lerp(startPos, transitionTarget, t/TransitionDuration);
			transform.rotation = Quaternion.Slerp(startQuat, transitionQuaternionTarget, t/TransitionDuration);
//			this.transform.rotation = Quaternion.Lerp(startQuat, 
		
			yield return 0;
		}
	
		transitionInProgress = false;
	}
	
	public void OnGUI() {
		GUI.Label(new Rect(0, 0, 400, 200), "FPS: "+fps);
		GUI.Label(new Rect(0, 15, 400, 200), "WASD: move around, left shift: speedup");
		GUI.Label(new Rect(0, 30, 400, 200), "F1 & F2: set path start and endpoints");
		GUI.Label(new Rect(0, 45, 400, 200), "numpad enter: spawn a capsule");
	}

	private void drawPath() {
		Hexagon2 start = rndTerrain.WorldToHex(GameObject.Find ("F1").transform.position);
		Hexagon2 end = rndTerrain.WorldToHex(GameObject.Find ("F2").transform.position);

		int cost;

		if (pathCubes.Count != 0) {
			for (int i=0; i<pathCubes.Count; i++) Destroy(pathCubes[i]);
			pathCubes.Clear();
		}

		List<Hexagon2> path = MainLogicScript.GetPath(start, end, out cost);

		foreach (Hexagon2 hex in path) {
			GameObject tmp = GameObject.CreatePrimitive(PrimitiveType.Cube);
			tmp.transform.position = rndTerrain.transform.InverseTransformPoint(hex.LocalCenter);
			tmp.transform.localScale = new Vector3(rndTerrain.LittleR(), rndTerrain.LittleR(), rndTerrain.LittleR());
			pathCubes.Add (tmp);
		}
	}
}