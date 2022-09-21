//
//  LocalizedString+Extension.swift
//  NikrizMovies
//
//  Created by Ege Aydemir on 19.09.2022.
//

import SwiftUI

extension LocalizedStringKey {
    var stringKey: String? {
        Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String
    }

    func stringValue(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey!, locale: locale)
    }
}
