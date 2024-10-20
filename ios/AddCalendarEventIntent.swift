import Foundation
import EventKit
import EventKitUI

@objc(AddCalendarEventIntent)
class AddCalendarEventIntent: NSObject, EKEventEditViewDelegate {

  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a*b)
  }

  @objc
  func addCalendarEventIntent(
    _ event: NSDictionary,
    _ resolve: @escaping RCTPromiseResolveBlock,
    _ reject: @escaping RCTPromiseRejectBlock
  ) {
    DispatchQueue.main.async {                                      // Everything has to be done on the main thread
      let store = EKEventStore()
      let calendarEvent = EKEvent(eventStore: store)
      
      // Text
      if let title = event["title"] as? String {
        calendarEvent.title = title
      }
      if let description = event["description"] as? String {
        calendarEvent.notes = description
      }
      if let location = event["location"] as? String {
        calendarEvent.location = location
      }
      
      // Time
      if let startAt = event["startAt"] as? Double {
        let startAtConverted = Date(timeIntervalSince1970: startAt / 1000)
        calendarEvent.startDate = startAtConverted
      }
      if let endAt = event["endAt"] as? Double {
        let endAtConverted = Date(timeIntervalSince1970: endAt / 1000)
        calendarEvent.endDate = endAtConverted
      }
      if let allDay = event["allDay"] as? Bool {
        calendarEvent.isAllDay = allDay
      }
      if let recurrenceRule = event["recurrenceRule"] as? String {
        // Todo
        // It is not possible to use an RRULE String on iOS
        // But it is possible to use a EKRecurrenceRule
        // You have to convert the RRULE String to a EKRecurrenceRule
      }
      
      // Meta
      if let id = event["id"] as? Double {
        // Todo
        // calendarEvent.eventIdentifier is read only
        // Probably no id support simliar to Android
      }

      let eventViewController = EKEventEditViewController()
      eventViewController.event = calendarEvent
      eventViewController.eventStore = store
      eventViewController.editViewDelegate = self

      if let rootViewController = UIApplication.shared.delegate?.window??.rootViewController {
        rootViewController.present(eventViewController, animated: true, completion: nil)
      }

      resolve(true)
    }
  }

  func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
    controller.dismiss(animated: true, completion: nil)
  }

  @objc(requiresMainQueueSetup)
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
