//
//  NetworkManager.swift
//  AnimationDemo
//
//  Created by Jeffrey Chang on 12/9/18.
//  Copyright © 2018 Jeffrey Chang. All rights reserved.
//

import Foundation


class NetworkManager {
    
    static func mockURL() -> URL? {
        let urlString = "https://firebasestorage.googleapis.com/v0/b/firestorechat-e64ac.appspot.com/o/intermediate_training_rec.mp4?alt=media&token=e20261d0-7219-49d2-b32d-367e1606500c"
        return URL(string: urlString)
    }
    
}
