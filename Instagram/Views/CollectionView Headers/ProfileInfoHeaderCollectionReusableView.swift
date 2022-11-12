//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by Alonso Alas on 8/11/22.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowerButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
}

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    private let profilePhotoIMageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        
        return button
    }()
    
    private let followersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit your profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        
        return button
    }()
    
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Followig", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Alonso Alas"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the first Biography"
        label.textColor = .label
        label.numberOfLines = 0 // line wrap
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addButtonActions()
        backgroundColor = .systemBackground
        clipsToBounds = true
    }
    
    private func addSubviews() {
        addSubview(profilePhotoIMageView)
        addSubview(followersButton)
        addSubview(followingButton)
        addSubview(editProfileButton)
        addSubview(postButton)
        addSubview(bioLabel)
        addSubview(nameLabel)
    }
    
    private func addButtonActions() {
        followersButton.addTarget(self,
                                  action: #selector(didTapFollowerButton),
                                  for: .touchUpInside)
        followingButton.addTarget(self,
                                  action: #selector(didTapFollowingButton),
                                  for: .touchUpInside)
        postButton.addTarget(self,
                                  action: #selector(didTapPostsButton),
                                  for: .touchUpInside)
        editProfileButton.addTarget(self,
                                  action: #selector(didTapEditProfileButton),
                                  for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width / 4
        profilePhotoIMageView.frame = CGRect(x: 5,
                                             y: 5,
                                             width: profilePhotoSize,
                                             height: profilePhotoSize).integral
        
        profilePhotoIMageView.layer.cornerRadius = profilePhotoSize / 2.0
        
        
        let buttonHeight = profilePhotoSize / 2
        let countButtonWidth = (width-10-profilePhotoSize)/3
        
        postButton.frame = CGRect(x: profilePhotoIMageView.right,
                                  y: 5,
                                  width: countButtonWidth,
                                  height: buttonHeight).integral
        followersButton.frame = CGRect(x: postButton.right,
                                       y: 5,
                                       width: countButtonWidth,
                                       height: buttonHeight).integral
        followingButton.frame = CGRect(x: followersButton.right,
                                       y: 5,
                                       width: countButtonWidth,
                                       height: buttonHeight).integral
        
        editProfileButton.frame = CGRect(x: profilePhotoIMageView.right,
                                         y: 5 + buttonHeight,
                                         width: countButtonWidth*3,
                                         height: buttonHeight).integral
        
        nameLabel.frame = CGRect(x: 5,
                                 y: 5+profilePhotoIMageView.buttom,
                                 width: width - 10,
                                 height: 50).integral
        
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame = CGRect(x: 5,
                                 y: 5+nameLabel.buttom,
                                 width: width - 10,
                                height: bioLabelSize.height).integral
        
    }
    
    // Alonso: - Actions
    @objc private func didTapFollowerButton() {
        delegate?.profileHeaderDidTapFollowerButton(self)
    }
    
    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    
    @objc private func didTapPostsButton() {
        delegate?.profileHeaderDidTapPostButton(self)
    }
    
    @objc private func didTapEditProfileButton() {
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
    
}
