
package com.newtopia.rncrashlyticsbeautifier;

import android.widget.Toast;
import android.util.Log;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.common.JavascriptException;
import com.facebook.react.util.JSStackTrace;
import com.crashlytics.android.Crashlytics;

import java.util.Map;
import java.util.HashMap;

public class RNCrashlyticsBeautifierModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

    public RNCrashlyticsBeautifierModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNCrashlyticsBeautifier";
    }

    @ReactMethod
    public void recordException(String title, ReadableArray frameArray, boolean isFatal) {
        StackTraceElement[] stackTrace = new StackTraceElement[frameArray.size()];
        for (int i = 0; i < frameArray.size(); i++) {
            ReadableMap map = frameArray.getMap(i);
            String functionName = map.hasKey("methodName") ? map.getString("methodName")+'@' : "Unknown Function@";
            functionName += map.hasKey("lineNumber") ? map.getInt("lineNumber") : "0";
            StackTraceElement stack = new StackTraceElement(
                    "",
                    functionName,
                    map.getString("file"),
                    map.hasKey("column") ? map.getInt("column") : -1
            );
            stackTrace[i] = stack;
        }
        JavascriptException jse = new JavascriptException(JSStackTrace.format(title,frameArray));
        jse.setStackTrace(stackTrace);
        if(isFatal){
            throw jse;
        }else{
            Crashlytics.logException(jse);
        }
    }
}