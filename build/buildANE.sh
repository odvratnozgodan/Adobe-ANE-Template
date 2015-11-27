echo ""
echo "********************************************************************"
echo " - creating ANE package"
date

dcWorkspace="/Users/revolucija/Development";
workspace="..";
extensionName="Extension"
androidFolder="Android"
iosFolder="iOS"
ASFolder="AS/Extension"
ASDefaultFolder="AS/DefaultExtension"


rm -rf android/*
rm -rf android-ARM/*
rm -rf defaultPlatform/*
rm -f "$extensionName".ane Extension.swc
rm -f iOS/*
mkdir -p android
mkdir -p android-ARM
mkdir -p iOS
mkdir -p defaultPlatform

# SWC code
unzip "$workspace"/"$ASFolder"/bin/Extension.swc -d android-ARM
rm -rf android/catalog.xml
unzip "$workspace"/"$ASDefaultFolder"/bin/DefaultExtension.swc -d defaultPlatform
rm -rf defaultPlatform/catalog.xml
unzip "$workspace"/"$ASDefaultFolder"/bin/DefaultExtension.swc -d iOS
rm -rf iOS/catalog.xml

# Android code
cp "$workspace"/"$androidFolder"/bin/Extension.jar android-ARM/Extension.jar
cp -r "$workspace"/"$androidFolder"/res android-ARM

# iOS code
#cp "$workspace"/"$iosFolder"/release/libiOSGPSProperties.a iOS/libiOSGPSProperties.a


cp "$workspace"/"$ASFolder"/bin/Extension.swc Extension.swc
cp "$workspace"/AS/extension.xml extension.xml


cd "$workspace"/ExtensionANE

#adt -package -target ane Extension.ane extension.xml -swc Extension.swc -platform iPhone-ARM -platformoptions platformoptions.xml -C iOS . -platform Android-ARM -platformoptions platformoptions-android.xml -C android-ARM . -platform default -C defaultPlatform . 

adt -package -target ane Extension.ane extension.xml -swc Extension.swc -platform iPhone-ARM -platformoptions platformoptions.xml -C iOS . -platform Android-ARM -platformoptions platformoptions-android.xml -C android-ARM . -platform default -C defaultPlatform . 


echo "-> Copy ANE to ExampleApp/libs"
cp Extension.ane "$workspace"/ExampleApp/libs

#echo "-> Copy ANE to copilot_mobile_framework/libs"
#cp GPSPropertiesExtension.ane "$dcWorkspace"/copilot_mobile_framework/libs

#echo "-> Copy ANE to copilot_mobile_starling_app/libs"
#cp GPSPropertiesExtension.ane "$dcWorkspace"/copilot_mobile_starling_app/libs

#echo "-> Copy ANE to copilot_mobile_starling_app_v2/libs"
#cp GPSPropertiesExtension.ane "$dcWorkspace"/copilot_mobile_starling_app_v2/libs

echo "Done!"
echo ""