var target : Transform;
var zdistance = 10.0;
var ydistance = 3;


var xSpeed = 250.0;
var ySpeed = 120.0;

var yMinLimit = -20;
var yMaxLimit = 80;

private var x = 0.0;
private var y = 0.0;

@script AddComponentMenu("Camera-Control/Mouse Orbit")

function Start () {
   // transform.position = position;
    var angles = transform.eulerAngles;
    x = angles.y;
    y = angles.x;

	// Make the rigid body not change rotation
   	if (GetComponent.<Rigidbody>())
		GetComponent.<Rigidbody>().freezeRotation = true;
}

function Update () {

    if (target && Input.GetMouseButton(0) && !Input.GetKey("left alt")) {
        x += Input.GetAxis("Mouse X") * xSpeed * 0.02;
        y -= Input.GetAxis("Mouse Y") * ySpeed * 0.02;
 		
 		y = ClampAngle(y, yMinLimit, yMaxLimit);
 		       
        var rotation = Quaternion.Euler(y, x, 0);
       // Debug.Log("rotaion" + rotation);

        var x = rotation * Vector3(0.0, ydistance, -zdistance) ;
        //Debug.Log("var x" + x);

         var position = x + target.position;
        
        transform.rotation = rotation;
        transform.position = position;
    }
    
    
}

static function ClampAngle (angle : float, min : float, max : float) {
	if (angle < -360)
		angle += 360;
	if (angle > 360)
		angle -= 360;
	return Mathf.Clamp (angle, min, max);
}