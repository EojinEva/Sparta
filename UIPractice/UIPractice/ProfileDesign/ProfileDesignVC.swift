//
//  ProfileDesignVC.swift
//  UIPractice
//
//  Created by t2023-m0099 on 1/26/24.
//
import Foundation
import UIKit
import SnapKit


#Preview{
    ProfileDesignVC()
}


class ProfileDesignVC: UIViewController {

    
    
    var collectionList = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6"), UIImage(named: "7")]
    private lazy var profileView: UIView = {
        let profileView = UIView()
        profileView.backgroundColor = .clear
        return profileView
    }()
    //유저네임(아이디)Label
    private lazy var userName: UILabel = {
        let userName = UILabel()
        userName.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userName.font = .boldSystemFont(ofSize: 18)
        userName.text = "더미유저네임"
        return userName
    }()
    
    private lazy var postLabel: UILabel = {
        let postLabel = UILabel()
        postLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        postLabel.frame = CGRect(x: 0, y: 0, width: 28, height: 19)
        postLabel.font = .systemFont(ofSize: 14)
        postLabel.text = "post"
        return postLabel
    }()
    
    private lazy var postNumberLabel: UILabel = {
        let postNumberLabel = UILabel()
        postNumberLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        postNumberLabel.font = .systemFont(ofSize: 16.5)
        postNumberLabel.text = "0"
        
        return postNumberLabel
    }()
    
    private lazy var followerLabel: UILabel = {
        let followerLabel = UILabel()
        followerLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        followerLabel.frame = CGRect(x: 0, y: 0, width: 28, height: 19)
        followerLabel.font = .systemFont(ofSize: 14)
        followerLabel.text = "follower"
        return followerLabel
    }()
    
    private lazy var followerNumberLabel: UILabel = {
        let followerNumberLabel = UILabel()
        followerNumberLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        followerNumberLabel.font = .systemFont(ofSize: 16.5)
        followerNumberLabel.text = "0"
        
        return followerNumberLabel
    }()
    
    private lazy var followingLabel: UILabel = {
        let followingLabel = UILabel()
        followingLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        followingLabel.frame = CGRect(x: 0, y: 0, width: 28, height: 19)
        followingLabel.font = .systemFont(ofSize: 14)
        followingLabel.text = "following"
        return followingLabel
    }()
    
    private lazy var followingNumberLabel: UILabel = {
        let followingNumberLabel = UILabel()
        followingNumberLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        followingNumberLabel.font = .systemFont(ofSize: 16.5)
        followingNumberLabel.text = "0"
        
        return followingNumberLabel
    }()
    //프로필 사진 영역
    private lazy var photoView: UIView = {
        let photoView = UIView()
        let ellipseView = UIImageView()
        ellipseView.image = UIImage(named: "Ellipse")
        //프로필 사진 설정
        ellipseView.frame = CGRect(x: 0, y: 0, width: 88, height: 88)
        photoView.addSubview(ellipseView)
        photoView.backgroundColor = .clear
        
        return photoView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(pictureCell.self, forCellWithReuseIdentifier: pictureCell.identi)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = true
        
        return collectionView
    }()
    
