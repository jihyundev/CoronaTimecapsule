//
//  loginDataManager.swift
//  TimeCapsule
//
//  Created by 정지현 on 2021/03/12.
//

import Foundation
import Alamofire
import KakaoSDKAuth
import KakaoSDKUser

class UserDataManager {
    
    func kakaoLogin(viewController: LoginViewController) {
        // 카카오톡 설치 여부 확인
        if (AuthApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 로그인. api 호출 결과를 클로저로 전달
            AuthApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    // 예외 처리 (로그인 취소 등)
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    
                    // do something
                    _ = oauthToken
                }
            }
        } else {
            // 카카오톡이 기기에 설치되지 않았을 경우 - 웹 브라우저를 통한 로그인
            AuthApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoAccount() success.")
                    
                    // do something
                    _ = oauthToken
                    // Access Token
                    let accessToken = oauthToken?.accessToken
                    UserApi.shared.me() { (user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            print("me() success.")
                            
                            // do something
                            _ = user
                            if user?.id != nil {
                                self.login(accessToken: accessToken!)
                            }
                        }
                    }
                }
            }
        }
    }
    
    // 로그인 (JWT 토큰 발급)
    func login(accessToken: String) {
        
    }
    
    // 가입 회원 여부 검사
    func verifyUser(accessToken: String) {
        
    }
    
    // 회원가입
    func join(accessToken: String) {
        
    }
    
    
}
