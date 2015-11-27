/**
 * @author brunoblazinc
 */
package eu.amodo.extension.events
{
	//------	Imports	------//
	import flash.events.Event;

	public class ExtensionEvent extends Event
	{
		public static var MESSAGE:String = "GPSPropertiesEvent.MESSAGE";
		public static var INITIALIZED:String = "GPSPropertiesEvent.INITIALIZED";

		public var text:String = "";
		public var sound:String = "";

		public function ExtensionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		//------	Event listener	------//
		
		
		//------	Util functions	------//
		
	}
}