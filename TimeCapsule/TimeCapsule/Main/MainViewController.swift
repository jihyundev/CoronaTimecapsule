//
//  MainViewController.swift
//  TimeCapsule
//
//  Created by 정지현 on 2021/03/12.
//

import UIKit
import SpriteKit

class MainViewController: UIViewController {

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var gameView: UIView!
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
    }
    
    @IBAction func listButtonTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ListViewController") as! ListViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func myPageButtonTapped(_ sender: Any) {
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
        scene.backgroundColor = .clear
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFit
        skView.presentScene(scene)
    }
    
}
