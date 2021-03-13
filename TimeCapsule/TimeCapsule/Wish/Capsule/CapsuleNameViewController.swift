//
//  CapsuleNameViewController.swift
//  TimeCapsule
//
//  Created by Beomcheol Kwon on 2021/03/12.
//

import UIKit
import Alamofire

class CapsuleNameViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var nameTextView: UITextView!
    @IBOutlet weak var completionButton: UIButton!
    @IBOutlet weak var textCountLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var name: String = "test"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func completionButtonTapped(_ sender: Any) {
        //닉네임 변경하기
        editName(content: name)
        
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
        welcomeLabel.text = "\(name)님 환영합니다!"
        welcomeLabel.textColor = .white
    }

    func editName(content: String) {
        let url = URLType.capsuleName.makeURL
        let headers: HTTPHeaders = ["X-ACCESS-TOKEN": Constant.testToken]
        let params = ["capulseName": content]
        AF.request(url, method: .patch, parameters: params, encoder: JSONParameterEncoder.default, headers: headers)
            .response { response in
                print(response)
                self.dismiss(animated: true, completion: nil)
            }
    }
}

extension CapsuleNameViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        textCountLabel.text = "(\(min(updatedText.count,10))/10)"
        return updatedText.count <= 10
    }
}
