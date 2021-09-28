//
//  TodayViewController.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 25.09.21.
//

import UIKit

class TodayViewController: UIViewController {

    var todayViewModel: TodayViewModel?
    
// MARK: UI elements
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
        label.font = UIFont.systemFont(ofSize: 28)
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
    
    private let locationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "location")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let textView1: UITextView = {
        let textView = UITextView()
        textView.text = "--------------------"
        textView.font = .systemFont(ofSize: 20)
        textView.textColor = UIColor(named: "AccentColor")
        textView.backgroundColor = .none
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    private let textView2: UITextView = {
        let textView = UITextView()
        textView.text = "--------------------"
        textView.font = .systemFont(ofSize: 20)
        textView.textColor = UIColor(named: "AccentColor")
        textView.backgroundColor = .none
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let centerStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let chancesStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let chancesOfRainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rain")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let chancesOfRainLabel: UILabel = {
        let label = UILabel()
        label.text = "55 %"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(named: "AccentColor")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let falloutStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let falloutImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "drop")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let falloutLabel: UILabel = {
        let label = UILabel()
        label.text = "1.0 mm"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(named: "AccentColor")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let pressureStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let pressureImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pressure")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let pressureLabel: UILabel = {
        let label = UILabel()
        label.text = "1029 hPa"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(named: "AccentColor")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let windStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let windImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "wind")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let windLabel: UILabel = {
        let label = UILabel()
        label.text = "20 km/h"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(named: "AccentColor")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let directionStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let directionImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "direction")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let directionLabel: UILabel = {
        let label = UILabel()
        label.text = "SE"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(named: "AccentColor")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
// MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        todayViewModel = TodayViewModel()
        todayViewModel?.locationManager.requestWhenInUseAuthorization()
//        todayViewModel?.locationManager.startUpdatingLocation()
        
//        todayViewModel?.networkManager.todayCompletion = { weather in
//            self.todayViewModel?.updateInterface(withWeather: weather, completion: {
//                print(weather)
//            })
//        }
        
        todayViewModel?.fetchWeather { [weak self] in
            guard let self = self else { return }
            self.updateInterface()
            
        }
    }
    
    private func updateInterface() {
        
    }

    private func setupView() {
        var constraints = [NSLayoutConstraint]()
        
        view.addSubview(todayLabel)
        constraints.append(todayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(todayLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(todayLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        view.addSubview(topContainerView)
        constraints.append(topContainerView.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 8))
        constraints.append(topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15))
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
        constraints.append(topStackView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 8))
        constraints.append(topStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        view.addSubview(locationImage)
        constraints.append(locationImage.topAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: 16))
        constraints.append(locationImage.leadingAnchor.constraint(equalTo: topStackView.safeAreaLayoutGuide.leadingAnchor, constant: -64))
        
        view.addSubview(textView1)
        constraints.append(textView1.topAnchor.constraint(equalTo: topStackView.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(textView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24))
        constraints.append(textView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24))
        
        chancesStackView.addArrangedSubview(chancesOfRainImage)
        chancesStackView.addArrangedSubview(chancesOfRainLabel)
        falloutStackView.addArrangedSubview(falloutImage)
        falloutStackView.addArrangedSubview(falloutLabel)
        pressureStackView.addArrangedSubview(pressureImage)
        pressureStackView.addArrangedSubview(pressureLabel)
        view.addSubview(centerStackView)
        centerStackView.addArrangedSubview(chancesStackView)
        centerStackView.addArrangedSubview(falloutStackView)
        centerStackView.addArrangedSubview(pressureStackView)
        constraints.append(centerStackView.topAnchor.constraint(equalTo: textView1.bottomAnchor,constant: -8))
        constraints.append(centerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(centerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(centerStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1))
        
        windStackView.addArrangedSubview(windImage)
        windStackView.addArrangedSubview(windLabel)
        directionStackView.addArrangedSubview(directionImage)
        directionStackView.addArrangedSubview(directionLabel)
        view.addSubview(bottomStackView)
        bottomStackView.addArrangedSubview(windStackView)
        bottomStackView.addArrangedSubview(directionStackView)
        constraints.append(bottomStackView.topAnchor.constraint(equalTo: centerStackView.bottomAnchor))
        constraints.append(bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(bottomStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6))
        constraints.append(bottomStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1))
        
        view.addSubview(textView2)
        constraints.append(textView2.topAnchor.constraint(equalTo: bottomStackView.bottomAnchor, constant: -20))
        constraints.append(textView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24))
        constraints.append(textView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24))
        
        view.addSubview(shareButton)
        constraints.append(shareButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(shareButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(shareButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10))
    
        NSLayoutConstraint.activate(constraints)
    }

}
