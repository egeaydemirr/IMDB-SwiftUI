//
//  String+Extension.swift
//  NikrizMovies
//
//  Created by Ege Aydemir on 19.09.2022.
//

import SwiftUI

extension String {

    static func localizedString(for key: String,
                                locale: Locale = .current) -> String {

        let language = locale.languageCode
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")

        return localizedString
    }

    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
