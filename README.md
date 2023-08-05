# Gesturedeck SDK - iOS

## Overview

Revolutionize your iOS app's user experience with the extraordinary power of Gesturedeck! Seamlessly integrated into your iOS application, Gesturedeck empowers users to effortlessly control their devices through intuitive touch gestures, without even needing to look at the screen.

Imagine enhancing your app with the ability to adjust volume, skip tracks, and perform various actions effortlessly, making interactions smoother and more natural than ever before. Whether users are driving, biking, or engaged in any activity that demands their full attention, Gesturedeck ensures a seamless experience that enhances productivity and safety.

## Key Features

- Intuitive touch gestures for seamless device control.
- Customizable gesture actions for enhanced user interactions.
- Integrated GesturedeckMedia for media app controls with overlay UI support.
- Support for volume button actions with GesturedeckMedia.
- Sensitivity settings for fine-tuning gesture responsiveness.
- Does not require internet connectivity

## Gesturedeck

Gesturedeck is the low-level API that allows you to build custom functionalities on top of Gesturedeck's gestures. Without introducing any additional UI, your app gains access to powerful gesture controls that redefine user interactions.

### Getting Started with Gesturedeck

To integrate Gesturedeck into your iOS app, you must add the Gesturedeck framework to your project. You can easily do that using Swift Package Manager (SPM). Through Xcode, go to Package Dependencies, click `+`` and simply use the URL of this repo. SPM will fetch and add the framework automatically. 

After adding the framework, follow the steps below to integrate it with your app.

#### Step 1: Import GesturedeckiOS

Import the GesturedeckiOS module into your Swift class:

```swift
import GesturedeckiOS
```

#### Step 2: Choose Integration Option

Select one of the following options based on your app's setup:

##### Option 1: Using AppDelegate

It is recommended to initialize the SDK in the `applicationDidBecomeActive` or later event, as the window might not be initialized in the `didFinishLaunchingWithOptions` lifecycle event.

##### Option 2: Using SceneDelegate

Initialize the SDK in the `sceneDidBecomeActive` event or later.

```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  var gesturedeck: Gesturedeck?

  ...

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    
    gesturedeck = Gesturedeck()
    gesturedeck?.tapAction = {
        print("Tapped")
    }

    gesturedeck?.swipeLeftAction = {
        print("Swiped Left")
    }

    gesturedeck?.swipeRightAction = {
        print("Swiped Right")
    }
  }
}
```

##### Option 3: SwiftUI Integration

If you're using SwiftUI, there is no need for AppDelegate or SceneDelegate.

```swift
@main
struct gesturedeckApp: App {
    @Environment(\.scenePhase) var scenePhase
    @State var gesturedeck: Gesturedeck?
```

```swift
var body: some Scene {
    WindowGroup {
        ...
    }
    .onChange(of: scenePhase) { phase in
        if phase == .active {
            gesturedeck = Gesturedeck()
            gesturedeck?.tapAction = { callback in
                print("Tapped")
                callback(true)  // Without a callback, no icon is displayed
            }

            gesturedeck?.swipeLeftAction = {
                print("Swiped Left")
            }

            gesturedeck?.swipeRightAction = {
                print("Swiped Right")
            }
        }
    }
}
```

### Listen to Individual Gestures

To listen to individual gestures, you can use the properties `tapAction`, `swipeRightAction`, `swipeLeftAction`, `panAction`, and `longPressAction` in GesturedeckMedia's constructor.

```swift
gesturedeckMedia.tapAction = { /* Handle tap gesture here */ }
gesturedeckMedia.swipeRightAction = { /* Handle swipe right gesture here */ }
gesturedeckMedia.swipeLeftAction = { /* Handle swipe left gesture here */ }
gesturedeckMedia.panAction = { /* Handle pan gesture here */ }
gesturedeckMedia.longPressAction = { /* Handle long press gesture here */ }
```

For detailed API reference, visit [Gesturedeck API Reference](https://navideck.github.io/Gesturedeck-iOS/documentation/gesturedeckios/gesturedeck/).

## GesturedeckMedia - Media Controls

GesturedeckMedia is a specialized implementation built on top of Gesturedeck, tailored specifically for media apps. It provides default gesture actions that can be customized to suit your app's requirements.

### Getting Started with GesturedeckMedia

To use GesturedeckMedia for showing media controls UI, follow these steps:

1. Initialize `GesturedeckMedia` with `GesturedeckMediaOverlay`:

```swift
let gesturedeckMedia = GesturedeckMedia(
    context: self,
    gesturedeckMediaOverlay: GesturedeckMediaOverlay(
        tintColor: UIColor(red: 28.0 / 255, green: 30.0 / 255, blue: 57.0 / 255, alpha: 0.9),
        topIcon: YOUR_TOP_ICON,
        iconTap: YOUR_ICON_TAP,
        iconTapToggled: YOUR_ICON_TAP_TOGGLED,
        iconSwipeLeft: YOUR_ICON_SWIPE_LEFT,
        iconSwipeRight: YOUR_ICON_SWIPE_RIGHT,
        reverseHorizontalSwipes: false,
        centerIconShowsOuterRing: true
    ),
    tapAction: { /* Handle tap gesture here */ },
    swipeRightAction: { /* Handle swipe right gesture here */ },
    swipeLeftAction: { /* Handle swipe left gesture here */ },
    panAction: { /* Handle pan gesture here */ },
    longPressAction: { /* Handle long press gesture here */ }
)
```

Please note that you need to replace `YOUR_TOP_ICON`, `YOUR_ICON_TAP`, `YOUR_ICON_TAP_TOGGLED`, `YOUR_ICON_SWIPE_LEFT`, and `YOUR_ICON_SWIPE_RIGHT` with your own images that you want to use for the media overlay icons.

For detailed API reference, visit [GesturedeckMedia API Reference](https://navideck.github.io/Gesturedeck-iOS/documentation/gesturedeckios/gesturedeckmedia/).

## Free to Use
Gesturedeck SDK is free to use, providing you with the full functionality of the SDK without any time limitations. You are welcome to integrate it into both personal and commercial projects. When using Gesturedeck SDK for free, a watermark will be presented during runtime. It is strictly prohibited  to hide, remove, or alter in any way the watermark from the free version of Gesturedeck SDK.

### Activation Key and Watermark Removal
For those who wish to remove the watermark from their app, we offer an activation key that allows you to use the SDK without any watermarks. However, please be aware that the watermark-free version is not available for free and requires a purchase.

To inquire about purchasing an activation key or if you have any other questions related to licensing and usage, please contact us at team@navideck.com. We will be happy to assist you with the process and provide you with the necessary information.

## Contact

For questions or support, please contact us at team@navideck.com. Thank you for choosing Gesturedeck SDK!
