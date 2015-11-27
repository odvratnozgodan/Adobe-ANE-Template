package {

	import eu.amodo.extension.Extension;
	import eu.amodo.extension.events.ExtensionEvent;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;

public class Main extends Sprite {

	private var _textField:TextField;

    public function Main() {
        _textField = new TextField();
        _textField.text = "Hello, World";
        addChild(_textField);

		addEventListener(Event.ADDED_TO_STAGE, addedToStage_Handler);
    }

	private function addedToStage_Handler(event:Event):void {
		Extension.instance.addEventListener(ExtensionEvent.INITIALIZED, initialized_Handler);
		Extension.initialize();
	}

	private function initialized_Handler(event:ExtensionEvent):void {
		trace("initialized_Handler():", event.text);
		_textField.text += "\nExtension initialized";
	}
}
}
