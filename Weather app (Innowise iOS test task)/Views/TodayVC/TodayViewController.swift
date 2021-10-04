//
//  TodayViewController.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 25.09.21.
//

import UIKit
//MARK: - TodayViewController Class
class TodayViewController: UIViewController {
//MARK: - ViewModel for TodayViewController
    private var todayViewModel: TodayViewModelProtocol?
// MARK: - UI elements for TodayViewController
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
        image.image = UIImage(systemName: "nosign")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "--------"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = UIColor(named: "AccentColor")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "---------"
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
    private let humidityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let humidityImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rain")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.text = "---"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(named: "AccentColor")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let precipitationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let precipitationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "drop")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let precipitationLabel: UILabel = {
        let label = UILabel()
        label.text = "---"
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
        label.text = "---"
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
        label.text = "---"
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
        label.text = "---"
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
        button.setTitleColor(.gray, for: .highlighted)
        button.addTarget(self, action: #selector(shareText(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        spinner.color = .black
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
// MARK: - Lifecycle of the TodayViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        todayViewModel = TodayViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todayViewModel?.fetchWeatherForToday { [weak self] in
            guard let self = self else { return }
            self.updateViewWithTodayWeatherData()
        }
    }
    
}
//MARK: - Extension with ShareButton method
extension TodayViewController {
    
    @objc func shareText(sender: UIButton) {
        let cityName = self.todayViewModel?.cityName
        let weather = self.todayViewModel?.weatherLabel
        let humidity = self.todayViewModel?.humidity
        let precipitation = self.todayViewModel?.precipitation
        let pressure = self.todayViewModel?.pressure
        let windSpeed = self.todayViewModel?.windSpeed
        let windDirection = self.todayViewModel?.windDirection
        
        let textToShare = [cityName, weather, humidity, precipitation, pressure, windSpeed, windDirection]
        let activityViewController = UIActivityViewController(activityItems: textToShare as [Any], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
    }
}

// MARK: - Extension for update view
extension TodayViewController {
    
    private func updateViewWithTodayWeatherData() {
        DispatchQueue.main.async {
            self.spinner.removeFromSuperview()
            self.view.subviews.forEach { $0.isHidden = false }
            self.weatherImage.image = UIImage(systemName: self.todayViewModel?.weatherIcon ?? "nosign")
            self.cityLabel.text = self.todayViewModel?.cityName
            self.weatherLabel.text = self.todayViewModel?.weatherLabel
            self.humidityLabel.text = self.todayViewModel?.humidity
            self.precipitationLabel.text = self.todayViewModel?.precipitation
            self.pressureLabel.text = self.todayViewModel?.pressure
            self.windLabel.text = self.todayViewModel?.windSpeed
            self.directionLabel.text = self.todayViewModel?.windDirection
        }
    }
}
// MARK: - Extension for setting up view
    extension TodayViewController {
    
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
        
        humidityStackView.addArrangedSubview(humidityImage)
        humidityStackView.addArrangedSubview(humidityLabel)
        precipitationStackView.addArrangedSubview(precipitationImage)
        precipitationStackView.addArrangedSubview(precipitationLabel)
        pressureStackView.addArrangedSubview(pressureImage)
        pressureStackView.addArrangedSubview(pressureLabel)
        view.addSubview(centerStackView)
        centerStackView.addArrangedSubview(humidityStackView)
        centerStackView.addArrangedSubview(precipitationStackView)
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
        
        view.subviews.forEach { $0.isHidden = true }
        
        view.addSubview(spinner)
        constraints.append(spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
