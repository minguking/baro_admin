//
//  ViewController.swift
//  baro_admin
//
//  Created by Kang Mingu on 2020/09/09.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit
import SideMenu

private let cellId = "cell"

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var leftButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(leftButtonTapped))
        return button
    }()
    
    lazy var rightSwitch: UISwitch = {
        let button = UISwitch()
        button.isOn = true
        button.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        return button
    }()
    
    let statusLabel = UILabel()
    let topView = UIView()
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let titleLabel = UILabel()
    
    let menu = SideMenuNavigationController(rootViewController: SideMenuController())
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    
    // MARK: - Selector
    
    @objc func leftButtonTapped() {
        present(menu, animated: true, completion: nil)
    }
    
    @objc func handleSwitch() {
        if rightSwitch.isOn {
            statusLabel.text = "영업중"
        } else {
            statusLabel.text = "준비중"
        }
    }
    
    
    // MARK: - Helper
    
    func configureUI() {
        
        menu.leftSide = true
        menu.menuWidth = view.frame.width * 0.8
        menu.presentationStyle = .menuSlideIn
        
        let layOut = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layOut)
        collectionView.delegate = self
        collectionView.dataSource = self
        layOut.scrollDirection = .vertical
        
        collectionView.register(MainViewCell.self, forCellWithReuseIdentifier: cellId)
        
        view.backgroundColor = .white
        
        topView.addSubview(statusLabel)
        view.addSubview(topView)
        view.addSubview(collectionView)
        topView.addSubview(titleLabel)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightSwitch)
        navigationItem.leftBarButtonItem = leftButton
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        statusLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 4, paddingRight: 16)
        topView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, height: 60)
        collectionView.anchor(top: topView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
        
        
        statusLabel.text = "영업중"
        titleLabel.text = "신규•처리중"
//        topView.backgroundColor = .yellow
        collectionView.backgroundColor = .white
        
    }
    
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MainViewCell
        
        cell.backgroundColor = .yellow
        
        cell.orderTime.text = "주문일시 : 2020년 9월 9일 29시 20분"
        cell.orderQuantity.text = "총 주문 갯수 : 1"
        cell.totalPrice.text = "결제 금액 : 10000 원"
        cell.userPhoneNum.text = "회원 전화번호 : 01012341223"
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width - 20, height: 160)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
    }
    
}
