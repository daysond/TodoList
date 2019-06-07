//
//  LogInViewController.swift
//  TodoList
//
//  Created by Dayson Dong on 2019-06-05.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

import UIKit
import LocalAuthentication

protocol SetLoggedInDelegate: AnyObject {
    func setLoggedIn()
}

class LogInViewController: UIViewController {

    weak var delegate: SetLoggedInDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func authenticate() {
        
        guard #available (iOS 8.0, *) else {
            return print("Not supported")
        }
        
        let context = LAContext()
        var error: NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return print(error)
        }
        
        let reason = "Face ID authentication"
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (isAuthorized, err) in
            guard isAuthorized == true else {
                return print(err)
            }
            self.delegate?.setLoggedIn()
            self.dismiss(animated: true, completion: nil)
            
        }
    }
}
