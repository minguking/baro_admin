//
//  PopUpViewController.swift
//  baro_admin
//
//  Created by Kang Mingu on 2020/09/10.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

protocol sendDateDelegate {
    func sendDate(date: Date)
}

class PopUpViewController: UIViewController {
    
    // MARK: - Properties
    
    var delegate: sendDateDelegate?
    
    let centerView = UIView()
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("✖︎", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return button
    }()
    
    let startLabel = UILabel()
    let endLabel = UILabel()
    
    let startDate: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        let loc = Locale.init(identifier: "ko_KO")
        picker.locale = loc
        return picker
    }()
    
    let endDate: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        let loc = Locale.init(identifier: "ko_KO")
        picker.locale = loc
        return picker
    }()
    
    lazy var setButton: UIButton = {
        let button = UIButton()
        button.setTitle("기간 설정 완료", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleSet), for: .touchUpInside)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        return button
    }()
    
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    // MARK: - Selector
    
    @objc func handleCancel() {
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSet() {
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
//
//        let startDate = dateFormatter.string(from: sender.date)
        
        delegate?.sendDate(date: startDate.date)
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Helper
    
    func configureUI() {
        
        view.addSubview(centerView)
        centerView.addSubview(startDate)
        centerView.addSubview(endDate)
        centerView.addSubview(cancelButton)
        centerView.addSubview(startLabel)
        centerView.addSubview(endLabel)
        centerView.addSubview(setButton)
        
        centerView.layer.cornerRadius = 15
        
        centerView.setDimensions(width: 320, height: 500)
        centerView.center(inView: view)
        
        cancelButton.anchor(top: centerView.topAnchor, left: centerView.leftAnchor, paddingTop: 20, paddingLeft: 20)
        
        startLabel.anchor(top: cancelButton.bottomAnchor, left: centerView.leftAnchor, paddingTop: 8, paddingLeft: 16)
        
        startDate.anchor(top: startLabel.bottomAnchor, left: centerView.leftAnchor, right: centerView.rightAnchor, paddingLeft: 16, paddingRight: 16, height: 160)
        
        endLabel.anchor(top: startDate.bottomAnchor, left: centerView.leftAnchor, paddingTop: 8, paddingLeft: 16)
        
        endDate.anchor(top: endLabel.bottomAnchor, left: centerView.leftAnchor, right: centerView.rightAnchor, paddingLeft: 10, paddingRight: 8, height: 160)
        
        setButton.anchor(left: centerView.leftAnchor, bottom: centerView.bottomAnchor, right: centerView.rightAnchor, paddingLeft: 16, paddingBottom: 12, paddingRight: 16, height: 50)
        
        
        centerView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.backgroundColor = .clear
        
        startLabel.text = "시작일 :"
        endLabel.text = "종료일 :"
        
        
        
        
        
    }

}
