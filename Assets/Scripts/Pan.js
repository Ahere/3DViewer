var panSpeed = 2.5;

var limitPan = true;

var yMax = 4.9;
var yMin = -5.4;

var xMax = 2.7;
var xMin = -3.0;

function Update () {
	if (limitPan){
		transform.position.y = Mathf.Clamp(transform.position.y, yMin, yMax);
		transform.position.x = Mathf.Clamp(transform.position.x, xMin, xMax);
	}
	
	if (Input.GetKey("w")){
		transform.Translate(Vector3.up * Time.deltaTime * panSpeed);
	}
	else if (Input.GetKey("s")){
		transform.Translate(-Vector3.up * Time.deltaTime * panSpeed);
	}
	
	if (Input.GetKey("d")){
		transform.Translate(Vector3.right * Time.deltaTime * panSpeed);
	}
	else if (Input.GetKey("a")){
		transform.Translate(-Vector3.right * Time.deltaTime * panSpeed);
	}
}