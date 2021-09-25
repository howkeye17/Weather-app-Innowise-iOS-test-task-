//
//  WeatherCell.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 25.09.21.
//

import UIKit

class WeatherCell: UITableViewCell {
    static let reuseId = "weatherCell"
// MARK: UI elements
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
    let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "22ºC"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
// MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(weatherImage)
        contentView.addSubview(timeTextView)
        contentView.addSubview(weatherTextView)
        contentView.addSubview(weatherLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height - 24
        let textSize = contentView.frame.size.height / 4
        timeTextView.font = UIFont.systemFont(ofSize: textSize/1.5)
        weatherTextView.font = UIFont.systemFont(ofSize: textSize/1.5)
        
        weatherImage.frame = CGRect(x: 10,
                                    y: (contentView.frame.size.height - imageSize) / 2,
                                    width: imageSize,
                                    height: imageSize)
        timeTextView.frame = CGRect(x: 10 + weatherImage.frame.width + 20,
                                    y: (contentView.frame.size.height - textSize) / 2 - textSize/2,
                                    width: 100,
                                    height: textSize)
        weatherTextView.frame = CGRect(x: 10 + weatherImage.frame.width + 20,
                                    y: (contentView.frame.size.height - textSize) / 2 + textSize/2,
                                    width: 100,
                                    height: textSize)
        weatherLabel.frame = CGRect(x: (contentView.frame.size.width - imageSize * 1.25),
                                    y: (contentView.frame.size.height - imageSize) / 2,
                                    width: imageSize,
                                    height: imageSize)
    }
}
