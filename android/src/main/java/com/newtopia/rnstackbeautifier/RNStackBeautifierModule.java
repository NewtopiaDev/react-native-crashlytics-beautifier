
package com.newtopia.rnstackbeautifier;

import android.widget.Toast;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import java.util.Map;
import java.util.HashMap;

public class RNStackBeautifierModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNStackBeautifierModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNStackBeautifier";
  }
  @ReactMethod
  public void show(String message, int duration) {
    Toast.makeText(getReactApplicationContext(), message, duration).show();
  }
}