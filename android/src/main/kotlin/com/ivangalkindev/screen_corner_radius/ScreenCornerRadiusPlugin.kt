package com.ivangalkindev.screen_corner_radius

import android.app.Activity
import android.content.Context
import android.os.Build
import android.view.RoundedCorner
import android.view.View
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ScreenCornerRadiusPlugin */
class ScreenCornerRadiusPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private lateinit var activity: Activity

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "screen_corner_radius")
    channel.setMethodCallHandler(this)
    this.context = flutterPluginBinding.applicationContext
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    this.activity = binding.activity;
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "getScreenCornerRadius" -> {
        val view = activity.window.decorView.rootView
        val cornerRadius = getCornerRadius(view)
        result.success(cornerRadius)
      }
      else -> result.notImplemented()
    }
  }

  private fun getCornerRadius(view: View): Map<String, Double?>? {
    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
      return null
    }

    val density = this.activity.resources.displayMetrics.density.toDouble()
    if (density == 0.0) {
      return null
    }

    val insets = view.rootWindowInsets
    val topLeft = insets?.getRoundedCorner(RoundedCorner.POSITION_TOP_LEFT)?.radius?.toDouble()
    val topRight = insets?.getRoundedCorner(RoundedCorner.POSITION_TOP_RIGHT)?.radius?.toDouble()
    val bottomLeft = insets?.getRoundedCorner(RoundedCorner.POSITION_BOTTOM_LEFT)?.radius?.toDouble()
    val bottomRight = insets?.getRoundedCorner(RoundedCorner.POSITION_BOTTOM_RIGHT)?.radius?.toDouble()
    if (topLeft == null || topRight == null || bottomLeft == null || bottomRight == null) {
      return null
    }

    return mapOf(
      "topLeft" to topLeft / density,
      "topRight" to topRight / density,
      "bottomLeft" to bottomLeft / density,
      "bottomRight" to bottomRight / density
    )
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onDetachedFromActivityForConfigChanges() {}

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    this.activity = binding.activity;
  }

  override fun onDetachedFromActivity() {}
}
