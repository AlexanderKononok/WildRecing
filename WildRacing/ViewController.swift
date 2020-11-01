//
//  ViewController.swift
//  WildRacing
//
//  Created by Alexander Kononok on 9/27/20.
//

import UIKit

class ViewController: UIViewController {

  let speed = Speed.normal
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let backgroundImg = UIImageView(frame: UIScreen.main.bounds)
    backgroundImg.image = UIImage(named: "Menu")
    backgroundImg.contentMode = UIView.ContentMode.scaleToFill
    backgroundImg.backgroundColor = .black
    self.view.insertSubview(backgroundImg, at: 0)
  }
  
  @IBAction func startGameButtonPressed(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let gameViewController = storyboard.instantiateViewController(identifier: String(describing: GameViewController.self)) as! GameViewController
    
    navigationController?.pushViewController(gameViewController, animated: true)
    
    switch speed {
    case .easy:
      gameViewController.startGame(speedTheGame: Int(speed.rawValue)!)
    case .normal:
      gameViewController.startGame(speedTheGame: Int(speed.rawValue)!)
    case .hard:
      gameViewController.startGame(speedTheGame: Int(speed.rawValue)!)
    }
  }
  
  @IBAction func showRecordsButtonPressed(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let recordsViewController = storyboard.instantiateViewController(identifier: String(describing: RecordsViewController.self)) as! RecordsViewController
    
    navigationController?.pushViewController(recordsViewController, animated: true)
  }
  
  @IBAction func openSettingsButtonPressed(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let settingsViewController = storyboard.instantiateViewController(identifier: String(describing: SettingsViewController.self)) as! SettingsViewController
    
    navigationController?.pushViewController(settingsViewController, animated: true)
  }
  
}
