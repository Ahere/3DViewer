using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class PolyCount : MonoBehaviour {

    public Text triangleCountText;
    public int numTriangles;

	// Use this for initialization
	void Start () 
	{   
        if (gameObject.GetComponent<SkinnedMeshRenderer>())
        {
			numTriangles = gameObject.GetComponent<SkinnedMeshRenderer>().sharedMesh.triangles.Length/3;
	        Debug.Log(numTriangles);
	        triangleCountText.text = "PolyCount = " + numTriangles.ToString();
        }

        else
        {
        	 numTriangles = gameObject.GetComponent<MeshFilter>().mesh.triangles.Length/3;
             Debug.Log(numTriangles);
             triangleCountText.text ="PolyCount = " + numTriangles.ToString();

        }
       


	
	}
	
	// Update is called once per frame
	void Update () 
	{
	
	}
}
