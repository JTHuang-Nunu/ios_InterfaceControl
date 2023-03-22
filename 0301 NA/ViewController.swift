//
//  ViewController.swift
//  0301 NA
//
//  Created by Mac18 on 2023/3/1.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var HPC: UIImageView!
    @IBOutlet weak var alpha: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numTextField: UITextField!
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var `switch`: UISwitch!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var pickView: UIPickerView!
    let fontName = ["Symbol", "Times New Roman", "Zapfino", "Chalkduster"]
    let fontSize = ["20", "21", "22", "23", "24", "25", "26"]
    var currentSize:CGFloat = 20.0
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return fontName.count
        }
        return fontSize.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component:Int) -> String? {
        if(component == 0){
            return fontName[row]
        }
        return fontSize[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,inComponent component:Int){
        if(component == 0){
            name.font = UIFont(name: fontName[row], size: currentSize)
            number.font = UIFont(name: fontName[row], size: currentSize)
        }else{
            currentSize = CGFloat(Double(fontSize[row])!)
            name.font = name.font.withSize(CGFloat(Double(fontSize[row])!))
            number.font = number.font.withSize(CGFloat(Double(fontSize[row])!))
        }
        
    }
    

    
    @IBAction func nametextField(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        numTextField.resignFirstResponder()
    }
    
    
    
    @IBAction func alphaSlider(_ sender: UISlider) {
        alpha.text = String(sender.value)
        HPC.alpha = CGFloat(sender.value)
        HPC.image = UIImage(named: "HPC.png")
        alpha.text = String(format: "%.1f", sliderValue.value)
    }
    
    @IBAction func secureText(_ sender: UISwitch) {
        if sender.isOn{
            numTextField.isSecureTextEntry = true
        } else {
            numTextField.isSecureTextEntry = false
        }
    }
    
    @IBAction func segmentCtrl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            sliderValue.isHidden = false
            `switch`.isHidden = false
            alpha.isHidden = false
        } else {
            sliderValue.isHidden = true
            `switch`.isHidden = true
            alpha.isHidden = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        HPC.contentMode = .scaleAspectFit
        HPC.image = UIImage(named: "HPC.png")
        alpha.text = String(format: "%.1f", sliderValue.value)
        // Do any additional setup after loading the view.
    }


}

