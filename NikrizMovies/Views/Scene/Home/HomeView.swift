//
//  HomeView.swift
//  NikrizMovies
//
//  Created by Ege Aydemir on 14.09.2022.
//

import SwiftUI
import Kingfisher

struct HomeView: View {

    @ObservedObject var movieManager : MovieManager = .init()
    @State var searchTerm: String = ""

    var body: some View {
        NavigationView{
            ScrollView{
                searchButtonView
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 5).foregroundColor(Color.background1))
                    .padding()

                if movieManager.filteredResults(searchTerm: searchTerm).isEmpty{
                    errorMessageView
                }else{
                    searchListView
                }

            }
            .navigationTitle("app_title")
        }
        .onAppear{
            movieManager.fetchFilms(searchTerm: randomName.randomElement()!)
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
