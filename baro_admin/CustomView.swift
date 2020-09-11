//
//  CustomView.swift
//  baro_admin
//
//  Created by Kang Mingu on 2020/09/10.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ProfileFilterCell"
private let reuseDetailIdentifier = "MyPageDetailCollectionReusableView"

protocol CustomViewDelegate: class {
    func filterView(_ view: CustomView, didselect indexPath: Int)
}


class CustomView: UIView {
    
    //MARK: - Properteis
    
    weak var delegate : CustomViewDelegate?
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        
        return view
    }()
    
    
    
    
    //MARK : - LifeCycles
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        
        
        collectionView.register(CalculateCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        let selectedIndexPath = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .left)
        
        
        addSubview(collectionView)
        collectionView.addConstraintsToFillView(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 10, paddingRight: 10, width: frame.width / 2 - 20 , height:  2)
    }
    
}


//MARK: - UICollectionViewDataSource

extension CustomView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CalculateCell
        
        if indexPath.row == 0 {
            cell.title.text = "주문내역조회"
        } else {
            cell.title.text = "정산내역조회"
        }
        
        return cell
    }
    
}


//MARK: - UICollectionViewDelegate

extension CustomView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width / 2, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
}


//MARK: - UICollectionViewFlowLayOut

extension CustomView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        let xPosition = cell?.frame.origin.x ?? 0
        
        CustomView.animate(withDuration: 0.3) {
            self.underlineView.frame.origin.x = xPosition + 10
        }
        
        delegate?.filterView(self, didselect: indexPath.row)
        
    }
    
}
