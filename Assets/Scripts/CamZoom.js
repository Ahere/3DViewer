
var zoomSpeed = 1;

var zoomMin = 5;
var zoomMax = 120;


//var curZoomPos : float ;
// var zoomTo : float ;// curZoomPos will be the value
// var zoomFrom : float = 60f; //Midway point between nearest and farthest zoom values (a "starting position")

function Update ()
     {
     var camFov: float = Camera.main.fieldOfView;
     // Attaches the float y to scrollwheel up or down
      var  y : float = Input.GetAxis("Mouse ScrollWheel");
     // Debug.Log(y);
 
        // If the wheel goes up it, decrement 5 from "zoomTo"
          if (y > 0)
        {
            camFov += zoomSpeed;
            

         }


         if (y < 0)
        {
        	camFov -= zoomSpeed;
        	
        }
    
         
 
		 camFov = Mathf.Clamp(camFov, zoomMin, zoomMax);
		 Camera.main.fieldOfView = camFov;
    
}