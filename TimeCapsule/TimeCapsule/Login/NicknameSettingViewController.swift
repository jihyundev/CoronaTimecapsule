//
//  NicknameSettingViewController.swift
//  TimeCapsule
//
//  Created by 정지현 on 2021/03/12.
//

import UIKit

class NicknameSettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func wishButtonTapped(_ sender: Any) {
        guard let pvc = self.presentingViewController else { return }
        let nextVC = WishViewController()
        nextVC.modalPresentationStyle = .overCurrentContext
        self.dismiss(animated: true) {
            pvc.present(nextVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
  

}
