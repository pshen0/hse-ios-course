//
//  ViewController.swift
//  aasazonova_1PW2
//
//  Created by Анна Сазонова on 04.11.2024.
//

import UIKit


protocol ColorView: AnyObject {
    func updateBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat)
}

final class WishMakerViewController: UIViewController, ColorView {
    
    enum Constants {
        static let titleText: String = "WishMaker"
        static let titleSize: CGFloat = 32
        static let titleTop: CGFloat = 30
        
        static let discriptionText: String = """
        This app will bring you joy and will fulfill three of your wishes!
            • The first wish is to change the background color.
        """
        static let discriptionSize: CGFloat = 16
        static let discriptionLeading: CGFloat = 15
        static let discriptionTop: CGFloat = 20
        
        static let stackRadius: CGFloat = 20
        static let stackLeading: CGFloat = 20
        static let stackBottom: CGFloat = -60
        
        static let red: String = "Red"
        static let green: String = "Green"
        static let blue: String = "Blue"
        static let colorIntensity: CGFloat = 0.0
        static let colorSaturation: CGFloat = 1.0
        
        static let sliderMin: Double = 0
        static let sliderMax: Double = 1
    }
    
    private var titleView = UILabel()
    private var discriptionView = UILabel()
    private var sliderRed = CustomSlider()
    private var sliderBlue = CustomSlider()
    private var sliderGreen = CustomSlider()
    private var redLevel = Constants.colorIntensity
    private var blueLevel = Constants.colorIntensity
    private var greenLevel = Constants.colorIntensity
    var presenter: ColorPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        configureTitle()
        configureDiscription()
        configureSliders()
    }
    
    private func configureTitle() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = Constants.titleText
        discriptionView.numberOfLines = 0
        discriptionView.lineBreakMode = .byWordWrapping
        titleView.textColor = .white
        titleView.font = UIFont.boldSystemFont(ofSize: Constants.titleSize)
        view.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.titleTop)
        ])
    }
    
    private func configureDiscription() {
        discriptionView.translatesAutoresizingMaskIntoConstraints = false
        discriptionView.text = Constants.discriptionText
        discriptionView.numberOfLines = 0
        discriptionView.lineBreakMode = .byWordWrapping
        discriptionView.textColor = .white
        discriptionView.font = UIFont.systemFont(ofSize: Constants.discriptionSize)
        view.addSubview(discriptionView)
        NSLayoutConstraint.activate([
            discriptionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            discriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.discriptionLeading),
            discriptionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: Constants.discriptionTop)
        ])
    }
    
    private func configureSliders() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.clipsToBounds = true
        
        sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
        sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
        sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            stack.addArrangedSubview(slider)
        }

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackLeading),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.stackBottom)
        ])
        
        sliderRed.valueChanged = { [weak self] value in
            self!.redLevel = Double(value)
            self?.presenter.slidersValueDidChange(red: self?.redLevel ?? 0, green: self?.greenLevel ?? 0, blue: self?.blueLevel ?? 0)
        }
        
        sliderGreen.valueChanged = { [weak self] value in
            self!.greenLevel = Double(value)
            self?.presenter.slidersValueDidChange(red: self?.redLevel ?? 0, green: self?.greenLevel ?? 0, blue: self?.blueLevel ?? 0)
        }
        
        sliderBlue.valueChanged = { [weak self] value in
            self!.blueLevel = Double(value)
            self?.presenter.slidersValueDidChange(red: self?.redLevel ?? 0, green: self?.greenLevel ?? 0, blue: self?.blueLevel ?? 0)
        }
    }

    func updateBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: Constants.colorSaturation)
    }
}

