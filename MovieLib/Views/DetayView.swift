//
//  DetayView.swift
//  MovieLib
//
//  Created by Ogul Ayvaci on 17.01.2025.
//

import SwiftUI

struct DetayView: View {
    let imdbId: String
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        VStack{
            OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "testImage")
                .frame(width: UIScreen.main.bounds.width * 0.6,height: UIScreen.main.bounds.height * 0.45, alignment: .center)
            
            Text(filmDetayViewModel.filmDetayi?.title ?? "title")
                .font(.title)
                .bold()
                .padding()
            
            Text(filmDetayViewModel.filmDetayi?.year ?? "Year")
                .font(.footnote)
                .foregroundColor(.gray)
            
            Text(filmDetayViewModel.filmDetayi?.director ?? "director")
                .font(.subheadline)
                .padding()
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "plott")
                .font(.subheadline)
                .padding()
            
            Text(filmDetayViewModel.filmDetayi?.awards ?? "Awards")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
            
            Spacer()
        }.onAppear {
            self.filmDetayViewModel.filmDetaylariniAl(imdbId: imdbId)
        }
    }
}

#Preview {
    DetayView(imdbId: "123")
}
