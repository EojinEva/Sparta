//
//  MyCell.swift
//  UIPractice
//
//  Created by t2023-m0099 on 1/31/24.
//

import UIKit

class MyCell: UITableViewCell {
    
    static let identi = "MyCellidenti"
    
    private lazy var myLabel: UILabel = {
        let myLabel = UILabel()
        return myLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(myLabel)
        
        prepareForReuse()
        myPageAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.textColor = .systemIndigo
        myLabel.sizeToFit()
        myLabel.textAlignment = .center
        myLabel.font = UIFont.systemFont(ofSize: 25)

    }
    
    func myPageAutoLayout(){ //오토레이아웃
        myLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-10)
            make.trailing.equalToSuperview().offset(-15)
        }
        }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setLabel(model : String){
        myLabel.text = model
    }

}
