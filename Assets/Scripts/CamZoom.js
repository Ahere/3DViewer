var zoomSpeed = 250;

var zoomMin = 30;
var zoomMax = 80;

function LateUpdate (){
	
    if (Input.GetMouseButton(1)) {
		 GetComponent.<Camera>().fieldOfView -= Input.GetAxis("Mouse Y") * zoomSpeed * 0.01;
		 
		 GetComponent.<Camera>().fieldOfView = Mathf.Clamp(GetComponent.<Camera>().fieldOfView, zoomMin, zoomMax);
		 
    }
}