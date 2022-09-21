//
//  DetailedViewModel.swift
//  NikrizMovies
//
//  Created by Ege Aydemir on 19.09.2022.
//

import SwiftUI
import Kingfisher

extension DetailedView{
    
    var imageView: some View {
        KFImage(URL(string: filmDetailedView.poster!))
            .resizable()
            .scaledToFit()
            .mask(Circle())
            .frame(height: 200)
    }


    var textDetails: some View {
        VStack{

            Text(filmDetailedView.title!)
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)

            Text(filmDetailedView.type!.capitalizingFirstLetter())
                .font(.subheadline)
                .opacity(0.5)
                .multilineTextAlignment(.center)

            Text(filmDetailedView.year!)
                .font(.subheadline)
                .opacity(0.5)

            Text(imdbInfo.randomElement() ?? "")
                .padding()
                .background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color.background1))
        }

    }
}

