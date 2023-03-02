//
//  APIClient.swift
//  NeedlePractice
//
//  Created by Junho Lee on 2023/03/02.
//

import Foundation

protocol ImageFetchable {
    func fetchImageList() async throws -> [ImageModel]
}

final class ImageAPI: ImageFetchable {
    func fetchImageList() async throws -> [ImageModel] {
        let url = URL(string: "https://picsum.photos/v2/list?page=1&limit=50")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let images = try JSONDecoder().decode([ImageModel].self, from: data)
            return images
        } catch {
            return []
        }
    }
}
