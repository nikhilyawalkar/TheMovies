//
//  LazyImage.swift
//  TheMovieDB
//
//  Created by Nikhil yawalkar on 04/02/23.
//

import SwiftUI

struct LazyImage: View {
    @ObservedObject var imageDownloader: ImageDownloaderUtility
    static var defaultImage: UIImage = UIImage(named: "dummy")!
    
    init(imageUrl: String) {
        self.imageDownloader = ImageDownloaderUtility(imageUrlString: imageUrl)
    }
    
    var body: some View {
        Image(uiImage: imageDownloader.downloadedImage ?? LazyImage.defaultImage)
            .resizable()
            .scaledToFit()
        
        
    }
}

struct LazyImage_Previews: PreviewProvider {
    static var previews: some View {
        LazyImage(imageUrl: "")
    }
}
