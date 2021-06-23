//
//  ViewController.swift
//  HW-3
//
//  Created by Dima Savitskiy on 15.06.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var maxValueLabel: UILabel!
    @IBOutlet weak var minValueLabel: UILabel!
    @IBOutlet weak var randomValueLabel: UILabel!
    @IBOutlet weak var getRandomNumberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomNumberButton.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {return}
        settingsVC.maxValue = self.maxValueLabel.text ?? "100"
        settingsVC.minValue = self.minValueLabel.text ?? "0"
    }

    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        guard let settingsVC = unwindSegue.source as? SettingsViewController else {return}
        minValueLabel.text = settingsVC.minimumTextField.text
        maxValueLabel.text = settingsVC.maximumTextField.text
    }
    
    
    @IBAction func getRandomNumberButton(_ sender: UIButton) {
        let minNumber = Int(String(minValueLabel.text ?? "")) ?? 0
        let maxNumber = Int(String(maxValueLabel.text ?? "")) ?? 100
        
        randomValueLabel.text = String(Int.random(in: minNumber...maxNumber))
        }
    }




