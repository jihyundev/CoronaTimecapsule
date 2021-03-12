//
//  WishViewController.swift
//  TimeCapsule
//
//  Created by 정지현 on 2021/03/12.
//

import UIKit

class WishViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func mainButtonTapped(_ sender: Any) {
        guard let pvc = self.presentingViewController else { return }
//        let nextVC = MainViewController()
//        nextVC.modalPresentationStyle = .overCurrentContext
//        self.dismiss(animated: true) {
//            pvc.present(nextVC, animated: true, completion: nil)
//        }
        let nextVC = AddWishViewController()
        nextVC.modalPresentationStyle = .overCurrentContext
        self.dismiss(animated: true) {
            pvc.present(nextVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
