//
//  StartingViewController.swift
//  TicTacInfinity
//
//  Created by Elliott Williams on 3/30/20.
//  Copyright © 2020 Moonshot Applications. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //  Starting controller where you choose your size
    var pickerData: [String] = [String]()
    var picked = "3x3"
    
    
    @IBOutlet weak var sizePicker: UIPickerView!
    
    @IBOutlet weak var startButton: UIButton!
    @IBAction func startAction(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = ["3x3", "4x4", "5x5"]
        self.sizePicker.delegate = self
        self.sizePicker.dataSource = self

        
        
        startButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        startButton.clipsToBounds = true

        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("was: \(picked)")
        picked = pickerData[row]
        print("now did select: \(picked)")

    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewController = segue.destination as? ViewController {
            viewController.pick = picked
        }

        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
