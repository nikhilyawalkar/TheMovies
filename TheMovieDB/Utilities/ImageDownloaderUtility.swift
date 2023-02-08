//
//  ImageDownloaderUtility.swift
//  TheMovieDB
//
//  Created by Nikhil yawalkar on 04/02/23.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class ImageDownloaderUtility: ObservableObject {
    @Published var downloadedImage: UIImage?
    private let imagePath: URL
    
    init(imageUrlString: String) {
        self.imagePath = URL(string: imageUrlString)!
        getImage()
    }
    
    func getImage() {
        var urlRequest = URLRequest(url: self.imagePath)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        
        // retrieves image if already available in cache
        if let imageFromCache = imageCache.object(forKey: self.imagePath as AnyObject) as? UIImage {
            DispatchQueue.main.async { [weak self] in
                self?.downloadedImage = imageFromCache
            }
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { [weak self] imageData, urlResposnse, error in
            if let imageData = imageData, let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self?.downloadedImage = image
                }
                imageCache.setObject(image, forKey: self?.imagePath as AnyObject)
            }
        }.resume()
    }
}
