//
//  MyVC.swift
//  UIPractice
//
//  Created by t2023-m0099 on 1/30/24.
//

import UIKit
import SnapKit

#Preview {
    MyVC()
}

class MyVC: UIViewController {
    
    var userinfo: [String] = ["Name", "Age"]
    
    
    
    private lazy var myTableView: UITableView = {
        let myTableView = UITableView()
        myTableView.backgroundColor = .white
        return myTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white 
        configureMyVC()
        myTableView.register(MyCell.self, forCellReuseIdentifier: MyCell.identi)
        self.view.addSubview(myTableView)
        autoLayout()
    

        // Do any additional setup after loading the view.
    }
    
    private func autoLayout() {
        myTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    

}
extension MyVC: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userinfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: MyCell.identi, for: indexPath) as? MyCell else { return UITableViewCell()}
        cell.setLabel(model: userinfo[indexPath.row])
        cell.layoutMargins.bottom = 10
        return cell
    }
    
}

extension MyVC {
    private func configureMyVC() {
        myTableView.dataSource = self
        myTableView.delegate = self
    }
}
