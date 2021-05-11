package com.example.data_plugin

import androidx.room.ColumnInfo
import androidx.room.PrimaryKey
import androidx.room.Entity

@Entity
data class Movie (

    @PrimaryKey val id: Int,
    @ColumnInfo val title: String,
    @ColumnInfo val overview: String,
    @ColumnInfo(name = "poster_path") val posterPath: String,
    @ColumnInfo(name = "release_date") val releaseDate: String

)