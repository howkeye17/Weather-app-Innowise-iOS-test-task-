//
//  ViewController.swift
//  Weather app (Innowise iOS test task)
//
//  Created by Valera Vasilevich on 25.09.21.
//

import UIKit

class TabBarController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let todayVC = TodayViewController()
        let forecastVC = ForecastViewController()
        
        todayVC.title = "Today"
        todayVC.view.backgroundColor = .gray
        todayVC.tabBarItem.image = UIImage(systemName: "sun.max")
        
        forecastVC.title = "Forecast"
//        forecastVC.view.backgroundColor = .systemGray
        forecastVC.tabBarItem.image = UIImage(systemName: "cloud.moon")
        
        self.setViewControllers([todayVC, forecastVC], animated: false)
        self.modalPresentationStyle = .fullScreen
        self.tabBar.barTintColor = .white
    }


}

