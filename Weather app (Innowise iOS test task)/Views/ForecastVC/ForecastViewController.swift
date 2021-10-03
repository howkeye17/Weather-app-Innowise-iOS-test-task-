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
//MARK: - Lifecycle of the ForecastViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        forecstViewModel = ForecastViewModel()
        tableView.register(WeatherCell.self, forCellReuseIdentifier: WeatherCell.reuseId)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.reuseId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        forecstViewModel?.fetchWeatherForecast { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    

// MARK: - Table View DataSource methods
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.reuseId) as? HeaderView else { return
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.reuseId, for: indexPath) as? WeatherCell else
            { return UITableViewCell() }
        let cellViewModel = forecstViewModel?.cellViewModel(forIndexPath: indexPath)
        cell.cellViewModel = cellViewModel
        return cell
    }
    
// MARK: - Table View Delegate methods
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HeaderView.headerSectionHeight
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return WeatherCell.rowHeight
    }
    
}
