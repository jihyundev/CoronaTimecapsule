//
//  Marbles.swift
//  TimeCapsule
//
//  Created by Beomcheol Kwon on 2021/03/13.
//

import Foundation

struct Marbles: Codable {
    let marbleList: [MarbleList]
    let marbleColorCount: [MarbleColorCount]

    struct MarbleColorCount: Codable {
        let marbleColor: String
        let marbleCount: Int
    }

    struct MarbleList: Codable {
        let marbleID: Int
        let content, marbleColor: String
        let wishChecked: Bool
        let createdAt: String

        enum CodingKeys: String, CodingKey {
            case marbleID = "marbleId"
            case content, marbleColor, wishChecked, createdAt
        }
    }

}


