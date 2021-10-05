//
//  ForecastTableViewController.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 25.09.21.
//

import UIKit
//MARK: - ForecastViewController Class
class ForecastViewController: UITableViewController {
//MARK: - ViewModel for ForecastViewController
    private var forecstViewModel: ForecastViewModelProtocol?
//MARK: - UI elements for ForecastViewController
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        spinner.color = .black
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
//MARK: - Lifecycle of the ForecastViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        forecstViewModel = ForecastViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        forecstViewModel?.fetchWeatherForecast { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.spinner.removeFromSuperview()
                self.navigationController?.navigationBar.topItem?.title = self.forecstViewModel?.titleForForecastVC()
                self.tableView.reloadData()
            }
        }
    }
// MARK: - Table View DataSource methods
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderCellView.reuseId) as? HeaderCellView else { return
            UIView() }
        let headerViewModel = forecstViewModel?.headerViewModel(inSection: section)
        header.headerViewModel = headerViewModel
        return header
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return forecstViewModel?.numbersOfSections() ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecstViewModel?.numberOfRows(inSection: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCellView.reuseId, for: indexPath) as? WeatherCellView else
            { return UITableViewCell() }
        let cellViewModel = forecstViewModel?.cellViewModel(forIndexPath: indexPath)
        cell.cellViewModel = cellViewModel
        return cell
    }
    
// MARK: - Table View Delegate methods
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HeaderCellView.headerSectionHeight
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return WeatherCellView.rowHeight
    }
    
}
//MARK: - Extension for the setting up ForecastViewController
extension ForecastViewController {
    
    private func setupViewController() {
        self.tableView.backgroundColor = UIColor(named: "myBackgroundColor")
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "myBackgroundColor")
        self.tableView.allowsSelection = false
        
        tableView.register(WeatherCellView.self, forCellReuseIdentifier: WeatherCellView.reuseId)
        tableView.register(HeaderCellView.self, forHeaderFooterViewReuseIdentifier: HeaderCellView.reuseId)
        
        tableView.addSubview(spinner)
        NSLayoutConstraint.activate([spinner.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
                                     spinner.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)])
    }
}

