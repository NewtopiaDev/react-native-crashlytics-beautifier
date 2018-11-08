
# react-native-stack-beautifier

## Getting started

`$ npm install react-native-stack-beautifier --save`

### Mostly automatic installation

`$ react-native link react-native-stack-beautifier`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-stack-beautifier` and add `RNStackBeautifier.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNStackBeautifier.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.newtopia.rnstackbeautifier.RNStackBeautifierPackage;` to the imports at the top of the file
  - Add `new RNStackBeautifierPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-stack-beautifier'
  	project(':react-native-stack-beautifier').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-stack-beautifier/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-stack-beautifier')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNStackBeautifier.sln` in `node_modules/react-native-stack-beautifier/windows/RNStackBeautifier.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Stack.Beautifier.RNStackBeautifier;` to the usings at the top of the file
  - Add `new RNStackBeautifierPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNStackBeautifier from 'react-native-stack-beautifier';

// TODO: What to do with the module?
RNStackBeautifier;
```
  