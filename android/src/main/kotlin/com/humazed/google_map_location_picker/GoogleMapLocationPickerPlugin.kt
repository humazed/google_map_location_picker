package com.humazed.google_map_location_picker

import android.app.Activity
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import androidx.annotation.UiThread
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import java.math.BigInteger
import java.security.MessageDigest


class GoogleMapLocationPickerPlugin(act: Activity) : MethodCallHandler {
    var activity: Activity = act

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "google_map_location_picker")
            channel.setMethodCallHandler(GoogleMapLocationPickerPlugin(registrar.activity()))
        }
    }

    @UiThread
    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        }
        if (call.method == "getSigningCertSha1") {
            try {
                val info: PackageInfo = activity.packageManager.getPackageInfo(call.arguments<String>(), PackageManager.GET_SIGNATURES)
                for (signature in info.signatures) {
                    val md: MessageDigest = MessageDigest.getInstance("SHA1")
                    md.update(signature.toByteArray())

                    val bytes: ByteArray = md.digest()
                    val bigInteger = BigInteger(1, bytes)
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
