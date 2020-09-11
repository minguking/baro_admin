//
//  OrderCell.swift
//  baro_admin
//
//  Created by Kang Mingu on 2020/09/10.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {
    
    // MARK: - Properties
    
    let orderTime = UILabel()
    let orderQuantity = UILabel()
    let totalPrice = UILabel()
    let userPhoneNum = UILabel()
    let howLong = UILabel()
    lazy var detailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("상세보기", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(handleDetail), for: .touchUpInside)
        return button
    }()
    
    let statusLabel = UILabel()
    
    let underLine = UIView()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    // MARK: - Selector
    
    @objc func handleDetail() {
        
        print("show detail")
    }
    
    
    // MARK: - Helper
    
    func configureUI() {
        
        addSubview(orderTime)
        addSubview(orderQuantity)
        addSubview(totalPrice)
        addSubview(userPhoneNum)
        addSubview(howLong)
        addSubview(detailButton)
        addSubview(underLine)
        addSubview(statusLabel)
        
        orderTime.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 16)
        orderQuantity.anchor(top: orderTime.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 16)
        totalPrice.anchor(top: orderQuantity.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 16)
        userPhoneNum.anchor(top: totalPrice.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 16)
        underLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 30, paddingBottom: 20, paddingRight: 30, height: 2)
        underLine.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        statusLabel.anchor(top: topAnchor, right: rightAnchor, paddingTop: 20, paddingRight: 26)
        detailButton.anchor(top: statusLabel.bottomAnchor, right: rightAnchor, paddingTop: 20, paddingRight: 20, width: 80, height: 40)
        
        orderTime.font = .systemFont(ofSize: 15)
        orderQuantity.font = .systemFont(ofSize: 15)
        totalPrice.font = .systemFont(ofSize: 15)
        userPhoneNum.font = .systemFont(ofSize: 15)
        statusLabel.font = .systemFont(ofSize: 20)
        underLine.backgroundColor = .black
    }

}
