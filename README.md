
# react-native-crashlytics-beautifier

## Getting started

`$ npm install react-native-crashlytics-beautifier --save`

### Mostly automatic installation

`$ react-native link react-native-crashlytics-beautifier`

Add `pod 'react-native-crashlytics-beautifier', :path => '../node_modules/react-native-crashlytics-beautifier'` into your podfile and execute `pod install`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-crashlytics-beautifier` and add `RNCrashlyticsBeautifier.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCrashlyticsBeautifier.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.newtopia.rncrashlyticsbeautifier.RNCrashlyticsBeautifierPackage;` to the imports at the top of the file
  - Add `new RNCrashlyticsBeautifierPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-crashlytics-beautifier'
  	project(':react-native-crashlytics-beautifier').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-crashlytics-beautifier/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-crashlytics-beautifier')
  	```

# Usage
```javascript
import RNCrashlyticsBeautifier from 'react-native-crashlytics-beautifier';
```
---
### Initialize RNCrashlyticsBeautifier to catch all fatal exceptions and log stack trace to crashlytics
```
RNCrashlyticsBeautifier.init();
```
---
### Manually Log stack trace of any exception to crashlytics
#### Arguments
| arg     | type    | description                                                |
| ------- | ------- | ---------------------------------------------------------- |
| error   | Error   | Error object to log to crashlytics                         |
| isFatal | Boolean | True for fatal exception and false for non-fatal exception |
|         |         |                                                            |
```
RNCrashlyticsBeautifier.log(error, isFatal)
```
# Examples
```
const error = new Error('Invalid Response')
RNCrashlyticsBeautifier.log(error, false)
```
