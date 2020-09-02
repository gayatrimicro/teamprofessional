// Set stge resize mode
stage.scaleMode = StageScaleMode.NO_SCALE;
stage.align = StageAlign.TOP_LEFT;
	
// Default xml name
var src:String = "gallery/images.xml";
// Default width
var w:Number = stage.stageWidth;
// Default height
var h:Number = stage.stageHeight;

// Get the parameter from FlashVars
var paramObj:Object = LoaderInfo(this.root.loaderInfo).parameters;

// Setup parameter
for(var paramID:String in paramObj) {
	
	if(paramID == "source") {
	// if source parameter is assigned
		src = paramObj["source"] as String;
	} else if(paramID == "width") {
		w = Number(paramObj["width"]);
	} else if(paramID == "height") {
		h = Number(paramObj["height"]);
	} else {
		if(mycomponent.hasOwnProperty(paramID)) {
			
			// Assign property
			// -- For Number
			if(mycomponent[paramID] is Number) {
				
				// If it is not a color parameter
				if(paramID.indexOf("Color") != -1)
					mycomponent[paramID] = getColorValue(paramObj[paramID] as String);
				else
					mycomponent[paramID] = Number(paramObj[paramID]);
			
			// -- For String
			} else if(mycomponent[paramID] is String)
				mycomponent[paramID] = String(paramObj[paramID]);
			
			// -- For Boolean
			else if(mycomponent[paramID] is Boolean)
				mycomponent[paramID] = ((paramObj[paramID] as String).toLowerCase() == "true")?true:false;		
		}		
	}

}

// Setup size
mycomponent.width = w;
mycomponent.height = h;

// Load xml
mycomponent.load(src);


// Helper function
function getColorValue(color:String):int {
	if(color.indexOf("#") != -1)
		return parseInt(color.substr(1,6),16);
	else
		return parseInt(color.substr(0,6),16);
}