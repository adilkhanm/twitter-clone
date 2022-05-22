//
//  ImageUploader.swift
//  Twitter clone
//
//  Created by Adilkhan Muratov on 22.05.2022.
//

import Firebase
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping (String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: failed to upload image to storage (reference): \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageUrl, error in
                if let error = error {
                    print("DEBUG: failed to upload image to storage: \(error.localizedDescription)")
                    return
                }
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
