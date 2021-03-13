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
                    let accessToken = oauthToken?.accessToken
                    self.login(accessToken: accessToken!, viewController: viewController)
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
                                self.login(accessToken: accessToken!, viewController: viewController)
                            }
                        }
                    }
                }
            }
        }
    }
    
    // 로그인 (JWT 토큰 발급)
    func login(accessToken: String, viewController: LoginViewController) {
        let url = "https://www.vivi-pr.shop/v1/users/login"
        let headers: HTTPHeaders = ["social-token": accessToken]
        AF.request(url, method: .post, headers: headers).validate().responseString { response in
            switch response.result {
            case .success(let response):
                let jwtToken = response
                let ud = UserDefaults.standard
                ud.setValue(jwtToken, forKey: "loginJWTToken")
                self.verifyUser(accessToken: accessToken, viewController: viewController)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // 가입 회원 여부 검사
    func verifyUser(accessToken: String, viewController: LoginViewController) {
        let url = "https://www.vivi-pr.shop/v1/users/exists"
        let headers: HTTPHeaders = ["social-token": accessToken]
        AF.request(url, method: .get, headers: headers).validate().responseString { response in
            switch response.result {
            case .success(let response):
                if response == "true" {
                    // 이미 가입된 회원
                    print("이미 가입된 회원입니다. ")
                    // 메인으로 넘어가기
                    viewController.userExisted()
                } else {
                    // 회원가입 진행 전 닉네임 설정
                    viewController.setNickname()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // 회원가입
    func join(accessToken: String, viewController: LoginViewController) {
        print("회원가입 진행중")
    }
    
    
}
