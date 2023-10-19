//
//  ViewController.swift
//  GdeckUIKit
//
//  Created by Rohit Sangwan on 13/10/23.
//

import GesturedeckiOS
import UIKit

class ViewController: UIViewController {
    @IBOutlet var btnStart: UIButton!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var txtGestureEvent: UILabel!

    var sceneDelegate: SceneDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        btnStart.addTarget(self, action: #selector(onStartButtonTap(_:)), for: .touchUpInside)
        btnStop.addTarget(self, action: #selector(onStopButtonTap(_:)), for: .touchUpInside)
    }

    @IBAction func onStartButtonTap(_: UIButton) {
        sceneDelegate?.gesturedeckMedia?.start()
    }

    @IBAction func onStopButtonTap(_: UIButton) {
        sceneDelegate?.gesturedeckMedia?.stop()
    }
}
