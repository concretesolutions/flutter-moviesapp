package com.example.moviesapp

import android.os.Bundle
import android.os.PersistableBundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.flutter.moviesapp/moviesapp"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine){
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler{ methodCall, result ->
            if (methodCall.method == "Print"){
                result.success("From kotlin")
            }
        }

    }
}


