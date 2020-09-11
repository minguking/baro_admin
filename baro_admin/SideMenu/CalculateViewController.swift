//
//  SecondViewController.swift
//  baro_admin
//
//  Created by Kang Mingu on 2020/09/09.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

private let cell1 = "cell1"
private let cell2 = "cell2"

class CalculateViewController: UIViewController {
    
    // MARK: - Properties
    
    var date = ""
    
    let newView = CustomView()
    let buttonView = UIView()
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("기간설정", for: .normal)
        button.tintColor = .black
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(handleSetDate), for: .touchUpInside)
        return button
    }()
    
    let tableView1 = UITableView()
    let tableView2 = UITableView()
    
    var totalOrder = 20000
    var totalCoupon = 5000
    
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        view.alpha = 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        newView.delegate = self
        
        
        configureUI()
    }
    
    
    // MARK: - Selector
    
    @objc func handleSetDate() {
        let vc = PopUpViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
        vc.delegate = self
    }
    
    
    // MARK: - Helper
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        navigationItem.title = "주문 정산"
        
        view.addSubview(buttonView)
        view.addSubview(newView)
        buttonView.addSubview(button)
        view.addSubview(tableView1)
        view.addSubview(tableView2)
        
        tableView1.register(OrderCell.self, forCellReuseIdentifier: cell1)
        tableView2.register(TotalCell.self, forCellReuseIdentifier: cell2)
        
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView2.delegate = self
        tableView2.dataSource = self
        
        tableView1.separatorStyle = .none
        tableView2.separatorStyle = .none
        
        
        newView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, height: 60)
        buttonView.anchor(top: newView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, height: 50)
        button.anchor(right: buttonView.rightAnchor, paddingRight: 10, width: 80, height: 40)
        button.layer.cornerRadius = 10
        button.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        tableView1.anchor(top: buttonView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        tableView2.anchor(top: buttonView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        
        button.backgroundColor = .lightGray
        buttonView.backgroundColor = .white
        tableView2.isHidden = true
    }

}

extension CalculateViewController: CustomViewDelegate {
    
    
    func filterView(_ view: CustomView, didselect indexPath: Int) {
        
        if indexPath == 0 {
            tableView2.isHidden = true
            tableView1.isHidden = false
        } else {
            tableView2.isHidden = false
            tableView1.isHidden = true
        }
        
    }
}

extension CalculateViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tableView1 {
            return 3
            
        } else {
            return 1
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableView1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cell1, for: indexPath) as! OrderCell
            
            cell.orderTime.text = "주문일시 : \(date)"
            cell.orderQuantity.text = "총 주문 갯수 : 1"
            cell.totalPrice.text = "결제 금액 : 10000 원"
            cell.userPhoneNum.text = "회원 전화번호 : 01012341223"
            cell.statusLabel.text = "결제완료"
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cell2, for: indexPath) as! TotalCell
            
            cell.totalOrder.text = "주문 금액 : \(totalOrder)원"
            cell.totalCoupon.text = "쿠폰 할인 금액 : \(totalCoupon)원"
            cell.finalPrice.text = "정산 예정 금액 : \(totalOrder - totalCoupon)원"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == tableView1 {
            
            return 160
        } else {
            
            return 200
        }
    }
    
}

extension CalculateViewController: sendDateDelegate {
    
    func sendDate(date: Date) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 hh시 mm분"

        let startDate = dateFormatter.string(from: date)
        
        print("start date = \(startDate)")
        self.date = "\(startDate)"
        self.tableView1.reloadData()
    }
    
}
