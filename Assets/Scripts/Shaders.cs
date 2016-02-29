using UnityEngine;
using System.Collections;

public class Shaders : MonoBehaviour {


	public Material orignMat;
	public Material mat1;
	public Material mat2;
	public Material mat3;


	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		
	
	}
	public void SetOrignMat()
	{
		if (orignMat != null) 
		{
			GetComponent<Renderer>().material = orignMat;	



		}


	}

	 public void SetMat1()
	{
		if (mat1 != null) 
		{
			GetComponent<Renderer>().material = mat1;	
			
		
		
		}
		

	}
	 public void SetMat2()
	{
		if (mat2 != null) 
		{
			GetComponent<Renderer>().material = mat2;
		

		}
	}
	public void SetMat3()
	{
		if (mat3 != null) {
			GetComponent<Renderer>().material = mat3;
		

	
		}

	}

}
