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
    @IBOutlet var constantLabels: [UILabel]!
    @IBOutlet var blackWhiteLabels: [UILabel]!
    
    var weight: Float = 0 {
        didSet {
            weightLabel.text = String(format: "%.1f", weight)
            setBMI()
        }
    }
    var height: Float = 0 {
        didSet {
            heightLabel.text = String(format: "%.1f", height)
            setBMI()
        }
    }
    var bmi: Float {
        return weight / (height * height)
    }
    var darkLayout = false {
        didSet {
            if darkLayout {
                makeLayoutDark()
            }else{
                makeLayoutLight()
            }
        }
    }
    
    //MARK: Actions
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weight = sender.value
    }
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        height = sender.value
    }
    @IBAction func changeLayoutColor(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: darkLayout = false
        case 1: darkLayout = true
        default: break
        }
    }
    
    //MARK: Lifecycle Hooks
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        weight = 40
        height = 1.70
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
    
    //MARK: Functions to render UI
    func setBMI(){
        if height == 0 {
            bmiNumberLabel.text = String(format: "%.1f", 0)
            bmiNumberLabel.textColor = getColor_ofBMI(0)
            bmiCategoryLabel.text = "Unspecified"
            bmiCategoryLabel.textColor = getColor_ofBMI(0)
        }else{
            bmiNumberLabel.text = String(format: "%.1f", bmi)
            bmiNumberLabel.textColor = getColor_ofBMI(bmi)
            bmiCategoryLabel.text = getCategory_ofBMI(bmi)
            bmiCategoryLabel.textColor = getColor_ofBMI(bmi)
        }
    }
    func makeLayoutLight(){
        view.backgroundColor = UIColor.white
        blackWhiteLabels.forEach({label in
            label.textColor = UIColor.black
        })
        constantLabels.forEach({label in
            label.textColor = UIColor(
                red: 46/255,
                green: 125/255,
                blue: 246/255,
                alpha: 1
            )
        })
    }
    func makeLayoutDark(){
        view.backgroundColor = UIColor.black
        blackWhiteLabels.forEach({label in
            label.textColor = UIColor.white
        })
        constantLabels.forEach({label in
            label.textColor = UIColor.cyan
        })
    }
}
