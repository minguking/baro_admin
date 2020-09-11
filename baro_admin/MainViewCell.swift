//
//  MainViewCell.swift
//  baro_admin
//
//  Created by Kang Mingu on 2020/09/09.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class MainViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let orderTime = UILabel()
    let orderQuantity = UILabel()
    let totalPrice = UILabel()
    let userPhoneNum = UILabel()
    let howLong = UILabel()
    let completeButton = UIButton()
    
    let underLine = UIView()
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(orderTime)
        addSubview(orderQuantity)
        addSubview(totalPrice)
        addSubview(userPhoneNum)
        addSubview(howLong)
        addSubview(completeButton)
        addSubview(underLine)
        
        orderTime.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 16)
        orderQuantity.anchor(top: orderTime.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 16)
        totalPrice.anchor(top: orderQuantity.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 16)
        userPhoneNum.anchor(top: totalPrice.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 16)
        underLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 30, paddingBottom: 20, paddingRight: 30, height: 2)
        underLine.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        orderTime.font = .systemFont(ofSize: 15)
        orderQuantity.font = .systemFont(ofSize: 15)
        totalPrice.font = .systemFont(ofSize: 15)
        userPhoneNum.font = .systemFont(ofSize: 15)
        underLine.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helper
}
