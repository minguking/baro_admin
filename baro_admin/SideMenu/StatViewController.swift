//
//  StatViewController.swift
//  baro_admin
//
//  Created by Kang Mingu on 2020/09/11.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class StatViewController: UIViewController {
    
    // MARK: - Properties
    
    let buttonView = UIView()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("기간설정", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(handleSetDate), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    
    // MARK: - Selector
    
    @objc func handleSetDate() {
        
        
    }
    

    // MARK: - Helper
    
    func configureUI() {
        
        view.backgroundColor = .gray
        
        view.addSubview(buttonView)
        buttonView.addSubview(button)
        
        buttonView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, height: 50)
        buttonView.backgroundColor = .white
        button.anchor(right: buttonView.rightAnchor, paddingRight: 10, width: 80, height: 40)
        button.layer.cornerRadius = 10
        button.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
    }

}
