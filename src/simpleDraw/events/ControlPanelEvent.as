package simpleDraw.events {
	import flash.events.Event;

	public class ControlPanelEvent extends Event {
		
		public static const RESET:String = "ControlPanelEvent_reset"
		public static const SAVE:String = "ControlPanelEvent_save"
		public static const COLOR_CHANGE:String = "ControlPanelEvent_color_change"
		public static const SIZE_CHANGE:String = "ControlPanelEvent_size_change"

		private var _size:uint = 0; // ペンサイズが変更された場合に値が格納されます
		private var _color:uint = 0x000000; // ペンのカラーが変更された場合に値が格納されます

		public function ControlPanelEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}

		public function set size(s:uint):void {
			_size = s;
		}

		public function get size():uint {
			return _size;
		}

		public function set color(c:uint):void {
			_color = c;
		}

		public function get color():uint {
			return _color;
		}

		public override function clone():Event {
			var e:ControlPanelEvent = new ControlPanelEvent(type, bubbles, cancelable);
			e.color = _color;
			e.size  = _size;
			return e;
		}

		public override function toString():String {
			return formatToString("ControlPanelEvent", "type", "bubbles", "cancelable", "eventPhase", "_color", "_size");
		}

	}
}
