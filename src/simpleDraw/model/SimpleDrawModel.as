package simpleDraw.model {

	import mx.core.UIComponent;
	import mx.events.*;
	import flash.display.*;
	import flash.events.*;

	public class SimpleDrawModel {

		private const DEFAULT_CANVAS_COLOR:uint = 0xFFFFFF;

		private var drawing:Boolean = false;
		private var _drawColor:uint = 0x000000;
		private var _drawSize:uint = 10;

		/**
		 * コンストラクタ
		 * 保存する対象のコンポーネントを引数として受け取る
		 */
		public function SimpleDrawModel() {
		}

		/**
		 * フォントカラーを設定
		 */
		public function set drawColor(color:uint):void {
			_drawColor = color;
		}

		/**
		 * フォントサイズを設定
		 */
		public function set drawSize(size:uint):void {
			_drawSize = size;
		}

		/**
		 * キャンバスに書き出す
		 */
		public function onDrawStart(e:MouseEvent):void {
			if(!drawing) {
				return
			}
			e.target.graphics.lineTo(e.localX, e.localY)
		}
		
		/**
		 * キャンバスに描画する
		 */
		public function onDrawMode(e:MouseEvent):void {
			drawing = true;
			e.target.graphics.lineStyle(_drawSize, _drawColor);
			e.target.graphics.moveTo(e.localX, e.localY);
		}
		
		/**
		 * 描画を辞める
		 */
		public function onDrawCancel(e:MouseEvent):void {
			drawing = false;
		}

		/**
		 * 保存対象のコンポーネントを初期化する
		 */
		 public function clearComponentColor(component:UIComponent):void {
			// 白く塗りつぶす（background-color だと、マウスで描く部分が描画されない）
			component.graphics.lineStyle(1, DEFAULT_CANVAS_COLOR);
			component.graphics.beginFill(DEFAULT_CANVAS_COLOR);
			component.graphics.drawRect(0, 0, component.width, component.height);
			component.graphics.endFill();
		}
	}
}
