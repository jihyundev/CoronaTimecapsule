//
//  FinishedListViewController.swift
//  TimeCapsule
//
//  Created by 정지현 on 2021/03/12.
//

import UIKit

class FinishedListViewController: UIViewController {
    
    let wishCell = FinishedListCell()
    
    var finishedWishes = ["제주도 가고싶다", "노래방", "그냥돌아다니기", "홍콩여행", "미국도 갈거야"]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.4529297948, green: 0.2904702425, blue: 1, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "FinishedListCell", bundle: nil), forCellReuseIdentifier: wishCell.cellID)
        tableView.rowHeight = 80
        tableView.backgroundColor = #colorLiteral(red: 0.4529297948, green: 0.2904702425, blue: 1, alpha: 1)
    }

}
extension FinishedListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finishedWishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: wishCell.cellID) as! FinishedListCell
        cell.wishLabel.text = finishedWishes[indexPath.row]
        return cell
    }
}
