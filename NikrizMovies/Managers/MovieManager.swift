//
//  MovieManager.swift
//  NikrizMovies
//
//  Created by Ege Aydemir on 15.09.2022.
//

import Foundation
import SwiftUI
import Alamofire

class MovieManager: ObservableObject {
    @Published var filmsArray: [Search] = []

    func fetchFilms(searchTerm: String){
        let apiKey =  "f25e3b1a"
        let baseURL = "https://www.omdbapi.com/?apikey=\(apiKey)&s=\(searchTerm)"
        AF.request(baseURL).responseDecodable(of: HomeResponseModel.self) { response in
            self.filmsArray = (response.value?.search) ?? self.parseStaticJSON(dosyaAdi: "ConstantFilm", dosyaUzantisi: "json")
            // Sonuç gelmezse ConstantFilm.json dosyasını ayrıştırıp eşitle
        }
    }

    func parseStaticJSON(dosyaAdi: String, dosyaUzantisi: String) -> [Search] {

        guard let dosyaYolu = Bundle.main.url(forResource: dosyaAdi, withExtension: dosyaUzantisi)else{
            fatalError("Dosya yolu bulunamadı")
        }

        guard let data = try? Data(contentsOf: dosyaYolu)else{
            fatalError("Veri alınamadı")
        }
        let decoder = JSONDecoder()

        guard let decodeEdilmisData = try? decoder.decode(HomeResponseModel.self, from: data)else{
            fatalError("Veri ayrıştırılamadı")
        }
        return decodeEdilmisData.search!

    }

    func filterArray(searchTerm: String) -> [Search]? {
        return filmsArray.filter{
            $0.title!.localizedStandardContains(searchTerm)
        }
    }

    func filteredResults(searchTerm: String) -> [Search]{
        if searchTerm.isEmpty{
            return self.filmsArray
        }else{
            return self.filmsArray.filter{
                $0.title!.localizedStandardContains(searchTerm)
            }
        }
    }

}



