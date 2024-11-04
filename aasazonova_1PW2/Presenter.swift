//
//  Presenter.swift
//  aasazonova_1PW2
//
//  Created by Анна Сазонова on 04.11.2024.
//

import Foundation

protocol ColorPresenterInput {
    func colorsDidUpdate(red: Float, green: Float, blue: Float)
}

protocol ColorPresenter {
    func slidersValueDidChange(red: Float, green: Float, blue: Float)
}

class ColorPresenterImplementation: ColorPresenter, ColorPresenterInput {
    
    weak var view: ColorView!
    var interactor: ColorInteractorInput!

    func slidersValueDidChange(red: Float, green: Float, blue: Float) {
        interactor.updateColors(red: red, green: green, blue: blue)
    }

    func colorsDidUpdate(red: Float, green: Float, blue: Float) {
        view.updateBackgroundColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
    }
}
