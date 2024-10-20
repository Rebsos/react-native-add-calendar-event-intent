import { StyleSheet, View, Text, Pressable } from 'react-native';
import { addCalendarEventIntent } from 'react-native-add-calendar-event-intent';

export default function App() {
  return (
    <View style={styles.container}>
      <Pressable
        onPress={async () => {
          await addCalendarEventIntent({
            title: 'My title',
            description: 'My description',
            location: 'Berlin',
            startAt: new Date().getTime(),
            endAt: new Date().getTime() + 1000 * 60 * 120,
            // allDay: true,
            // recurrenceRule: 'FREQ=DAILY;COUNT=3',
            // id: 123,
          });
        }}
      >
        <Text>PRESS</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
