using UnityEngine;
using System.Collections;

public class CameraManager : MonoBehaviour 
{

    public static CameraManager main;

    public float moveSpeed = 5;
    public float moveDamping = 10;
    public float cameraAngle = 52;

    public float rotationSpeed = 60;
    public float rotationDamping = 10;

    public float zoomSpeed = 10;
    public float zoomDistance = 10;


    public Vector3 focusPos;


    public int minAngle = 30;
    public int maxAngle = 90;

    public int minZoom = 3;
    public int maxZoom = 30;


    private Transform _transform;
    public float x, y;





    void Start ()
    {
        main = this;
        _transform = transform;
        x = _transform.rotation.eulerAngles.y;
        y = _transform.rotation.eulerAngles.x;
        //_transform.localEulerAngles = new Vector3(cameraAngle, 0, 0);
    }

    void Update ()
    {

        /*
        if (Input.GetKey(KeyCode.Mouse2))
        {
            x += Input.GetAxis("Mouse X") * rotationSpeed * Time.fixedDeltaTime;
            y -= Input.GetAxis("Mouse Y") * rotationSpeed * Time.fixedDeltaTime;

            y = Mathf.Clamp(y, minAngle, maxAngle);

            transform.rotation = Quaternion.Euler(y, x, 0);
        }*/


        zoomDistance -= Input.GetAxis("Mouse ScrollWheel") * zoomSpeed * Time.fixedDeltaTime;
        zoomDistance = Mathf.Clamp(zoomDistance, minZoom, maxZoom);


        focusPos += Quaternion.Euler(0, x, 0) * new Vector3(Input.GetAxisRaw("Horizontal"), 0, Input.GetAxisRaw("Vertical")) * moveSpeed * Time.deltaTime;
        transform.position = focusPos + Quaternion.Euler(y, x, 0) * new Vector3(0.0f, 0.0f, -zoomDistance);

    }

    public void PanTo(Transform target)
    {
        Debug.Log("Set");
        focusPos = target.position + Quaternion.Euler(y, x, 0) * new Vector3(0.0f, 0.0f, -zoomDistance);
    }
}
