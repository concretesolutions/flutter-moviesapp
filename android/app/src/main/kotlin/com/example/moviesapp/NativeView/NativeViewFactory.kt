package com.example.moviesapp.NativeView

import android.content.Context
import com.example.moviesapp.R
import io.flutter.plugin.common.JSONMessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

import kotlin.collections.HashMap

class NativeViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return NativeView(context, args)
    }
}