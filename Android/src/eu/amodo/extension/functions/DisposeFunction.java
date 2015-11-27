package eu.amodo.extension.functions;

import android.content.Context;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import eu.amodo.extension.ExtensionActivity;

public class DisposeFunction implements FREFunction {

	public static final String TAG = "eu.amodo.extension.functions.DisposeFunction";
	
	public FREObject call(FREContext context, FREObject[] args) {
		Context appContext = ExtensionActivity.getInstance().appContext;
		return null;
	}

}
