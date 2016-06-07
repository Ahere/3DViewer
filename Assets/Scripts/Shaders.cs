using UnityEngine;
using System.Collections;

public class Shaders : MonoBehaviour {


	public Material orignMat;
	public Material mat1;
	public Material[] mat2;
	//public Material mat3;


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

	 public void SetMat2(int nIndex)
	{

		for (int i = 0 ; i < nIndex ; i++)
		{
		if (mat2 != null) 
		{
				
				Material[] mats3 = GetComponent<Renderer>().materials;	
				mats3[i] = mat2[i];
				GetComponent<Renderer>().materials = mats3;
		}
		}
	}
	//public void SetMat3()
	//{
	//	if (mat3 != null) {
	//		GetComponent<Renderer>().material = mat3;
		

	
	//	}

//	}

}
