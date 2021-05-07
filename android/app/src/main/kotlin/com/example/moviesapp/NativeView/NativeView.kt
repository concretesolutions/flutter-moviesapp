package com.example.moviesapp.NativeView

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import com.example.moviesapp.R
import io.flutter.plugin.platform.PlatformView

class NativeView(context: Context) : PlatformView {
    private var inflater = LayoutInflater.from(context)

    override fun getView(): View {
        return inflater.inflate(R.layout.activity_main, null)
    }

    override fun dispose() {}
}

