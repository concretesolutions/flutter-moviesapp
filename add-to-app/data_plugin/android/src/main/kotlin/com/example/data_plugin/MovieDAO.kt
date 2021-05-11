package com.example.data_plugin

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.Query

@Dao
interface MovieDAO {

    @Query("SELECT * FROM movie")
    fun getAll(): List<Movie>

    @Insert
    fun insert(movie: Movie)

    @Delete
    fun delete(movie: Movie)

}