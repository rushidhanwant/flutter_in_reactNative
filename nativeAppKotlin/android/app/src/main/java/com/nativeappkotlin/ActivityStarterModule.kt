package com.nativeappkotlin

import android.content.Intent
import android.app.Activity;
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import io.flutter.embedding.engine.FlutterEngineCache
import com.facebook.react.bridge.Callback;

class ActivityStarterModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {
    override fun getName(): String {
        return "ActivityStarter"
    }

    @ReactMethod
    fun nativeActivity() {
        val activity: Activity? = getCurrentActivity()
        if (activity != null) {
            val intent = Intent(activity, ExampleActivity::class.java)
            activity.startActivity(intent)
        }
    }

    @ReactMethod
    fun getActivityName(callback: Callback) {
        val activity: Activity? = getCurrentActivity()
        if (activity != null) {
            callback.invoke(activity::class.java.simpleName)
        } else {
            callback.invoke("No current activity")
        }
    }
}

