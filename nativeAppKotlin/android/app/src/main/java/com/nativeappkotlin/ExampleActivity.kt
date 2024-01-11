package com.nativeappkotlin

import androidx.annotation.Nullable;
import android.os.Bundle
import android.view.View
import android.widget.TextView
import android.widget.Toast
import androidx.annotation.CallSuper
import com.facebook.react.ReactActivity
import com.facebook.react.ReactInstanceManager
import com.facebook.react.ReactNativeHost
import com.facebook.react.bridge.CatalystInstance
import com.facebook.react.bridge.ReactContext
import com.facebook.react.bridge.WritableNativeArray
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngineCache
import android.content.Context;
import android.content.Intent

class ExampleActivity : ReactActivity() {

    @CallSuper
    @Override
    protected override fun onCreate(@Nullable savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        startActivity(
            FlutterActivity
                    .withCachedEngine("flutter_engine")
                    .build(this)
        )
//        android.widget.Toast.makeText(this, "hello", Toast.LENGTH_SHORT).show()

    }
}