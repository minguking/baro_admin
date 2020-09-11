//
//  SideMenuController.swift
//  baro_admin
//
//  Created by Kang Mingu on 2020/09/09.
//  Copyright © 2020 Kang Mingu. All rights reserved.
//

import UIKit

class SideMenuController: UITableViewController {
    
    let cellId = "cell"
    var items = ["가게정보변경", "메뉴정보변경", "주문정산", "통계"]
    let header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    // MARK: - Helper
    
    func configureUI() {
        
        tableView.separatorStyle = .none
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableHeaderView = header
        
        let label = UILabel(frame: header.bounds)
        let str = "  환영합니다\n  김성재 고객님" // 공백 유의
        let attributedString = NSMutableAttributedString(string: str)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 28), range: NSRange(location: 0, length: 7))
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 36), range: NSRange(location: 8, length: 5))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 13, length: 4))
        label.attributedText = attributedString
        label.numberOfLines = 0
        label.textAlignment = .left
        header.addSubview(label)
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let vc = StoreInfoViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            print("selected!")
        case 2:
            let vc = CalculateViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = StatViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("selected!")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    

}
