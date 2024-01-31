//
//  ViewController.swift
//  UIPractice
//
//  Created by t2023-m0099 on 1/26/24.
//

import UIKit
import SnapKit

#Preview{
    MainViewController()
}

class MainViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MainTableVC.self, forCellReuseIdentifier: MainTableVC.identi)
        return tableView
    }()
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Cat")
        
        return image
    }()
    private lazy var profileButton: UIButton = {
        let profileButton = UIButton()
        profileButton.setTitle("✨It's ME✨", for: .normal)
        profileButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        profileButton.setTitleColor(.systemPurple, for: .normal)
        profileButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return profileButton
    }()
    
    @objc func buttonTapped() {
        let tabBarController = TabBarControllerViewController()
        present(tabBarController, animated: true, completion: nil)
    }
    
    private lazy var todoListButton: UIButton = {
        let todoListButton = UIButton()
        todoListButton.setTitle("Todo List✊", for: .normal)
        todoListButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        todoListButton.setTitleColor(.systemGray, for: .normal)
        return todoListButton
    }()
    
    private lazy var doneListButton: UIButton = {
        let doneListButton = UIButton()
        doneListButton.setTitle("Perfect Day", for: .normal)
        doneListButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        doneListButton.setTitleColor(.systemGray, for: .normal)
        
        return doneListButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white        
        tableView.dataSource = self
        tableView.delegate = self
        
        addSubView()
        setAutoLayout()
    }
    
    private func addSubView() {
        self.view.addSubview(tableView)
        tableView.addSubview(image)
        tableView.addSubview(profileButton)
        tableView.addSubview(todoListButton)
        tableView.addSubview(doneListButton)
    }
    
    // MARK: SnapKit AutoLayout
    private func setAutoLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        image.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
            make.width.equalTo(300)
            make.height.equalTo(240)
        }
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        todoListButton.snp.makeConstraints { make in
            make.top.equalTo(profileButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            }
        
        doneListButton.snp.makeConstraints { make in
            make.top.equalTo(todoListButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableVC.identi, for: indexPath) as! MainTableVC
        
        return cell
    }
}
