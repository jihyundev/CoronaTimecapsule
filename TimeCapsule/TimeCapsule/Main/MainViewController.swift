//
//  MainViewController.swift
//  TimeCapsule
//
//  Created by Beomcheol Kwon on 2021/03/12.
//

import UIKit
import SpriteKit
import Alamofire

class MainViewController: UIViewController {

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var editCapsuleNameButton: UIButton!
    @IBOutlet weak var listButton: UIButton!
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var currentItems: Int = 0
    var index: Int = 0
    
    lazy var rocketImageView: UIImageView = {
       let view = UIImageView(image: UIImage(named: "rocket"))
        view.frame.size.width = 300
        view.frame.size.height = 745
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeGameScene()
        backImageView.contentMode = .scaleAspectFill
        prepareRocket()
        setupUI()
        getAllMarbles()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCapsule()
        isCapsuleOpen()
    }
    @IBAction func editCapsuleButtonTapped(_ sender: Any) {
        let nextVC = CapsuleNameViewController()
        nextVC.modalPresentationStyle = .overCurrentContext
        present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func listButtonTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ListViewController") as! ListViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func myPageButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let nextVC = AddWishViewController()
        nextVC.modalPresentationStyle = .overCurrentContext
        present(nextVC, animated: true, completion: nil)
    }
    
    func setupUI() {
        listButton.layer.cornerRadius = 20
        listButton.borderWidth = 3
        listButton.borderColor = UIColor.init(hex: 0x76FF95)
        
        countLabel.layer.cornerRadius = 13.5
        countLabel.layer.masksToBounds = true
        countLabel.backgroundColor = UIColor.init(hex: 0xB4CBF2).withAlphaComponent(0.5)
        
        addButton.layer.cornerRadius = 26
        addButton.layer.zPosition = 10
    }
    func prepareRocket() {
        view.addSubview(rocketImageView)
        rocketImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rocketImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        print(rocketImageView.frame.size)
    }
    
    func makeGameScene() {
        let scene = GameScene(size: self.gameView.bounds.size)
        let skView = self.gameView as! SKView
        scene.currentItemCount = currentItems
        scene.index = index
        
        scene.backgroundColor = .clear
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFit
        skView.presentScene(scene)
    }
    
    func getCapsule() {
        let headers: HTTPHeaders = ["X-ACCESS-TOKEN": Constant.testToken]
        NetworkService.getData(type: .capsuleInfo, headers: headers, parameters: nil) { [weak self] (result: Result<CapsuleInfo,APIError>) in
            guard let self = self else {fatalError()}
            switch result {
            case .success(let model):
                print(model)
                self.nameLabel.text = model.capsuleName
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getMarbles(index: Int) {
        let headers: HTTPHeaders = ["X-ACCESS-TOKEN": Constant.testToken]
        let parameters = ["marbleColor": "\(index)"]
        NetworkService.getData(type: .marbleList, headers: headers, parameters: parameters) { [weak self] (result: Result<Marbles,APIError>) in
            switch result {
            case .success(let model):
                print(model)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getAllMarbles() {
        let headers: HTTPHeaders = ["Accept": "application/json",
            "X-ACCESS-TOKEN": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOjEsImlhdCI6MTYxNTU1MTI1MX0.azhpQs7mOZhUBY46A9XOz_xzD18nfX59wqacFcmuqWM"]
        NetworkService.getData(type: .marbleList, headers: headers, parameters: nil) { [weak self] (result: Result<Marbles,APIError>) in
            switch result {
            case .success(let model):
                print("1")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    func isCapsuleOpen() {
        let headers: HTTPHeaders = ["Accept": "application/json",
                                    "X-ACCESS-TOKEN": Constant.testToken]
        let url = URLType.capsuleOpen.makeURL
        
        AF.request(url, headers: headers).responseJSON { response in
            if let data = response.data {
                if let result = String(data: data, encoding: .utf8), result == "true" {
                    print("코로나 종식")
                } else {
                    print("코로나 중")
                }
            }
        }
        
    }

}
