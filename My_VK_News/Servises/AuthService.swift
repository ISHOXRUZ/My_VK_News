//
//  AuthService.swift
//  My_VK_News
//
//  Created by Lucifer on 2/22/20.
//  Copyright © 2020 Lucifer. All rights reserved.
//

import Foundation
import VKSdkFramework

final class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let appId = "7330683"
    private let vkSdk: VKSdk
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    // MARK: VKSDKDelegate
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
    // MARK: VKSDKUIDelegate
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
}
