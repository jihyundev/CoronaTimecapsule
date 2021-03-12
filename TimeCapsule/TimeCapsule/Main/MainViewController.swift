//
//  MainViewController.swift
//  TimeCapsule
//
//  Created by Beomcheol Kwon on 2021/03/12.
//

import UIKit
import SpriteKit

class MainViewController: UIViewController {

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var editCapsuleNameButton: UIButton!
    @IBOutlet weak var listButton: UIButton!
    
    @IBOutlet weak var countLabel: UILabel!
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
        countLabel.backgroundColor = UIColor.init(hex: 0xB4CBF2).withAlphaComponent(0.5)
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
    
}
