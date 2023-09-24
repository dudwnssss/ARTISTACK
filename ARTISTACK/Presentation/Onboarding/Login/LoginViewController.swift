//
//  LoginViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/24.
//

import UIKit
import AuthenticationServices

class LoginViewController: BaseViewController {
    
    let loginView = LoginView()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func setProperties() {
        loginView.appleLoginButton.addTarget(self, action: #selector(appleLoginButtonDidTap), for: .touchUpInside)
    }
    
    @objc func appleLoginButtonDidTap(){
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        }
}

extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
               case let appleIDCredential as ASAuthorizationAppleIDCredential:
                   // You can create an account in your system.
                   let userIdentifier = appleIDCredential.user
                   
                   if  let authorizationCode = appleIDCredential.authorizationCode,
                       let identityToken = appleIDCredential.identityToken,
                       let authCodeString = String(data: authorizationCode, encoding: .utf8),
                       let identifyTokenString = String(data: identityToken, encoding: .utf8) {
                       print("authorizationCode: \(authorizationCode)")
                       print("identityToken: \(identityToken)")
                       print("authCodeString: \(authCodeString)")
                       print("identifyTokenString: \(identifyTokenString)")
                       
                       
                       UserDefaults.standard.set(identifyTokenString, forKey: "apple_identity_token")
                       UserDefaults.standard.set(authCodeString, forKey: "apple_authorization_code")

                   }
                   
                   print("useridentifier: \(userIdentifier)")
                   
            let request = LoginRequest(providerType: "APPLE")
            Network.shared.request(type: LoginResponse.self, api: OAuthTarget.login(request)) { response in
                switch response {
                case .success(let success):
                    if success.code == 5001{
                        RootSwitcher.update(.onboarding)
                    } else {
                        RootSwitcher.update(.main)
                    }
                case .failure(let failure):
                    debugPrint(response)
                }
            }
                   
               case let passwordCredential as ASPasswordCredential:
                   // Sign in using an existing iCloud Keychain credential.
                   let username = passwordCredential.user
                   let password = passwordCredential.password
                   
                   print("username: \(username)")
                   print("password: \(password)")
                   
               default:
                   break
               }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("login failed - \(error.localizedDescription)")
    }
}
