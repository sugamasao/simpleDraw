import mx.core.UIComponent;
import mx.events.*;
import flash.events.*;

import simpleDraw.events.*;
import simpleDraw.model.*;

private var controlPanelModel:ControlPanelModel = null;
private var canvas:Canvas = null;

private function init():void {
	controlPanelModel = new ControlPanelModel(this as UIComponent);
	canvas = parentDocument.canvas;
	
	// Event add by save button
	save.addEventListener(MouseEvent.CLICK, controlPanelModel.onSaveButtonClick);
	
	// Event add by reset button
	reset.addEventListener(MouseEvent.CLICK, controlPanelModel.onResetButtonClick)

	// Event add by colorPickerToolTip
	colorPicker.addEventListener(ColorPickerEvent.CHANGE, controlPanelModel.onSelectedColorPicker)

	this.addEventListener(ControlPanelEvent.SAVE, onSave);
}

/**
 * save ボタンが押されたら、保存処理を呼ぶ
 */
private function onSave(e:ControlPanelEvent):void {
	controlPanelModel.saveComponent(canvas as UIComponent);
}

