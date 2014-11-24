using UnityEngine;
using System.Collections;

public class CameraManager : MonoBehaviour 
{


    public float moveSpeed = 5;
    public float moveDamping = 10;

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
        _transform = transform;
        x = _transform.rotation.eulerAngles.y;
        y = _transform.rotation.eulerAngles.x;
    }

    void Update ()
    {

        


        if (Input.GetKey(KeyCode.Mouse1))
        {
            x += Input.GetAxis("Mouse X") * rotationSpeed * Time.fixedDeltaTime;
            y -= Input.GetAxis("Mouse Y") * rotationSpeed * Time.fixedDeltaTime;

            y = Mathf.Clamp(y, minAngle, maxAngle);

            transform.rotation = Quaternion.Euler(y, x, 0);
        }


        zoomDistance -= Input.GetAxis("Mouse ScrollWheel") * zoomSpeed * Time.fixedDeltaTime;
        zoomDistance = Mathf.Clamp(zoomDistance, minZoom, maxZoom);


        focusPos += Quaternion.Euler(0, x, 0) * new Vector3(Input.GetAxisRaw("Horizontal"), 0, Input.GetAxisRaw("Vertical")) * moveSpeed * Time.fixedDeltaTime;
        transform.position = focusPos + Quaternion.Euler(y, x, 0) * new Vector3(0.0f, 0.0f, -zoomDistance);


    }


}
