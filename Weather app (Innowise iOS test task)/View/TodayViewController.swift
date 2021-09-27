//
//  TodayViewController.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 25.09.21.
//

import UIKit

class TodayViewController: UIViewController {

    private let todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor(named: "AccentColor")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let topContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let weatherImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "sun.max")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "New York, USA"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = UIColor(named: "AccentColor")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "22ºC  |  Sunny"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = UIColor(named: "AccentColor")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let topStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    

    private func setupView() {
        var constraints = [NSLayoutConstraint]()
        
        view.addSubview(todayLabel)
        constraints.append(todayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(todayLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(todayLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        view.addSubview(topContainerView)
        constraints.append(topContainerView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 16))
        constraints.append(topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.18))
        constraints.append(topContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(topContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        topContainerView.addSubview(weatherImage)
        constraints.append(weatherImage.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor))
        constraints.append(weatherImage.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor))
        constraints.append(weatherImage.heightAnchor.constraint(equalTo: topContainerView.heightAnchor))
        constraints.append(weatherImage.widthAnchor.constraint(equalTo: topContainerView.widthAnchor))

        topStackView.addArrangedSubview(cityLabel)
        topStackView.addArrangedSubview(weatherLabel)

        view.addSubview(topStackView)

        constraints.append(topStackView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 12))
        constraints.append(topStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }

}
