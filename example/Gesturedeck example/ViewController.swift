//
//  ViewController.swift
//  Gesturedeck example
//
//  Created by Fotios Dimanidis on 18.09.22.
//

import UIKit

class ViewController: UIViewController {
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

    @IBAction func buttonPress(_ sender: Any) {
        if view.backgroundColor == UIColor.white {
            view.backgroundColor = UIColor.black
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func start(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate
            sceneDelegate?.gesturedeck?.start()
        } else {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            appDelegate?.gesturedeck?.start()
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate
            sceneDelegate?.gesturedeck?.stop()
        } else {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            appDelegate?.gesturedeck?.stop()
        }
    }
}

