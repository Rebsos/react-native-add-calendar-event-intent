import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-add-calendar-event-intent' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const AddCalendarEventIntent = NativeModules.AddCalendarEventIntent
  ? NativeModules.AddCalendarEventIntent
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

interface AddCalendarEventIntent {
  title?: string;
  description?: string;
  location?: string;
  startAt?: number;
  endAt?: number;
  allDay?: boolean;
  id?: number;
  recurrenceRule?: string; // This is a specification, see https://tools.ietf.org/html/rfc5545#section-3.3.10 Example: 'FREQ=DAILY;COUNT=3'
}

export function addCalendarEventIntent(
  addCalendarEvent: AddCalendarEventIntent
): Promise<void> {
  return AddCalendarEventIntent.addCalendarEventIntent(addCalendarEvent);
}
