//
//  FilmDetayViewModel.swift
//  MovieLib
//
//  Created by Ogul Ayvaci on 17.01.2025.
//

import Foundation
import SwiftUI

class FilmDetayViewModel: ObservableObject {
    @Published var filmDetayi: FilmDetaylariVM?
    
    let downloaderClient = DownloaderClient()
    
    func filmDetaylariniAl(imdbId: String) {
        downloaderClient.filmDetayiniIndir(imdbId: imdbId) { result in
            switch result {
            case .success(let filmDetaylari):
                DispatchQueue.main.async {
                    self.filmDetayi = FilmDetaylariVM(detay: filmDetaylari)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}

struct FilmDetaylariVM {
    let detay: FilmDetay
    
    var title: String {
        detay.title
    }
    
    var poster: String? {
        detay.poster
    }
    
    var year: String {
        detay.year
    }
    
    var imdbId: String {
        detay.imdbID
    }
    
    var director: String {
        detay.director
    }
    
    var writer: String {
        detay.writer
    }
    
    var awards: String {
        detay.awards
    }
    
    var plot: String {
        detay.plot
    }
}
