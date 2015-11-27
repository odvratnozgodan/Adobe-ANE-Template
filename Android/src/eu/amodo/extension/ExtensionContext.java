package eu.amodo.extension;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import eu.amodo.extension.functions.DisposeFunction;
import eu.amodo.extension.functions.InitFunction;

import java.util.HashMap;
import java.util.Map;

public class ExtensionContext extends FREContext {

	public static final String TAG = "eu.amodo.extension.ExtensionContext";

	@Override
	public void dispose() {
		Log.d(TAG, "Context disposed.");
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> functions = new HashMap<String, FREFunction>();

		functions.put("init", new InitFunction());
		functions.put("dispose", new DisposeFunction());
		return functions;
	}
}
