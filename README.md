# Admob iOS Mediation with Vungle SDK
This is a sample project by using mediation Admob include Ad-Network Vungle.

## Goal
This project may help to reproduce issues and narrow down the root cause.

## Getting Started
This project is not include the app id and placement ids.
Go to your plist file and input your app id, Or you would get a crash:s
```
<key>GADApplicationIdentifier</key>
<string>Your_App_Id</string>
```
Go to the file Constant.m and input your placement ids:
```
NSString* const interstitialPlacement = @"Your_interstitial_placement";
NSString* const rewardPlacement = @"Your_reward_placement";
```

## Manually Integration
1. Check out a new branch
2. Comment podfile's frameworks as below
```
# comment below lines
# pod 'Google-Mobile-Ads-SDK','7.51.0'
# pod 'GoogleMobileAdsMediationVungle','6.3.2.0'
```
3. Run pod install to remove the frameworks from the project
4. Integrate frameworks manually

## Tested SDK Version:
Admob + Adapter + Vungle
7.51.0 + 6.3.2.0 + 6.3.2

## For more details, please check Admob integration document
https://developers.google.com/admob/ios/mediation/vungle

## Note
This version is not support banner yet.
