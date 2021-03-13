//
//  WishlistDataManager.swift
//  TimeCapsule
//
//  Created by 정지현 on 2021/03/13.
//

import Foundation
import Alamofire

class WishlistDataManager {
    func getMarbles(viewController: WishlistViewController) {
        let url = "https://www.vivi-pr.shop/v1/marbles"
        let headers: HTTPHeaders = ["X-ACCESS-TOKEN": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOjEsImlhdCI6MTYxNTYwMDk0OH0.3BeB-QuPnC_z-10Zc024J7bs4sL6goCdUlMtLMpp3cg"]
        AF.request(url, method: .get, headers: headers).validate().responseDecodable(of: WishList.self) {
            response in
            switch response.result {
            case .success(let response):
                let marbleList = response.marbleList
                viewController.marbleList = marbleList
                viewController.marbleColorCount = response.marbleColorCount
                viewController.didSuccessMarbleList()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getFinishedMarbles(viewController: FinishedListViewController) {
        let url = "https://www.vivi-pr.shop/v1/marbles/checked"
        let headers: HTTPHeaders = ["X-ACCESS-TOKEN": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOjEsImlhdCI6MTYxNTYwMDk0OH0.3BeB-QuPnC_z-10Zc024J7bs4sL6goCdUlMtLMpp3cg"]
        AF.request(url, method: .get, headers: headers).validate().responseDecodable(of: [MarbleList].self) {
            response in
            switch response.result {
            case .success(let response):
                debugPrint(response)
                viewController.marbleList = response
                viewController.didRetrieveData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
