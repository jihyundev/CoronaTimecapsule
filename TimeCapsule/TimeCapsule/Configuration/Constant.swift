//
//  Constant.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/08.
//

import Foundation

struct Constant {
    static let BASE_URL = "URL 주소를 입력해주세요"
    static let KOBIS_BASE_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest"
//    static let testToken = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOjEsImlhdCI6MTYxNTU1MTI1MX0.azhpQs7mOZhUBY46A9XOz_xzD18nfX59wqacFcmuqWM"
    static let testToken =  UserDefaults.standard.string(forKey: "loginJWTToken")!

}
