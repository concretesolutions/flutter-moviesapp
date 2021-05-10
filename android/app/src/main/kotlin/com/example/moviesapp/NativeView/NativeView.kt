package com.example.moviesapp.NativeView

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import com.bumptech.glide.Glide
import com.example.moviesapp.R
import io.flutter.plugin.platform.PlatformView

class NativeView(context: Context, args: Any?) : PlatformView{

    private val creationParams = args as HashMap<String, Any>?
    private val baseUrl = "https://image.tmdb.org/t/p/w154/"
    private var inflater = LayoutInflater.from(context)
    private val view = inflater.inflate(R.layout.activity_main, null)

    override fun getView(): View {
        val movieTitle = view.findViewById<TextView>(R.id.movie_name)
        val movieDescription = view.findViewById<TextView>(R.id.movie_description)
        val movieReleaseDate = view.findViewById<TextView>(R.id.movie_release_date)
        val moviePoster = view.findViewById<ImageView>(R.id.movie_image)
        val url = baseUrl+creationParams?.get("poster_path")

        movieTitle.text = creationParams?.get("title") as CharSequence?
        movieDescription.text = creationParams?.get("overview") as CharSequence?
        movieReleaseDate.text = creationParams?.get("release_date") as CharSequence?
        Glide.with(moviePoster.context)
                .load(url)
                .into(moviePoster)
        return view
    }

    override fun dispose() {
    }
}
