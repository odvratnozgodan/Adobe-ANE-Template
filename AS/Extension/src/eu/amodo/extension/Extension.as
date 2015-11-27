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
			extContext = ExtensionContext.createExtensionContext( "eu.amodo.extension", null );

			if ( !extContext ) {
				throw new Error( "Extension native extension is not supported on this platform." );
			}

			extContext.addEventListener( StatusEvent.STATUS, onStatus );
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
			Extension.instance;
		}

		public static function dispose():void{
			Extension.instance.disposeExtension();
		}

		//----------------------------------------
		//
		// Private methods
		//
		//----------------------------------------

		private function init():void {
			extContext.call( "init");
		}

		/**
		 * Cleans up the instance of the native extension.
		 */
		private function disposeExtension():void {
			extContext.call( "dispose" );
			extContext.dispose();
		}

		private function onStatus( event:StatusEvent ):void {
			if(event.code == "message"){
				message(event.level);
			}else if(event.code == "appReady"){
				appInitialized();
			}
		}

		private function message(str:String):void{
			trace("Message from Extension: " + str);
			var msgEvent:ExtensionEvent = new ExtensionEvent(ExtensionEvent.MESSAGE);
			msgEvent.text = str;
			dispatchEvent(msgEvent);
		}

		private function appInitialized():void{
			trace("[Extension initialized]");
			_isInitialized = true;
			var initEvent:ExtensionEvent = new ExtensionEvent(ExtensionEvent.INITIALIZED);
			initEvent.text = "Extension ready.";
			dispatchEvent(initEvent);
		}


	}
}

class SingletonEnforcer {

}