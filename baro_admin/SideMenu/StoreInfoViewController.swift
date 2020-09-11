//
//  StoreInfoViewController.swift
//  baro_admin
//
//  Created by Kang Mingu on 2020/09/11.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class StoreInfoViewController: UIViewController {
    
    // MARK: - Properties
    
    let introTf: UITextField = {
        let tf = UITextField()
        tf.placeholder = "가게 소개에 대해 적어주세요"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let introSetButton: UIButton = {
        let button = UIButton()
        button.setTitle("가게소개 변경 적용", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(introSet), for: .touchUpInside)
        return button
    }()
    
    let dash: UILabel = {
        let dash = UILabel()
        dash.text = "−"
        return dash
    }()
    
    let openTf1: UITextField = {
        let tf = UITextField()
        tf.placeholder = "오픈시간"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let openTf2: UITextField = {
        let tf = UITextField()
        tf.placeholder = "오픈시간"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let openSetButton: UIButton = {
        let button = UIButton()
        button.setTitle("오픈시간 변경", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(openSet), for: .touchUpInside)
        return button
    }()
    
    let closeTf1: UITextField = {
        let tf = UITextField()
        tf.placeholder = "마감시간"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let closeTf2: UITextField = {
        let tf = UITextField()
        tf.placeholder = "마감시간"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let dash2: UILabel = {
        let dash = UILabel()
        dash.text = "−"
        return dash
    }()
    
    let closeSetButton: UIButton = {
        let button = UIButton()
        button.setTitle("마감시간 변경", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(closeSet), for: .touchUpInside)
        return button
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("저  장", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        return button
    }()
    
    let pencil1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "pencil")
        image.contentMode = .scaleToFill
        image.tintColor = .gray
        return image
    }()
    
    let pencil2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "pencil")
        image.contentMode = .scaleToFill
        image.tintColor = .gray
        return image
    }()
    
    let pencil3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "pencil")
        image.contentMode = .scaleToFill
        image.tintColor = .gray
        return image
    }()
    
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    
    // MARK: - Selector
    
    @objc func introSet() {
        print("intro set")
    }
    
    @objc func openSet() {
        print("open set")
    }
    
    @objc func closeSet() {
        print("close set")
    }
    
    @objc func handleSave() {
        print("handle save")
    }
    

    // MARK: - Helper
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        navigationItem.title = "가게 정보 변경"
        
        view.addSubview(introTf)
        view.addSubview(introSetButton)
        view.addSubview(openTf1)
        view.addSubview(openTf2)
        view.addSubview(dash)
        view.addSubview(openSetButton)
        view.addSubview(closeTf1)
        view.addSubview(closeTf2)
        view.addSubview(dash2)
        view.addSubview(closeSetButton)
        view.addSubview(saveButton)
        view.addSubview(pencil1)
        view.addSubview(pencil2)
        view.addSubview(pencil3)
        
        introTf.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 20, width: view.frame.width * 0.8, height: 36)
        pencil1.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: introTf.rightAnchor, paddingTop: 20, paddingLeft: 10, width: 30, height: 30)
        introSetButton.anchor(top: introTf.bottomAnchor, right: view.rightAnchor, paddingTop: 16, paddingRight: 20, width: 130, height: 36)
        openTf1.anchor(top: introSetButton.bottomAnchor, left: view.leftAnchor, paddingTop: 60, paddingLeft: 20, width: view.frame.width * 0.33, height: 36)
        dash.anchor(left: openTf1.rightAnchor, paddingLeft: 20)
        dash.centerYAnchor.constraint(equalTo: openTf1.centerYAnchor).isActive = true
        openTf2.anchor(top: introSetButton.bottomAnchor, left: dash.rightAnchor, paddingTop: 60, paddingLeft: 20, width: view.frame.width * 0.33, height: 36)
        pencil2.anchor(top: introSetButton.bottomAnchor, left: openTf2.rightAnchor, paddingTop: 60, paddingLeft: 10, width: 30, height: 30)
        openSetButton.anchor(top: openTf2.bottomAnchor, right: view.rightAnchor, paddingTop: 16, paddingRight: 20, width: 100, height: 36)
        
        closeTf1.anchor(top: openSetButton.bottomAnchor, left: view.leftAnchor, paddingTop: 60, paddingLeft: 20, width: view.frame.width * 0.33, height: 36)
        dash2.anchor(left: closeTf1.rightAnchor, paddingLeft: 20)
        dash2.centerYAnchor.constraint(equalTo: closeTf1.centerYAnchor).isActive = true
        closeTf2.anchor(top: openSetButton.bottomAnchor, left: dash.rightAnchor, paddingTop: 60, paddingLeft: 20, width: view.frame.width * 0.33, height: 36)
        pencil3.anchor(top: openSetButton.bottomAnchor, left: closeTf2.rightAnchor, paddingTop: 60, paddingLeft: 10, width: 30, height: 30)
        closeSetButton.anchor(top: closeTf2.bottomAnchor, right: view.rightAnchor, paddingTop: 16, paddingRight: 20, width: 100, height: 36)
        
        saveButton.anchor(top: closeSetButton.bottomAnchor, paddingTop: 100, width: view.frame.width * 0.8, height: 50)
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }

}
