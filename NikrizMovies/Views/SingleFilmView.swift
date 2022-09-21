//
//  SingleFilmView.swift
//  NikrizMovies
//
//  Created by Ege Aydemir on 19.09.2022.
//

import SwiftUI
import Kingfisher

struct SingleFilmView: View {

    var filmSubView: Search
    var body: some View {
        HStack(spacing: 20){
            KFImage(URL(string: filmSubView.poster!))
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .cornerRadius(15)
            VStack(alignment: .leading){
                HStack{
                    Text(filmSubView.title ?? "")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }

                Text(filmSubView.year ?? "")
                    .fontWeight(.light)
                    .font(.footnote)
            }
            .foregroundColor(Color.textColor)

        }
        .padding()
        .background(Color.background1)
        .cornerRadius(5)
        .padding(.horizontal)
    }
}
