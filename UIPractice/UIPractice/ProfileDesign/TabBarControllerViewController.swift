//
//  TabBarControllerViewController.swift
//  UIPractice
//
//  Created by t2023-m0099 on 1/31/24.
//

import Foundation
import UIKit

class TabBarControllerViewController: UITabBarController {
    
    let firstVC = ProfileDesignVC()
    let secondVC = MyVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setTabBar() {
        self.viewControllers = [firstVC, secondVC]
        firstVC.tabBarItem = UITabBarItem(title: "<", image: UIImage(named: ""), tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Me"), tag: 1)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 60) // 폰트와 크기를 설정합니다.
        ]
        firstVC.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
    }
}
