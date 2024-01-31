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
        myLabel.backgroundColor = .systemFill
        return myLabel
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16.0, left: 16, bottom: 16, right: 16))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(myLabel)
        layer.cornerRadius = 5
        layer.masksToBounds = true
        layer.borderWidth = 0.5
        
        prepareForReuse()
        myPageAutoLayout()
        layoutSubviews()
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
            make.edges.equalToSuperview()
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
