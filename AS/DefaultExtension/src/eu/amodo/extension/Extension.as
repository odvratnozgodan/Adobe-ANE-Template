/**
 * Created by revolucija on 25/11/15.
 */
package eu.amodo.extension {
	import eu.amodo.extension.events.ExtensionEvent;

	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;

	public class Extension extends EventDispatcher {

		private var extContext:ExtensionContext;
		private static var _instance:Extension;

		private static var _isInitialized:Boolean = false;
		private static var _enabled:Boolean=false;
		private static var _suported:Boolean = true;

		public function Extension(enforcer:SingletonEnforcer) {
			//
		}

		//----------------------------------------
		//
		// Public methods
		//
		//----------------------------------------

		public static function get instance():Extension {
			if ( !_instance ) {
				_instance = new Extension( new SingletonEnforcer() );
				_instance.init();
			}

			return _instance;
		}

		public static function get enabled():Boolean
		{
			return _enabled;
		}

		public static function get isInitialized():Boolean{
			return _isInitialized;
		}

		public static function get suported():Boolean
		{
			return _suported;
		}

		public static function initialize():void{
			//
		}

		public static function dispose():void{
			//
		}

		//----------------------------------------
		//
		// Private methods
		//
		//----------------------------------------

		private function init():void {
			//
		}

		/**
		 * Cleans up the instance of the native extension.
		 */
		private function disposeExtension():void {
			//
		}

		private function onStatus( event:StatusEvent ):void {
			//
		}

		private function message(str:String):void{
			//
		}

		private function appInitialized():void{
			//
		}


	}
}

class SingletonEnforcer {

}