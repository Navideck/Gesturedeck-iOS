//
//  SceneDelegate.swift
//  GdeckUIKit
//
//  Created by Rohit Sangwan on 13/10/23.
//

import GesturedeckiOS
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var gesturedeckMedia: GesturedeckMedia?
    var gestureEventListener: ((String) -> Void)? = nil

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidBecomeActive(_: UIScene) {
        gesturedeckMedia = gesturedeckMedia ?? GesturedeckMedia(
            tapAction: {
                self.gestureEventListener?("tapAction")
            },
            swipeLeftAction: {
                self.gestureEventListener?("swipeLeftAction")
            },
            swipeRightAction: {
                self.gestureEventListener?("swipeRightAction")
            },
            panAction: { _ in
                self.gestureEventListener?("panAction")
            }
        )
    }
}
