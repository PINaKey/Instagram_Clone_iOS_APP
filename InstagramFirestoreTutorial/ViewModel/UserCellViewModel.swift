//
//  UserCellViewModel.swift
//  InstagramFirestoreTutorial
//
//  Created by Pinaki Bandyopadhyay on 01/05/22.
//  Copyright © 2022 Pinaki Bandyopadhyay. All rights reserved.
//

import Foundation

struct UserCellViewModel {
    
    private let user: User
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var userName: String {
        return user.userName
    }
    
    var fullName: String {
        return user.fullName
    }
    
    init(user: User) {
        self.user = user
    }
}
