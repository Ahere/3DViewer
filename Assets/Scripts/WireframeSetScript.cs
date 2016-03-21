using UnityEngine;
using System.Collections;

public class WireframeSetScript : MonoBehaviour 
{
	
	

	public void Framer () 
	{
		if (GetComponent<WireFrameScript>().enabled == true) 
		{
			GetComponent<WireFrameScript>().enabled = false;

	
		}


		else if (GetComponent<WireFrameScript>().enabled == false)
		{
			GetComponent<WireFrameScript>().enabled = true;

		}


    }


}
