//
//  Photo.swift
//  Navigation
//
//  Created by Lex 412 on 4/16/22.
//

import UIKit

struct Photos {

    static let totalPhotosCount = 20

    static var allPhotos: [UIImage] {
        getPhotos(withIndexes: [Int](1...totalPhotosCount))
    }

    static func randomPhotos(ofCount count: Int) -> [UIImage] {
        let randomIndexes = getUniqueRandomNumbers(min: 1, max: totalPhotosCount, count: count)
        return getPhotos(withIndexes: randomIndexes)
    }

    static func getPhotos(withIndexes indexes: [Int]) -> [UIImage] {
        var photos = [UIImage]()

        indexes.forEach { index in
            if let photo = UIImage(named: "photo-\(index)") {
                photos.append(photo)
            }
        }

        return photos
    }

}
