//
//  UIImageView+.swift
//  NeedlePractice
//
//  Created by Junho Lee on 2023/03/02.
//

import UIKit

extension UIImageView {
    func setImage(url: String) {
        Task {
            let image = try await downloadImage(url: url)
            if let image {
                self.image = image
            } else {
                self.image = UIImage(systemName: "plus")
            }
        }
    }
    
    private func downloadImage(url: String) async throws -> UIImage? {
        let url = URL(string: "https://picsum.photos/v2/list?page=1&limit=50")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try image(from: data)
    }

    private func image(from data: Data) throws -> UIImage? {
        if let uiImage = UIImage(data: data) {
            return uiImage
        } else {
            return nil
        }
    }
}
