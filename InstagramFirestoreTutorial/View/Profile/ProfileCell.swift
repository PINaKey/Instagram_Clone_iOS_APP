//
//  ProfileCell.swift
//  InstagramFirestoreTutorial
//
//  Created by Pinaki Bandyopadhyay on 28/04/22.
//  Copyright © 2022 Pinaki Bandyopadhyay. All rights reserved.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    //MARK: - Properties
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "venom-7")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        
        addSubview(postImageView)
        postImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
