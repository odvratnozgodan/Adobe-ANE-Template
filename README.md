# Adobe Native Extension template

This is a template for a Adobe Native Extension. It is setup to work specificaly with Intellij IDEA but can adapted to work with another IDE. The projects are bare bones. It's purpose is to automate the setup and build workflow.

## The structure of the folders:
1. Android - the native android project code, the android library can be built with the build_android_library.xml build script
2. AS
	* Extension - the ActionScript 3 code for the extension
	* DefaultExtension - the default(blank) implementation of ActionScript 3 code for the extension. This should only have implemented blank methods. It is used when we want to develop an extension that supports certain platforms but not others. In that case we use this project for the platforms we don't want to support. Eg. extension for mobile app but has a default implementation so the app can be run/debug on desktop.
3. build - the scripts for building the extension are located here
4. ExampleApp - the test app project code, used for testing the extension
5. ExtensionANE - the folder where the extension is located.
6. iOS - the native iOS project code, has to be built with XCode


