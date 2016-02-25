import UnityEngine;
import System.Collections ;

var zoomSpeed = 250;

var zoomMin = 30;
var zoomMax = 80;

 var curZoomPos : float ;
 var zoomTo : float ;// curZoomPos will be the value
 var zoomFrom : float = 0f; //Midway point between nearest and farthest zoom values (a "starting position")

function Update ()
     {
         // Attaches the float y to scrollwheel up or down
         var  y : float = Input.mouseScrollDelta.y;
 
         // If the wheel goes up it, decrement 5 from "zoomTo"
         if (y >= 1)
         {
             zoomTo -= 5f;
             Debug.Log ("Zoomed In");
         }
 
         // If the wheel goes down, increment 5 to "zoomTo"
         else if (y >= -1) {
             zoomTo += 5f;
             Debug.Log ("Zoomed Out");
         }

         // creates a value to raise and lower the camera's field of view
         curZoomPos =  zoomFrom + zoomTo;
 
         curZoomPos = Mathf.Clamp (curZoomPos, 1f, 35f);



         //actuall zooming


    	 var camFov: float = Camera.main.fieldOfView;

		 camFov = curZoomPos; 
		 
		 camFov = Mathf.Clamp(camFov, -15f, 35f);
		 
    
}