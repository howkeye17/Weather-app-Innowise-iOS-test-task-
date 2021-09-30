//
//  ForecastTableViewController.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 25.09.21.
//

import UIKit

class ForecastViewController: UITableViewController {
    
    private var forecstViewModel: ForecastViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(WeatherCell.self, forCellReuseIdentifier: WeatherCell.reuseId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        forecstViewModel = ForecastViewModel()
        forecstViewModel?.fetchWeatherForecast()
    }
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//     
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.reuseId, for: indexPath) as? WeatherCell else { return UITableViewCell() }

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
