package com.example.moviesapp.NativeView

import android.content.Context
import android.content.pm.ApplicationInfo
import android.graphics.Color
import android.os.Build
import android.view.LayoutInflater
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import androidx.annotation.RequiresApi
import androidx.core.content.ContextCompat
import androidx.core.graphics.drawable.DrawableCompat
import com.bumptech.glide.Glide
import com.example.moviesapp.R
import com.example.moviesapp.databinding.ActivityMainBinding
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

class NativeView(context: Context, args: Any?, flutterEngine: FlutterEngine) : PlatformView {

    private val creationParams = args as HashMap<String, Any>?
    private val baseUrl = "https://image.tmdb.org/t/p/w154/"
    private var inflater = LayoutInflater.from(context)
    private val view =  inflater.inflate(R.layout.activity_main, null)
    private val channel = "com.moviesapp.isFavorited"
    private val engine = flutterEngine
    private val movieTitle = view.findViewById<TextView>(R.id.movie_name)
    private val movieDescription = view.findViewById<TextView>(R.id.movie_description)
    private val movieReleaseDate = view.findViewById<TextView>(R.id.movie_release_date)
    private val moviePoster = view.findViewById<ImageView>(R.id.movie_image)
    private var favoritesButton = view.findViewById<ImageView>(R.id.favorites_button)
    private var check = true

    override fun getView(): View {
        val url = baseUrl + creationParams?.get("poster_path")
        movieTitle.text = creationParams?.get("title") as CharSequence?
        movieDescription.text = creationParams?.get("overview") as CharSequence?
        movieReleaseDate.text = creationParams?.get("release_date") as CharSequence?
        Glide.with(moviePoster.context)
                .load(url)
                .into(moviePoster)

        onClickListener()
        return view
    }

    override fun dispose() {

    }

    private fun onButtonClick(){
        MethodChannel(engine.dartExecutor.binaryMessenger, channel).invokeMethod("", null)
    }

    private fun onClickListener() {

        favoritesButton.setOnClickListener {

            if (check) {
                favoritesButton.setColorFilter(R.color.light_grey)
                !check
            } else {
                favoritesButton.setColorFilter(R.color.light_grey)
                check
            }
            onButtonClick()
        }
    }

}
