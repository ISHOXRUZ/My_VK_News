//
//  AuthService.swift
//  My_VK_News
//
//  Created by Lucifer on 2/22/20.
//  Copyright © 2020 Lucifer. All rights reserved.
//

import Foundation
import VKSdkFramework

protocol AuthServiceDelegate: class {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceDidSignInFail()
}

final class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let appId = "6869574"
    private let vkSdk: VKSdk
    
    weak var delegate: AuthServiceDelegate?
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    func wakeUpSession() {
        let scope = ["offline"]
        
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            if state == VKAuthorizationState.authorized {
                print("VKAuthorizationState.authorized")
                delegate?.authServiceSignIn()
            } else if state == VKAuthorizationState.initialized {
                print("VKAuthorizationState.initialized")
                VKSdk.authorize(scope)
            } else {
                print("auth problems, state \(state) error \(String(describing: error))")
                delegate?.authServiceDidSignInFail()
            }
        }
        
    }
    
    // MARK: VKSDKDelegate
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            
        }
        delegate?.authServiceSignIn()
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
    // MARK: VKSDKUIDelegate
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
}
