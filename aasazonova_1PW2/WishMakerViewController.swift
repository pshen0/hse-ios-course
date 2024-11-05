//
//  ViewController.swift
//  aasazonova_1PW2
//
//  Created by Анна Сазонова on 04.11.2024.
//

import UIKit

//meow

protocol ColorView: AnyObject {
    func updateBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat)
}

final class WishMakerViewController: UIViewController, ColorView {
    
    var presenter: ColorPresenter!
    
    private var titleView = UILabel()
    private var discriptionView = UILabel()
    private var sliderRed = CustomSlider()
    private var sliderBlue = CustomSlider()
    private var sliderGreen = CustomSlider()
    private var redLevel = 1.0
    private var blueLevel = 1.0
    private var greenLevel = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    private func configureUI() {
        view.backgroundColor = .systemPink
        configureTitle()
        configureDiscription()
        configureSliders()
    }
    
    private func configureTitle() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = "WishMaker"
        discriptionView.numberOfLines = 0
        discriptionView.lineBreakMode = .byWordWrapping
        titleView.textColor = .white
        titleView.font = UIFont.boldSystemFont(ofSize: 32)
        view.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    private func configureDiscription() {
        discriptionView.translatesAutoresizingMaskIntoConstraints = false
        discriptionView.text = """
        This app will bring you joy and will fulfill three of your wishes!
            • The first wish is to change the background color.
        """
        discriptionView.numberOfLines = 0
        discriptionView.lineBreakMode = .byWordWrapping
        discriptionView.textColor = .white
        discriptionView.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(discriptionView)
        NSLayoutConstraint.activate([
            discriptionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            discriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            discriptionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20)
        ])
    }
    
    private func configureSliders() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = 20
        stack.clipsToBounds = true
        
        sliderRed = CustomSlider(title: "Red", min: 0, max: 1)
        sliderBlue = CustomSlider(title: "Blue", min: 0, max: 1)
        sliderGreen = CustomSlider(title: "Green", min: 0, max: 1)
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            stack.addArrangedSubview(slider)
        }

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ])
        
        sliderRed.valueChanged = { [weak self] value in
            self!.redLevel = Double(value)
            self?.view.backgroundColor = UIColor(red: self?.redLevel ?? 0, green: self?.greenLevel ?? 0, blue: self?.blueLevel ?? 0, alpha: 1)
        }
        
        sliderGreen.valueChanged = { [weak self] value in
            self!.greenLevel = Double(value)
            self?.view.backgroundColor = UIColor(red: self?.redLevel ?? 0, green: self?.greenLevel ?? 0, blue: self?.blueLevel ?? 0, alpha: 1)
            //self?.presenter.slidersValueDidChange(red: self!.sliderRed.slider.value, green: self!.sliderGreen.slider.value, blue: self!.sliderBlue.slider.value)
        }
        
        sliderBlue.valueChanged = { [weak self] value in
            self!.blueLevel = Double(value)
            self?.view.backgroundColor = UIColor(red: self?.redLevel ?? 0, green: self?.greenLevel ?? 0, blue: self?.blueLevel ?? 0, alpha: 1)
        }
    }

    func updateBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

