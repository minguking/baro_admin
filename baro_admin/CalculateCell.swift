//
//  CalculateCell.swift
//  baro_admin
//
//  Created by Kang Mingu on 2020/09/09.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class CalculateCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let title = UILabel()
    
    
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
