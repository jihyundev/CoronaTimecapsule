//
//  WishlistViewController.swift
//  TimeCapsule
//
//  Created by 정지현 on 2021/03/12.
//

import UIKit

class WishlistViewController: UIViewController {
    
    let wishCell = WishlistCell()
    var wishes = ["유럽여행", "워터파크", "콘서트", "디즈니랜드", "미국도 갈거야"]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var purpleView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.4756628871, green: 0.3672500849, blue: 0.8775171638, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "WishlistCell", bundle: nil), forCellReuseIdentifier: wishCell.cellID)
        tableView.rowHeight = 80
        tableView.backgroundColor = #colorLiteral(red: 0.4756628871, green: 0.3672500849, blue: 0.8775171638, alpha: 1)
        
        redView.layer.cornerRadius = 8
        redView.layer.borderColor = UIColor.black.cgColor
        redView.layer.borderWidth = 3
        yellowView.layer.cornerRadius = 8
        yellowView.layer.borderColor = UIColor.black.cgColor
        yellowView.layer.borderWidth = 3
        greenView.layer.cornerRadius = 8
        greenView.layer.borderColor = UIColor.black.cgColor
        greenView.layer.borderWidth = 3
        blueView.layer.cornerRadius = 8
        blueView.layer.borderColor = UIColor.black.cgColor
        blueView.layer.borderWidth = 3
        purpleView.layer.cornerRadius = 8
        purpleView.layer.borderColor = UIColor.black.cgColor
        purpleView.layer.borderWidth = 3
        
    }

}

extension WishlistViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: wishCell.cellID) as! WishlistCell
        cell.wishLabel.text = wishes[indexPath.row]
        return cell
    }
}
