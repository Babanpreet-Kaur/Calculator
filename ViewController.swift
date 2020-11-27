//
//  ViewController.swift
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen: Double = 0
    var old_number:Double = 0
    var operation = 0
    var performMath:Bool = false
    @IBOutlet weak var lblnum: UILabel!
    
    @IBAction func add_sign(_ sender: UIButton) {
       let num = "0"
        if sender.tag == 11 && performMath == true{
            if lblnum.text!.contains("-"){
            var special_ch = lblnum.text!
        special_ch.remove(at: special_ch.startIndex)
        lblnum.text = special_ch
              numberOnScreen = Double(lblnum.text!)!
                
        }
        else {
            if sender.tag == 11{
                lblnum.text = "-" + num
                numberOnScreen = Double(lblnum.text!)!
                
            }
            else{
                lblnum.text = "-" + lblnum.text!
                numberOnScreen = Double(lblnum.text!)!
                
            }    }
            performMath = false
        }else{
               if lblnum.text!.contains("-"){
                     var special_ch = lblnum.text!
                 special_ch.remove(at: special_ch.startIndex)
                 lblnum.text = special_ch
                       numberOnScreen = Double(lblnum.text!)!
                         
                 }
                 else {
                     if sender.tag == 11{
                         lblnum.text = "-" + num
                         numberOnScreen = Double(lblnum.text!)!
                         
                     }
                     else{
                         lblnum.text = "-" + lblnum.text!
                         numberOnScreen = Double(lblnum.text!)!
                         
                     }    }        }
        
        
        
    }
    
    @IBAction func dot_num(_ sender: UIButton) {
        if sender.tag == 18 && lblnum.text!.contains("."){
            sender.isEnabled = false
            
        }else if lblnum.text!.count <= 8 {
            lblnum.text = lblnum.text! + "."
            numberOnScreen = Double(lblnum.text!)!
        }
        
    }
    @IBAction func numbers(_ sender: UIButton) {
        if lblnum.text!.count <= 9 {
            if performMath == true{
                lblnum.text = String(sender.tag)
                numberOnScreen = Double(lblnum.text!)!
                performMath = false
            }
            else{
                if lblnum.text == "0"{
lblnum.text =  String(sender.tag)}
            else{
    lblnum.text = lblnum.text! + String(sender.tag)}
        numberOnScreen = Double(lblnum.text!)!
            }}
    }
    
    
    @IBOutlet weak var old_val: UITextField!
    @IBAction func op_buttons(_ sender: UIButton) {
        if sender.tag != 10 && sender.tag != 17 && lblnum.text != "" && sender.tag != 11{
            old_number = Double(lblnum.text!)!
            old_val.text = String(old_number)
            // for modules %
            if sender.tag == 12{
                lblnum.text = "%"
            }
             if sender.tag == 13{
lblnum.text = "/"
            }
            if sender.tag == 14{
lblnum.text = "+"
            }
             if sender.tag == 15{
lblnum.text = "x"
            }
            
            if sender.tag == 16{
lblnum.text = "-"
            }
            operation = sender.tag
            performMath = true
                                             
        }
        
        if sender.tag == 10{
            lblnum.text = "0"
            old_number = 0
            numberOnScreen = 0
            operation = 0
            old_val.text = ""
        }else if sender.tag == 17 {
            
            if operation == 12{
                var x = old_number
                let result = old_number/numberOnScreen
            let q = (x/numberOnScreen).rounded(.towardZero)
                let val = (result - q) * numberOnScreen
                x.formTruncatingRemainder(dividingBy: numberOnScreen)
                lblnum.text = String(val.rounded())
              
                
            }
            if operation == 13 {
            lblnum.text = String(old_number / numberOnScreen)
            }
            if operation == 14{
        lblnum.text = String(old_number + numberOnScreen)
                }
            if operation == 15{
lblnum.text = String(old_number * numberOnScreen)
                
            }
            if operation == 16{
lblnum.text = String(old_number - numberOnScreen)
            }
            if lblnum.text != "" {
                 old_val.text = lblnum.text!
            }
            
        }
      
        
    }
    
    
    override func viewDidLoad() {
        //anything on load
        lblnum.text = "0"
    }
}