    //MARK: MiddleButton
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followButton, messageButton, moreButton])
        stackView.axis = .horizontal
        stackView.spacing = 8
        view.addSubview(stackView)

        return stackView
    }()

    private lazy var followButton: UIButton = {
        //Content Hugging Priority 낮추기
        let followButton = UIButton()
        let followView = UIImageView()
        followView.image = UIImage(named: "Follow")
        followView.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        followButton.addSubview(followView)

        return followButton
    }()

    private lazy var messageButton: UIButton = {

        //Content Hugging Priority 낮추기
    
        let messageButton = UIButton()
        let messageView = UIImageView()
        messageView.image = UIImage(named: "Message")
        messageView.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        messageButton.addSubview(messageView)

        return messageButton
    }()

    private lazy var moreButton: UIButton = {
        let moreButton = UIButton()
        let moreView = UIImageView()
        moreView.image = UIImage(named: "More")
        moreView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        moreButton.addSubview(moreView)

        return moreButton
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 14)
        nameLabel.text = "르탄이"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14.5)
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    
    private lazy var infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.text = """
                        iOS Developer 🍎
                        spartacodingclub.kr
                        """
        infoLabel.textColor = .black
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        infoLabel.numberOfLines = 0
        return infoLabel
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubView()
        autoLayout()
        configureCollection()
    }
    
    
    //MARK: addSubview
    private func addSubView() {
        self.view.addSubview(profileView)
        self.view.addSubview(stackView)
        self.profileView.addSubview(collectionView)
        self.profileView.addSubview(photoView)
        self.profileView.addSubview(userName)
        self.profileView.addSubview(postNumberLabel)
        self.profileView.addSubview(postLabel)
        self.profileView.addSubview(followerNumberLabel)
        self.profileView.addSubview(followerLabel)
        self.profileView.addSubview(followingNumberLabel)
        self.profileView.addSubview(followingLabel)
        self.profileView.addSubview(nameLabel)
        self.profileView.addSubview(infoLabel)
        
    }
    
    // MARK: snapkit 오토 레이아웃 잡기
    private func autoLayout() {
        profileView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(348)
            make.leading.bottom.trailing.equalTo(profileView.safeAreaLayoutGuide)
        }
        photoView.snp.makeConstraints { make in
            make.width.height.equalTo(88)
            make.leading.equalTo(profileView.snp.leading).offset(14)
            make.top.equalTo(profileView.snp.top).offset(93)
        }

        userName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        postNumberLabel.snp.makeConstraints{ make in
            make.top.equalTo(profileView.snp.top).offset(116)
            make.centerX.equalTo(followerNumberLabel.snp.leading).offset(-76)
            
        }
        postLabel.snp.makeConstraints { make in
            //make.width.equalTo(28)
            //make.height.equalTo(19)
            make.top.equalTo(postNumberLabel.snp.top).offset(25)
            //make.leading.equalTo(profileView.snp.leading).offset(143)
            make.centerX.equalTo(postNumberLabel)
        }
        followerNumberLabel.snp.makeConstraints{ make in
            make.top.equalTo(profileView.snp.top).offset(116)
            //make.leading.equalTo(postNumberLabel.snp.trailing).offset(76)
            make.centerX.equalTo(followingNumberLabel.snp.leading).offset(-76)
            //make.leading.equalTo(profileView.snp.leading).offset(232)
            
        }
        followerLabel.snp.makeConstraints { make in
            //make.width.equalTo(28)
            //make.height.equalTo(19)
            make.top.equalTo(postNumberLabel.snp.top).offset(25)
            //make.leading.equalTo(profileView.snp.leading).offset(143)
            make.centerX.equalTo(followerNumberLabel)
        }
        followingNumberLabel.snp.makeConstraints{ make in
            make.top.equalTo(profileView.snp.top).offset(116)
            make.trailing.equalTo(profileView.snp.trailing).offset(-50)
            
        }
        followingLabel.snp.makeConstraints { make in
            //make.width.equalTo(28)
            //make.height.equalTo(19)
            make.top.equalTo(postNumberLabel.snp.top).offset(25)
            //make.leading.equalTo(profileView.snp.leading).offset(143)
            make.centerX.equalTo(followingNumberLabel)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(profileView.snp.top).offset(265)
            make.leading.equalTo(view.snp.leading).offset(15)
            make.trailing.equalTo(view.snp.trailing).offset(-15)
            make.bottom.equalTo(collectionView.snp.top)
        }
        
        followButton.snp.makeConstraints { make in
            make.leading.equalTo(stackView.snp.leading)
            make.width.equalTo(messageButton.snp.width)
        }
        moreButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.trailing.equalTo(stackView.snp.trailing)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(photoView.snp.leading)
            make.top.equalTo(photoView.snp.bottom).offset(15)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.leading.equalTo(photoView.snp.leading)
            make.top.equalTo(nameLabel.snp.bottom).offset(1)
        }
    }
}

    
    //viwe하단에 탭바 추가해서 유저이름, 나이

extension ProfileDesignVC {
    private func configureCollection() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}


extension ProfileDesignVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pictureCell.identi, for: indexPath) as? pictureCell else { return UICollectionViewCell() }
        cell.setPicture(model: collectionList[indexPath.item]!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height / 3)
    }
    
}
