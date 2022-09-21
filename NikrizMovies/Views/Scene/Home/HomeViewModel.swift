//
//  HomeViewModel.swift
//  NikrizMovies
//
//  Created by Ege Aydemir on 19.09.2022.
//

import SwiftUI

extension HomeView{
    
    var searchListView: some View {
        ForEach(movieManager.filteredResults(searchTerm: searchTerm), id: \.self){ film in
            NavigationLink {
                DetailedView(filmDetailedView: film)
            } label: {
                VStack(spacing: 0){
                    SingleFilmView(filmSubView: film)
                }
            }
        }
    }

    var errorMessageView: some View {
        VStack{
            Text("😝 " + LocalizedStringKey("no_results").stringValue())
                .padding()
                .background(Color.background1)
                .cornerRadius(15)
                .padding()
        }
    }

    var searchButtonView: some View{
        TextField("Search Now", text: $searchTerm)
            .autocorrectionDisabled(true)
            .autocapitalization(.none)
            .onChange(of: searchTerm) { newValue in
                movieManager.fetchFilms(searchTerm: searchTerm)
            }
    }
}
