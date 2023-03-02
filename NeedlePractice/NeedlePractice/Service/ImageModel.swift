//
//  ImageModel.swift
//  NeedlePractice
//
//  Created by Junho Lee on 2023/03/02.
//

import Foundation

struct ImageModel: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}
