using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class UIFollow : MonoBehaviour 
{

    public Vector3 offset;
    public GameObject followObj;

    public RectTransform rectTransform;
    public RectTransform canvasRect;
    
    public Camera mainCamera;

    public float fadeDistance = 100;

    private Vector2 ViewportPosition;
    private Vector2 WorldObject_ScreenPosition;

	// Use this for initialization
	void Start () 
    {
        canvasRect = this.transform.root.GetComponent<RectTransform>();
        mainCamera = Camera.main;
	}
	
	// Update is called once per frame
	void Update () {
        if (followObj)
        {
            //then you calculate the position of the UI element
            //0,0 for the canvas is at the center of the screen, whereas WorldToViewPortPoint treats the lower left corner as 0,0. Because of this, you need to subtract the height / width of the canvas * 0.5 to get the correct position.

            ViewportPosition = mainCamera.WorldToViewportPoint(followObj.transform.position + offset);
            WorldObject_ScreenPosition = new Vector2(
            ((ViewportPosition.x * canvasRect.sizeDelta.x) - (canvasRect.sizeDelta.x * 0.5f)),
            ((ViewportPosition.y * canvasRect.sizeDelta.y) - (canvasRect.sizeDelta.y * 0.5f)));

            //now you can set the position of the ui element
            rectTransform.anchoredPosition = WorldObject_ScreenPosition;
        }
	}
}
