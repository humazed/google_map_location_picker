package com.humazed.google_map_location_picker

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.security.NoSuchAlgorithmException
import java.security.MessageDigest
import android.content.pm.PackageManager
import android.content.pm.PackageInfo
import androidx.annotation.UiThread
import android.app.Activity
import java.math.BigInteger


class GoogleMapLocationPickerPlugin(act: Activity): MethodCallHandler {
  var activity: Activity;

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "google_map_location_picker")
      channel.setMethodCallHandler(GoogleMapLocationPickerPlugin(registrar.activity()))
    }
  }

  init {
    activity = act;
  }

  @UiThread
  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    }
    if (call.method == "getSigningCertSha1") {
        try {
            val info: PackageInfo = activity.getPackageManager().getPackageInfo(call.arguments<String>(), PackageManager.GET_SIGNATURES)
            for (signature in info.signatures) {
                val md: MessageDigest = MessageDigest.getInstance("SHA1")
                md.update(signature.toByteArray())

                val bytes: ByteArray = md.digest()
                val bigInteger: BigInteger = BigInteger(1, bytes)
                val hex: String = String.format("%0" + (bytes.size shl 1) + "x", bigInteger)
        
                result.success(hex)
            }
        } catch (e: Exception) {
            result.error("ERROR", e.toString(), null)
        }
    } else {
      result.notImplemented()
    }
  }
}
