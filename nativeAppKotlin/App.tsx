/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * Generated with the TypeScript template
 * https://github.com/react-native-community/react-native-template-typescript
 *
 * @format
 */

import React, {type PropsWithChildren} from 'react';
import {
  StyleSheet,
  Alert,
  Button,
  useColorScheme,
  View,
  NativeModules
} from 'react-native';

import {
  Colors,
} from 'react-native/Libraries/NewAppScreen';


const App = () => {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  return (
        <View style={styles.button}>
          <View style={styles.button}>
            <Button
                style={styles.button}
                title="start native activity"
                onPress={() => NativeModules.ActivityStarter.nativeActivity()}
            />
          </View>
          <View style={styles.button}>
            <Button
                style={styles.button}
                onPress={() => NativeModules.ActivityStarter.getActivityName((name) => { alert(name); })}
                title='Get activity name'
          />
          </View>
        </View>
  );
};

const styles = StyleSheet.create({
 button:{
 marginTop:50
 }
});

export default App;
