//
//  MainViewController.swift
//  TimeCapsule
//
//  Created by 정지현 on 2021/03/12.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func listButtonTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ListViewController") as! ListViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func myPageButtonTapped(_ sender: Any) {
    }
    

}
