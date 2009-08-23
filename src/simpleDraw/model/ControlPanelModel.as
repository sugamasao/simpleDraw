package simpleDraw.model {

	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.graphics.codec.PNGEncoder;
	import mx.events.*;
	import flash.utils.ByteArray;
	import flash.display.*;
	import flash.events.*;
	import flash.net.FileReference;
	import flash.geom.Matrix;

	import simpleDraw.events.*;

	public class ControlPanelModel {

		private const DEFAULT_NAME:String = "simpleDraw.png";

		private var drawing:Boolean = false;
		private var _drawColor:uint = 0x000000;
		private var _drawSize:uint = 10;

		private var view:UIComponent = null;

		/**
		 * コンストラクタ
		 * 保存する対象のコンポーネントを引数として受け取る
		 */
		public function ControlPanelModel(v:UIComponent) {
			view = v;
		}

		/**
		 * 画像の保存
		 * fr.save を行うには、flex-config.xml の playerversion を 10 系に上げておく必要がある
		 */
		public function onSaveButtonClick(e:MouseEvent):void {
			view.dispatchEvent(new ControlPanelEvent(ControlPanelEvent.SAVE))
		}
		
		public function saveComponent(component:UIComponent):void {
			var pngEncoder:PNGEncoder = new PNGEncoder();
			var bytes:ByteArray = pngEncoder.encode(getBitmapData(component));
			var fr:FileReference = new FileReference();
			fr.addEventListener(Event.COMPLETE, onSaveComplete);
			fr.save(bytes, DEFAULT_NAME);
		}

		/**
		 * bitmap データにピクセルをコピーする
		 */
		private function getBitmapData(component:UIComponent):BitmapData {
			var b:BitmapData = new BitmapData(component.width, component.height);
			b.draw(component, new Matrix());
			return b;
		}

		/**
		 * 画像の保存が終了した場合のイベント。ユーザに通知する
		 */
		private function onSaveComplete(e:Event):void {
			//Alert.show("download completed.") ここもイベントだよね
			trace("end", e)
		}

		/**
		 * リセットボタンを押した場合。
		 * なにも処理はせず、イベントだけ発生させる
		 */
		public function onResetButtonClick(e:MouseEvent):void {
			view.dispatchEvent(new ControlPanelEvent(ControlPanelEvent.RESET))
		}
		
		/**
		 * カラーピッカーの色が変更になった場合に呼ばれる
		 * カラーを保持した、独自イベントを発火させる
		*/
		public function onSelectedColorPicker(e:ColorPickerEvent):void {
			var event:ControlPanelEvent = new ControlPanelEvent(ControlPanelEvent.COLOR_CHANGE, true);
			event.color = e.color;
			view.dispatchEvent(event);
		}
	}
}
