//
//  ContentView.swift
//  MovieLib
//
//  Created by Ogul Ayvaci on 17.01.2025.
//

import SwiftUI

struct FilmListeView: View {
    @ObservedObject var filmListeViewModel: FilmListeViewModel
    @State var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
    }
    
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                TextField("Aranacak Film",
                          text: $aranacakFilm,
                          onEditingChanged: { _ in },
                          onCommit: {
                    self.filmListeViewModel.filmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(filmListeViewModel.filmler, id: \.imdbID){ film in
                    
                    // secilen filmin imdbId'si ile DetailView'a kullanmak için yolluyoruz
                    NavigationLink(destination: DetayView(imdbId: film.imdbID)) {
                        HStack{
                            OzelImage(url: film.poster)
                                .frame(width: 100, height: 140)
                            
                            VStack (alignment: .leading) {
                                
                                Text(film.title)
                                    .font(.headline)
                                
                                Text(film.year)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                    }
                } .navigationTitle("Search Results")
            }
        }
    }
}

#Preview {
    FilmListeView()
}
