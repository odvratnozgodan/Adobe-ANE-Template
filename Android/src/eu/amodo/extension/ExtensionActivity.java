package eu.amodo.extension;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class ExtensionActivity extends Activity implements FREExtension {

	public final static String MAIN_ACTIVITY_CLASS_NAME_KEY = "eu.amodo.extension.mainActivityClassNameKey";

	public static final String TAG = "eu.amodo.extension.ExtensionActivity";
	public static FREContext extensionContext;
	public static Context appContext;
	public static String activityClassName;


	public static boolean disposeOnCloseService = false;

	private static ExtensionActivity instance = null;


	// The initialization method. This is the first method to be called.
	public void initialize() {
		Log.i(TAG, "initialize()");
		instance = this;
	}

	// This is the second method to be called.
	public FREContext createContext(String contextType) {
		Log.i(TAG, "createContext()");
		extensionContext = new ExtensionContext();
		return extensionContext;
	}

	public void dispose() {
		Log.i(TAG, "dispose()");
	}

	public static ExtensionActivity getInstance() {
		return instance;
	}

	public static void sendMessage(String str) {
		String eventName = "message";
		if (ExtensionActivity.extensionContext != null) {
			ExtensionActivity.extensionContext.dispatchStatusEventAsync(eventName, str);
		}
	}

	public static void notifyAppReady() {
		Log.i(TAG, "notifyAppReady()");
		String eventName = "appReady";

		ExtensionActivity.extensionContext.dispatchStatusEventAsync(eventName, "");
	}

}
