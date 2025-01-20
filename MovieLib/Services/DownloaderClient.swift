//
//  DownloaderClient.swift
//  MovieLib
//
//  Created by Ogul Ayvaci on 17.01.2025.
//

import Foundation

class DownloaderClient {
    
    func downloadFilms(search: String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void) {
        
        // check if the url is valid
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=d43a62a6") else {
            return completion(.failure(.invalidURL))
        }
        
        // check if the task returns data
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.dataTaskFailed))
            }
            
            // check if the decoding works
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self, from: data) else {
                return completion(.failure(.decodingFailed))
            }
            
            // if there is no problem
            completion(.success(filmCevabi.films))
        }.resume()
    }
    
    func filmDetayiniIndir(imdbId: String, completion: @escaping
                           (Result<FilmDetay, DownloaderError>) -> Void) {
        
        // check if the url is valid
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=d43a62a6") else {
            return completion(.failure(.invalidURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.dataTaskFailed))
            }
            
            guard let gelenFilmDetayi = try? JSONDecoder().decode(FilmDetay.self, from: data) else {
                return completion(.failure(.decodingFailed))
            }
            
            completion(.success(gelenFilmDetayi))
        } .resume()
    }
}

enum DownloaderError: Error {
    case invalidURL
    case dataTaskFailed
    case decodingFailed
}
