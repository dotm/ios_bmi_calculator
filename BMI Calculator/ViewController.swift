//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Yoshua Elmaryono on 09/07/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var bmiTitle: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var bmiCategoryLabel: UILabel!
    @IBOutlet weak var bmiConstantLabel: UILabel!
    
    //MARK: Actions
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.1f", sender.value)
        setBMI()
    }
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value)
        setBMI()
    }
    @IBAction func changeLayoutColor(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: makeLayoutLight()
        case 1: makeLayoutDark()
        default: break
        }
    }
    
    //MARK: Helper functions
    func getCategory_ofBMI(_ bmi: Float) -> String{
        switch bmi {
        case 0 ..< 18.5: return "Underweight"
        case 18.5 ..< 25: return "Normal"
        case 25 ..< 30: return "Overweight"
        default: return "Obese"
        }
    }
    func getColor_ofBMI(_ bmi: Float) -> UIColor{
        switch bmi {
        case 0 ..< 18.5: return UIColor.gray
        case 18.5 ..< 25: return UIColor.green
        case 25 ..< 30: return UIColor.orange
        default: return UIColor.red
        }
    }
    func setBMI(){
        let weight = weightSlider.value
        let height = heightSlider.value
        
        if height == 0.0 {
            bmiNumberLabel.text = String(format: "%.1f", 0)
            bmiNumberLabel.textColor = getColor_ofBMI(0)
            bmiCategoryLabel.text = "Unspecified"
            bmiCategoryLabel.textColor = getColor_ofBMI(0)
            return
        }
        let bmi = weight / (height * height)
        
        bmiNumberLabel.text = String(format: "%.1f", bmi)
        bmiNumberLabel.textColor = getColor_ofBMI(bmi)
        bmiCategoryLabel.text = getCategory_ofBMI(bmi)
        bmiCategoryLabel.textColor = getColor_ofBMI(bmi)
    }
    func makeLayoutLight(){
        view.backgroundColor = UIColor.white
        bmiTitle.textColor = UIColor.black
        weightLabel.textColor = UIColor.black
        heightLabel.textColor = UIColor.black
        bmiConstantLabel.textColor = UIColor.black
    }
    func makeLayoutDark(){
        view.backgroundColor = UIColor.black
        bmiTitle.textColor = UIColor.white
        weightLabel.textColor = UIColor.white
        heightLabel.textColor = UIColor.white
        bmiConstantLabel.textColor = UIColor.white
    }

    //MARK: Lifecycle Hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        weightLabel.text = String(format: "%.1f", weightSlider.value)
        heightLabel.text = String(format: "%.2f", heightSlider.value)
        setBMI()
    }
}
