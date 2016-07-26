using UnityEngine;
using System.Collections;

public class Shaders : MonoBehaviour {


	public Material[] orignMat;
	public Material[] reflectiveMat;
	public Material[] wireframeMat;
	//public Material mat3;


	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		
	
	}
	public void SetOrignMat(int nIndex)
	{
		for (int i = 0 ; i < nIndex ; i++)
		{
			if (orignMat != null) 
			{

				Material[] mats3 = GetComponent<Renderer>().materials;	
				mats3[i] = orignMat[i];
				GetComponent<Renderer>().materials = mats3;
			}
		}


	}

	public void SetReflectiveMat(int nIndex)
	{
		for (int i = 0 ; i < nIndex ; i++)
		{
			if (reflectiveMat != null) 
			{

				Material[] mats3 = GetComponent<Renderer>().materials;	
				mats3[i] = reflectiveMat[i];
				GetComponent<Renderer>().materials = mats3;
			}
		}

	}

	public void SetWireframeMat(int nIndex)
	{

		for (int i = 0 ; i < nIndex ; i++)
		{
			if (wireframeMat != null) 
		{
				
				Material[] mats3 = GetComponent<Renderer>().materials;	
				mats3[i] = wireframeMat[i];
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
