//
//  HeaderView.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 2.10.21.
//

import UIKit
//MARK: - Header View class
class HeaderCellView: UITableViewHeaderFooterView {
//MARK: - Static properties for Header View
    static let reuseId = "HeaderView"
    static let headerSectionHeight: CGFloat = 50
//MARK: -viewModel for Header in TableView
    weak var headerViewModel: HeaderCellViewModelProtocol? {
        willSet(headerViewModel) {
            guard let headerViewModel = headerViewModel else { return }
            headerLabel.text = headerViewModel.headerLabelText
        }
    }
//MARK: - HeaderView UI elements
    let headerLabel: UILabel = {
       let label = UILabel()
        label.text = "Header"
        label.textAlignment = .left
        return label
    }()
//MARK: - Initialisation
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(headerLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let labelSize = contentView.frame.size.height - 24
        headerLabel.font = UIFont.systemFont(ofSize: labelSize)
        
        headerLabel.frame = CGRect(x: 16,
                                   y: (contentView.frame.height - labelSize) / 2,
                                   width: contentView.frame.width - 20,
                                   height: labelSize)
    }
}
