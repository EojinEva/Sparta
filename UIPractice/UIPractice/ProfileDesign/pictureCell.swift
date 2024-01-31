//
//  pictureCell.swift
//  UIPractice
//
//  Created by t2023-m0099 on 1/31/24.
//

import UIKit
import SnapKit

class pictureCell: UICollectionViewCell {
    static let identi = "pictureCell"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPicture(model : UIImage){
        imageView.image = model
    }
}

