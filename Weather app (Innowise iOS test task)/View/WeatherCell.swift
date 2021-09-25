//
//  WeatherCell.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 25.09.21.
//

import UIKit

class WeatherCell: UITableViewCell {
    static let reuseId = "weatherCell"
    
    private let weatherImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "sun.max")
        image.tintColor = .black
        return image
    }()
    private let timeTextView: UITextView = {
        let textView = UITextView()
        textView.text = "13:00"
        textView.font = .systemFont(ofSize: 16)
        textView.backgroundColor = .none
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    private let weatherTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Clear"
        textView.font = .systemFont(ofSize: 16)
        textView.backgroundColor = .none
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "22ºC"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(weatherImage)
        contentView.addSubview(timeTextView)
        contentView.addSubview(weatherTextView)
//        contentView.addSubview(weatherLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
    }
    


}
