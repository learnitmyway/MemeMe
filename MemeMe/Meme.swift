//
//  Meme.swift
//  MemeMe
//
//  Created by David  on 06/11/2016.
//
//

import Foundation
import UIKit

struct Meme {
    
    let textTop: String
    let textBottom: String
    let originalImage: UIImage
    let memeImage: UIImage
    
    init(textTop: String, textBottom: String, originalImage: UIImage, memeImage: UIImage) {
        self.textTop = textTop
        self.textBottom = textBottom
        self.originalImage = originalImage
        self.memeImage = memeImage
    }
}
