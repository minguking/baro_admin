//
//  TotalCell.swift
//  baro_admin
//
//  Created by Kang Mingu on 2020/09/10.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class TotalCell: UITableViewCell {
    
    // MARK: - Properties
    
    let totalOrder = UILabel()
    let totalCoupon = UILabel()
    let underLine = UIView()
    let finalPrice = UILabel()
    
    
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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    // MARK: - Helper
    
    func configureUI() {
        
        addSubview(totalOrder)
        addSubview(totalCoupon)
        addSubview(underLine)
        addSubview(finalPrice)
        
        totalOrder.anchor(top: topAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 16)
        totalCoupon.anchor(top: totalOrder.bottomAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 16)
        underLine.anchor(top: totalCoupon.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16, height: 2)
        underLine.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        finalPrice.anchor(top: underLine.bottomAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 16)
        
        underLine.backgroundColor = .black
        
        
    }

}
