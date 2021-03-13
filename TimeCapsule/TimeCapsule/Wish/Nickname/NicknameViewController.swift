//
//  NicknameViewController.swift
//  TimeCapsule
//
//  Created by Beomcheol Kwon on 2021/03/12.
//

import UIKit

class NicknameViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var nameTextView: UITextView!
    @IBOutlet weak var completionButton: UIButton!
    @IBOutlet weak var textCountLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextView.delegate = self
        setupUI()
    }
    @IBAction func completionButtonTapped(_ sender: Any) {
        guard let pvc = self.presentingViewController else { return }
        let nextVC = MainViewController()
        nextVC.modalPresentationStyle = .overCurrentContext
        self.dismiss(animated: true) {
            pvc.present(nextVC, animated: true, completion: nil)
        }
    }
    @IBAction func deleteButtonTapped(_ sender: Any) {
        nameTextView.text = ""
    }
    
    func setupUI() {
        containerView.layer.cornerRadius = 30
        containerView.borderWidth = 5
        containerView.borderColor = .black
        
        completionButton.layer.cornerRadius = 8
        completionButton.backgroundColor = UIColor.mainBlack
        completionButton.setTitle("완료", for: .normal)
        completionButton.setTitleColor(.white, for: .normal)
        completionButton.setTitleColor(.white, for: .selected)
        nameTextView.layer.cornerRadius = 9
        nameTextView.backgroundColor = UIColor.mainGrey
    }
    


}

extension NicknameViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        textCountLabel.text = "(\(min(updatedText.count,10))/10)"
        return updatedText.count <= 10
    }
}
