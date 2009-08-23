import mx.core.UIComponent;
import mx.events.*;
import flash.events.*;

import simpleDraw.events.*;
import simpleDraw.model.*;

private var simpleDrawModel:SimpleDrawModel = null;

private function init():void {
	simpleDrawModel = new SimpleDrawModel();

	// init canvas
	simpleDrawModel.clearComponentColor(canvas as UIComponent)
	
	// Event add by canvas
	canvas.addEventListener(MouseEvent.MOUSE_MOVE, simpleDrawModel.onDrawStart);
	canvas.addEventListener(MouseEvent.MOUSE_DOWN, simpleDrawModel.onDrawMode);
	canvas.addEventListener(MouseEvent.MOUSE_UP,   simpleDrawModel.onDrawCancel);
	canvas.addEventListener(MouseEvent.MOUSE_OUT,  simpleDrawModel.onDrawCancel);

	// from controlPanel Event
	this.addEventListener(ControlPanelEvent.RESET, onReset);
	this.addEventListener(ControlPanelEvent.COLOR_CHANGE, onColorChange);
}

private function onReset(e:ControlPanelEvent):void {
	simpleDrawModel.clearComponentColor(canvas as UIComponent);
}

private function onColorChange(e:ControlPanelEvent):void {
	simpleDrawModel.drawColor = e.color;
}

