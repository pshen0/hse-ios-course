//
//  Interactor.swift
//  aasazonova_1PW2
//
//  Created by Анна Сазонова on 04.11.2024.
//

import Foundation

protocol ColorInteractorInput {
    func updateColors(red: Float, green: Float, blue: Float)
}

class ColorInteractor: ColorInteractorInput {
    var presenter: ColorPresenterInput!

    func updateColors(red: Float, green: Float, blue: Float) {
        presenter.colorsDidUpdate(red: red, green: green, blue: blue)
    }
}
