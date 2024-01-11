package com.nativeappkotlin

import android.app.Application
import com.facebook.react.PackageList
import com.facebook.react.ReactApplication
import com.facebook.react.ReactHost
import com.facebook.react.ReactNativeHost
import com.facebook.react.ReactPackage
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.load
import com.facebook.react.defaults.DefaultReactHost.getDefaultReactHost
import com.facebook.react.defaults.DefaultReactNativeHost
import com.facebook.react.flipper.ReactNativeFlipper
import com.facebook.soloader.SoLoader
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.embedding.engine.dart.DartExecutor.DartEntrypoint

private const val FLUTTER_ENGINE_ID = "flutter_engine"
class MainApplication : Application(), ReactApplication {

    lateinit var flutterEngine : FlutterEngine

  override val reactNativeHost: ReactNativeHost =
      object : DefaultReactNativeHost(this) {
        override fun getPackages(): List<ReactPackage> {
          // Packages that cannot be autolinked yet can be added manually here, for example:
          // packages.add(new MyReactNativePackage());
            val packages: List<ReactPackage> = PackageList(this).packages
            var mutablepackages: MutableList<ReactPackage> = packages.toMutableList()
            mutablepackages.add(ActivityStarterReactPackage())
            val updatedPackages: List<ReactPackage> = mutablepackages
          return updatedPackages
        }

        override fun getJSMainModuleName(): String = "index"

        override fun getUseDeveloperSupport(): Boolean = BuildConfig.DEBUG

        override val isNewArchEnabled: Boolean = BuildConfig.IS_NEW_ARCHITECTURE_ENABLED
        override val isHermesEnabled: Boolean = BuildConfig.IS_HERMES_ENABLED
      }

  override val reactHost: ReactHost
    get() = getDefaultReactHost(this.applicationContext, reactNativeHost)

  override fun onCreate() {
    super.onCreate()

      flutterEngine = FlutterEngine(this)
      flutterEngine.dartExecutor.executeDartEntrypoint(
              DartExecutor.DartEntrypoint.createDefault()
      )

      FlutterEngineCache
              .getInstance()
              .put(FLUTTER_ENGINE_ID, flutterEngine)

    SoLoader.init(this, false)
    if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
      // If you opted-in for the New Architecture, we load the native entry point for this app.
      load()
    }
    ReactNativeFlipper.initializeFlipper(this, reactNativeHost.reactInstanceManager)
  }
}
