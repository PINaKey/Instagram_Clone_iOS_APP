//
//  CustomButton.swift
//  InstagramFirestoreTutorial
//
//  Created by Pinaki Bandyopadhyay on 06/02/1401 AP.
//  Copyright © 1401 AP Pinaki Bandyopadhyay. All rights reserved.
//

import UIKit

//Not using this custom class as can't able to set typr of button to system
class CustomButton: UIButton {
    
    init(placeholder: String){
        //super.init(type: .system)
        super.init(frame: .zero)
        setTitle(placeholder, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 5
        backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        setHeight(50)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
