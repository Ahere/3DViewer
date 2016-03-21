using UnityEngine;
using System.Collections;

[RequireComponent(typeof(MeshCollider))]

public class Drag : MonoBehaviour 
{

	private Vector2 screenPoint;
	private Vector2 offset;
	private Vector2 objPosition;
	private bool drag = false;

	void OnMouseDown()
	{
		
			screenPoint = Camera.main.WorldToScreenPoint (gameObject.transform.position);

			// its position subracted from the position of the mouse.
			objPosition = new Vector2 (gameObject.transform.position.x, gameObject.transform.position.y);
			offset = objPosition - (Vector2)Camera.main.ScreenToWorldPoint (new Vector2 (Input.mousePosition.x, Input.mousePosition.y));
			Debug.Log (screenPoint + "screenPoint");
			Debug.Log (offset + "offset");
			drag = true;
		    Debug.Log (drag);



	}

	void OnMouseDrag()
	{   
		//if  (drag == true) 
		{

			//new vector3 assiged with the mouse positions.
			Vector2 curScreenPoint = new Vector2 (Input.mousePosition.x, Input.mousePosition.y);
			//We add the offset to the Mouse postion.
			Vector2 curPosition = (Vector2)Camera.main.ScreenToWorldPoint (curScreenPoint) + offset;
			//assing it to the object.
			transform.position = curPosition;
			drag = false;

		}



	}

}