//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var fruitPicker: UIPickerView!
    
    
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        fruitPicker.dataSource = self
        fruitPicker.delegate = self
        
    }
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        for i in 0..<3 {
            let row = arc4random_uniform(UInt32(fruitsArray.count))
            fruitPicker.selectRow(Int(row), inComponent: i, animated: true)
        }
        
        let fruitOne = fruitsArray[fruitPicker.selectedRow(inComponent: 0)]
        let fruitTow = fruitsArray[fruitPicker.selectedRow(inComponent: 1)]
        let fruitThree = fruitsArray[fruitPicker.selectedRow(inComponent: 2)]
        
        if fruitOne == fruitTow && fruitTow == fruitThree {
            resultLabel.text = "WINNER!"
        } else {
            resultLabel.text = "TRY AGAIN"
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



