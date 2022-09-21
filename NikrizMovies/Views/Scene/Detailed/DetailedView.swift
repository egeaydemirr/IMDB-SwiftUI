//
//  DetailedView.swift
//  NikrizMovies
//
//  Created by Ege Aydemir on 19.09.2022.
//

import SwiftUI

struct DetailedView: View {
    var filmDetailedView: Search
    var body: some View {
        ScrollView{
            imageView
            textDetails

        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
        

    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(filmDetailedView: MovieManager().parseStaticJSON(dosyaAdi: "ConstantFilm", dosyaUzantisi: "json")[2])
    }
}
