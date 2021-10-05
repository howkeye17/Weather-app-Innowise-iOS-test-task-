//
//  ViewController.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 25.09.21.
//

import UIKit
//MARK: - TabBarController Class
class TabBarController: UITabBarController{
//MARK: - Lifecycle of the TabBarController
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let todayVC = TodayViewController()
        let forecastVC = UINavigationController(rootViewController: ForecastViewController())
        
        todayVC.title = "Today"
        todayVC.view.backgroundColor = UIColor(named: "myBackgroundColor")
        todayVC.tabBarItem.image = UIImage(systemName: "sun.max")
        
        forecastVC.title = "Forecast"
        forecastVC.view.backgroundColor = UIColor(named: "myBackgroundColor")
        forecastVC.tabBarItem.image = UIImage(systemName: "cloud.moon")
        forecastVC.navigationBar.prefersLargeTitles = true
        
        self.setViewControllers([todayVC, forecastVC], animated: false)
        self.modalPresentationStyle = .fullScreen
        self.tabBar.barTintColor = UIColor(named: "myBackgroundColor")
        self.tabBar.tintColor = UIColor(named: "myTextColor")
        self.tabBar.backgroundColor = UIColor(named: "myBackgroundColor")
    }

}

