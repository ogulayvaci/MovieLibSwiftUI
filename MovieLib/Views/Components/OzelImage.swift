//
//  OzelImage.swift
//  MovieLib
//
//  Created by Ogul Ayvaci on 17.01.2025.
//

import SwiftUI

struct OzelImage: View {
    let url: String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String){
        self.url = url
        self.imageDownloaderClient.gorselIndir(url: url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.indirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
            
        } else {
            return Image("testImage")
                .resizable()
        }
    }
}

#Preview {
    OzelImage(url: "https://m.media-amazon.com/images/M/MV5BYzYyN2FiZmUtYWYzMy00MzViLWJkZTMtOGY1ZjgzNWMwN2YxXkEyXkFqcGc@._V1_SX300.jpg")
}
