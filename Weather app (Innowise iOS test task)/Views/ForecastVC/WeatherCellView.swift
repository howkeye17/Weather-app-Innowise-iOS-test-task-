//
//  WeatherCell.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 25.09.21.
//

import UIKit
//MARK: - Weather Cell class
class WeatherCellView: UITableViewCell {
//MARK: -Static properties for cell in TableView
    static let reuseId = "weatherCell"
    static let rowHeight: CGFloat = 80
//MARK: -viewModel for Cell in TableView
    weak var cellViewModel: WeatherCellViewModelProtocol? {
        willSet(cellViewModel) {
            guard let cellViewModel = cellViewModel else { return }
            weatherImage.image = cellViewModel.weatherImage
            timeTextView.text = cellViewModel.currentTime
            weatherTextView.text = cellViewModel.weatherStatus
            temperatureLabel.text = cellViewModel.temperature
        }
    }
// MARK: - WEatherCell UI elements
    let weatherImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "sun.max")
        image.tintColor = .black
        return image
    }()
    let timeTextView: UITextView = {
        let textView = UITextView()
        textView.text = "13:00"
        textView.backgroundColor = .none
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let weatherTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Clear"
        textView.backgroundColor = .none
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "22ºC"
        label.textAlignment = .center
        return label
    }()
// MARK: -Initialisation
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(weatherImage)
        contentView.addSubview(timeTextView)
        contentView.addSubview(weatherTextView)
        contentView.addSubview(temperatureLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: -LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height - 24
        let temperatureSize = imageSize * 1.5
        let textSize = contentView.frame.size.height / 4
        let textHeight = textSize * 2
        timeTextView.font = UIFont.systemFont(ofSize: textSize)
        weatherTextView.font = UIFont.systemFont(ofSize: textSize)
        temperatureLabel.font = UIFont.systemFont(ofSize: textSize * 1.5)
        
        weatherImage.frame = CGRect(x: 10,
                                    y: (contentView.frame.size.height - imageSize) / 2,
                                    width: imageSize,
                                    height: imageSize)
        timeTextView.frame = CGRect(x: 10 + weatherImage.frame.width + 20,
                                    y: (contentView.frame.size.height - textHeight) / 2 - textHeight / 3,
                                    width: 100,
                                    height: textHeight)
        weatherTextView.frame = CGRect(x: 10 + weatherImage.frame.width + 20,
                                       y: (contentView.frame.size.height - textHeight) / 2 + textHeight / 3,
                                       width: 100,
                                       height: textHeight)
        temperatureLabel.frame = CGRect(x: (contentView.frame.size.width - temperatureSize - 20),
                                        y: (contentView.frame.size.height - temperatureSize) / 2,
                                        width: temperatureSize,
                                        height: temperatureSize)
    }
}
