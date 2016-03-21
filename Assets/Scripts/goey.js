import UnityEngine;
import UnityEngine.SceneManagement;

//
//var model1 : String;
//var model2 : String;
//var model3 : String;
//var model4 : String;

//add button names here

//var skinny : GUISkin;

//var buttonWidth = 95.0; //modifies buttonWidth, for longer Strings
//public var scene : String; 
var resetScene : String;
var soundEnabled = true;
var guiEnabled = true;

private var screenwidth = Screen.width;
private var screenhieght = Screen.height;

function Update (){
	if (Input.GetKeyDown("escape")){
		Application.Quit();
	}
	if (Input.GetKeyDown("r")) {
    	SceneManager.LoadScene(resetScene);
    }
	if (Input.GetKeyDown("m") && soundEnabled){
		GetComponent(AudioListener).enabled = false;
		soundEnabled = false;
	}
	else if (Input.GetKeyDown("m") && !soundEnabled){
		GetComponent(AudioListener).enabled = true;
		soundEnabled = true;
	}
	if (Input.GetKeyDown("h") && guiEnabled){
		guiEnabled = false;
	}
	else if (Input.GetKeyDown("h") && !guiEnabled){
		guiEnabled = true;
	}
}

//	//function OnGUI () {
//		if (guiEnabled){
//			GUI.skin = skinny;
//			
//			GUI.Label (Rect(screenwidth - 175, screenhieght - 50, 200, 30), "3D model visualizer v1");
//			GUI.Label (Rect(screenwidth - 130, screenhieght - 30, 200, 30), "by Fusobotic");
//			
//			GUI.Label (Rect(15, screenhieght - 60, 500, 30), "Hit M to mute audio, H to hide user interface");
//			GUI.Label (Rect(20, screenhieght - 40, 500, 30), "Hit R to reset view and Escape to quit");
//			
//			GUI.Label (Rect(screenwidth - 310, 30, 500, 30), "Left click to rotate, middle click to zoom");
//			GUI.Label (Rect(screenwidth - 250, 60, 500, 30), "Alt-Left click to adjust lights");
//			GUI.Label (Rect(screenwidth - 175, 90, 500, 30), "WASD to pan");
		
	//add additional buttons/scenes here, remember to go 40 units down, and one up on the LoadLevel and "model#"
	public function LoadNext(scene : String )
	{ 
//	public var scene : String;
	SceneManager.LoadScene(scene);

//				Application.LoadLevel(scene);
//		}
//		if (GUI.Button (Rect (20,60,buttonWidth,25), model2)) {
//			Application.LoadLevel(1);
//		}
//		if (GUI.Button (Rect (20,100,buttonWidth,25), model3)) {
//			Application.LoadLevel(2);
//		}
//		if (GUI.Button (Rect (20,140,buttonWidth,25), model4)) {
//			Application.LoadLevel(3);
//		}
//	}
}