//
//  ViewController.swift
//  TicTacInfinity
//
//  Created by Elliott Williams on 3/30/20.
//  Copyright © 2020 Moonshot Applications. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var boardView: UIView!
    
    var pick = "3 by 3"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LCM (3,4,5) = 60 ==== 60*5 = 300
        // 3x3: 300/3 = 100 per square
        // 4x4: 300/4 = 75
        // 5x5: 300/5 = 60
        
        
        // button 1
        let button = UIButton()
        // self.boardView.bounds.height - 60
        button.frame = CGRect(x: 0, y: 0, width: 95, height: 95)
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor(named: "mainBlue"), for: .normal)
        button.setTitle("O", for: .normal)
        button.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 60)
        

        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.boardView.addSubview(button)
        
        // button 2
        let button2 = UIButton()
        // self.boardView.bounds.height - 60
        button2.frame = CGRect(x: 105, y: 0, width: 95, height: 95)
        button2.backgroundColor = UIColor.white
        button2.setTitleColor(UIColor(named: "mainBlue"), for: .normal)
        button2.setTitle("X", for: .normal)
        button2.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 60)

        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.boardView.addSubview(button2)

        // button 3
        let button3 = UIButton()
        // self.boardView.bounds.height - 60
        button3.frame = CGRect(x: 210, y: 0, width: 95, height: 95)
        button3.backgroundColor = UIColor.white
        button3.setTitleColor(UIColor(named: "mainBlue"), for: .normal)
        button3.setTitle("X", for: .normal)
        button3.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 60)

        button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.boardView.addSubview(button3)

        
        
        
        
        // button 4 NEW ROW!
        let button4 = UIButton()
        // self.boardView.bounds.height - 60
        button4.frame = CGRect(x: 0, y: 105, width: 95, height: 95)
        button4.backgroundColor = UIColor.white
        button4.setTitleColor(UIColor(named: "mainBlue"), for: .normal)
        button4.setTitle("X", for: .normal)
        button4.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 60)

        button4.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.boardView.addSubview(button4)

        // button 5
        let button5 = UIButton()
        // self.boardView.bounds.height - 60
        button5.frame = CGRect(x: 105, y: 105, width: 95, height: 95)
        button5.backgroundColor = UIColor.white
        button5.setTitleColor(UIColor(named: "mainBlue"), for: .normal)
        button5.setTitle("X", for: .normal)
        button5.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 60)

        button5.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.boardView.addSubview(button5)

        // button 3
        let button6 = UIButton()
        // self.boardView.bounds.height - 60
        button6.frame = CGRect(x: 210, y: 105, width: 95, height: 95)
        button6.backgroundColor = UIColor.white
        button6.setTitleColor(UIColor(named: "mainBlue"), for: .normal)
        button6.setTitle("X", for: .normal)
        button6.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 60)
        button6.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.boardView.addSubview(button6)

        
        
        
        // button 4 NEW ROW!
        let button7 = UIButton()
        // self.boardView.bounds.height - 60
        button7.frame = CGRect(x: 0, y: 210, width: 95, height: 95)
        button7.backgroundColor = UIColor.white
        button7.setTitleColor(UIColor(named: "mainBlue"), for: .normal)
        button7.setTitle("X", for: .normal)
        button7.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 60)

        button7.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.boardView.addSubview(button7)

        // button 5
        let button8 = UIButton()
        // self.boardView.bounds.height - 60
        button8.frame = CGRect(x: 105, y: 210, width: 95, height: 95)
        button8.backgroundColor = UIColor.white
        button8.setTitleColor(UIColor(named: "mainBlue"), for: .normal)
        button8.setTitle("X", for: .normal)
        button8.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 60)

        button8.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.boardView.addSubview(button8)

        // button 3
        let button9 = UIButton()
        // self.boardView.bounds.height - 60
        button9.frame = CGRect(x: 210, y: 210, width: 95, height: 95)
        button9.backgroundColor = UIColor.white
        button9.setTitleColor(UIColor(named: "mainBlue"), for: .normal)
        button9.setTitle("X", for: .normal)
        button9.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 60)
        button9.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.boardView.addSubview(button9)

        
        print("viewloaded")
        
        print(pick)
        print("!!!!!")
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
       print("Button tapped")
    }



}

