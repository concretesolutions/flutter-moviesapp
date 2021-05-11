package com.example.data_plugin

import androidx.room.Database
import androidx.room.RoomDatabase

@Database(entities = [Movie::class], version = 1)
abstract class AppDatabase: RoomDatabase() {
    abstract fun movieDAO(): MovieDAO
}