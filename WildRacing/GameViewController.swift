//
//  GameViewController.swift
//  WildRacing
//
//  Created by Alexander Kononok on 9/27/20.
//

import UIKit

class GameViewController: UIViewController {
  
  var roadImageView = UIImageView()
  var myCarImageView = UIImageView()
  
  let leftTurnButton = UIButton(type: .custom)
  let rightTurnButton = UIButton(type: .custom)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // MARK: -Add road image
    let roadImage = UIImage(named: "Road2Lines")
    roadImageView.image = roadImage
    roadImageView.frame = CGRect(x: 0, y: -(view.frame.height),
                                 width: view.frame.width, height: view.frame.height * 2)
    view.addSubview(roadImageView)
    
    // MARK: -Add my car image
    let myCar = UIImage(named: "Red-Car-Up")
    myCarImageView.image = myCar
    myCarImageView.frame = CGRect(x: view.frame.width / 2 + myCarImageView.frame.width / 2 + 20,
                                  y: view.frame.height - 250,
                                  width: 130,
                                  height: 200)
    view.addSubview(myCarImageView)
    
    // MARK: -Add button for move my car to left
    leftTurnButton.frame = CGRect(x: 46,
                                  y: view.frame.height - 40,
                                  width: (view.frame.width / 2) - 48,
                                  height: 40)
    leftTurnButton.backgroundColor = .systemPink
    leftTurnButton.setTitle("LEFT", for: .normal)
    leftTurnButton.addTarget(self, action: #selector(leftPressed), for: .touchUpInside)
    view.addSubview(leftTurnButton)
    
    // MARK: -Add button to move my car to right
    rightTurnButton.frame = CGRect(x: view.frame.width - myCarImageView.frame.width - 74,
                                   y: leftTurnButton.frame.origin.y,
                                   width: leftTurnButton.frame.width,
                                   height: leftTurnButton.frame.height)
    rightTurnButton.backgroundColor = leftTurnButton.backgroundColor
    rightTurnButton.setTitle("RIGHT", for: .normal)
    rightTurnButton.addTarget(self, action: #selector(rightPressed), for: .touchUpInside)
    view.addSubview(rightTurnButton)
  }
  
  
  func startGame(speedTheGame: Int) {
    Timer.scheduledTimer(withTimeInterval: TimeInterval(Float.random(in: 1...4)), repeats: true) { (_) in
      UIView.animate(withDuration: TimeInterval(speedTheGame), delay: 0, options: [.repeat, .curveLinear]) {
        self.roadImageView.frame.origin.y = self.view.frame.minY
      }
    }
  }
  
  // MARK: -Move my car to left
  @objc func leftPressed(sender: UIButton) {
    UIView.animate(withDuration: 2) {
      self.myCarImageView.frame.origin.x -= (self.myCarImageView.frame.width + 40)
    }
  }
  
  //MARK: -Move my car to right
  @objc func rightPressed(sender: UIButton) {
    UIView.animate(withDuration: 2) {
      self.myCarImageView.frame.origin.x += (self.myCarImageView.frame.width + 40)
    }
  }
  
}
