# react-native-add-calendar-event-intent

Add an event to the user's calendar using an intent.

## Installation

```sh
npm install react-native-add-calendar-event-intent
```


## Usage

```js
import { addCalendarEventIntent } from 'react-native-add-calendar-event-intent';

// ...

await addCalendarEventIntent({
  title: 'My title',
  description: 'My description',
  location: 'Berlin',
  // startAt: new Date(match.startAt).getTime(),
  // endAt: new Date(match.startAt).getTime() + 1000 * 60 * 120,
  // allDay: true,
  // recurrenceRule: 'FREQ=DAILY;COUNT=3',
  // id: 123,
});
```


## Why?

- React Native Linking sendIntent does not work on iOS
- React Native Linking sendIntent is too limited to add calendar events on Android. Long: There is no data and flags support, just extras and actions. [See IntentModule.java](https://github.com/facebook/react-native/blob/main/packages/react-native/ReactAndroid/src/main/java/com/facebook/react/modules/intent/IntentModule.java). But we need something like setData(Events.CONTENT_URI). See [here](https://github.com/react-native-community/discussions-and-proposals/issues/623) and [here](https://stackoverflow.com/questions/14694931/insert-event-to-calendar-using-intent))
- React Native Linking openURL does not work with intent://
- React Native Linking openURL does work with content://, but you can't pass extras, flags and actions
- The ics way seems to be a dead end for iOS. See [here](https://www.reddit.com/r/reactnative/comments/gh7y60/how_to_create_and_download_files_like_ics/).
- react-native-send-intent package does not work on iOS
- Other packages require user permissions
- No dependencies
- Very tiny
- Used in production
- TypeScript ready
- New architecture ready
- Old architecture supported


## Properties

Every property is optional

| property | type | Android support | iOS support | hint |
|---|---|---|---|---|
| title | string | yes | yes |  |
| description | string | yes | yes |  |
| location| string | yes | yes |  |
| startAt | number | yes | yes | ms since 1.1.1970 |
| endAt | number | yes | yes | ms since 1.1.1970 |
| allDay | boolean | yes | yes| default: false |
| recurrenceRule | string| yes | no | RRULE format |
| id | number | yes | no |  |


## License

MIT
