package com.addcalendareventintent

import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableMap

import android.content.Intent
import android.provider.CalendarContract
import android.provider.CalendarContract.Events
import java.util.Calendar

class AddCalendarEventIntentModule(private val reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return NAME
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  fun multiply(a: Double, b: Double, promise: Promise) {
    promise.resolve(a * b)
  }


  @ReactMethod
  fun addCalendarEventIntent(event: ReadableMap, promise: Promise) {
    try {

      val intent = Intent(Intent.ACTION_INSERT)
        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        .setData(Events.CONTENT_URI)

      // Text
      if (event.hasKey("title"))          intent.putExtra(Events.TITLE, event.getString("title"))
      if (event.hasKey("description"))    intent.putExtra(Events.DESCRIPTION, event.getString("description"))
      if (event.hasKey("location"))       intent.putExtra(Events.EVENT_LOCATION, event.getString("location"))

      // Time
      if (event.hasKey("startAt"))        intent.putExtra(CalendarContract.EXTRA_EVENT_BEGIN_TIME, event.getDouble("startAt").toLong())
      if (event.hasKey("endAt"))          intent.putExtra(CalendarContract.EXTRA_EVENT_END_TIME, event.getDouble("endAt").toLong())
      if (event.hasKey("allDay"))         intent.putExtra(CalendarContract.EXTRA_EVENT_ALL_DAY, event.getBoolean("allDay"))
      if (event.hasKey("recurrenceRule")) intent.putExtra(Events.RRULE, event.getString("recurrenceRule"))

      // Meta
      if (event.hasKey("id"))             intent.putExtra(CalendarContract.EXTRA_EVENT_ID, event.getDouble("id"))

      reactContext.startActivity(intent);

      promise.resolve(null)
    } catch (e: Throwable) {
      promise.reject("AddCalendarEventIntentModuleError", e)
    }
  }

  companion object {
    const val NAME = "AddCalendarEventIntent"
  }
}
