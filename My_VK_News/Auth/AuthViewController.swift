//
//  AuthViewController.swift
//  My_VK_News
//
//  Created by Lucifer on 2/22/20.
//  Copyright © 2020 Lucifer. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // authService = AuthService()
        authService = AppDelegate.shared().authService

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInTouch() {
        authService.wakeUpSession()
    }
    
}
