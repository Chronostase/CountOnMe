//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let calculation = Calculation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    //MARK: - IBAction
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        checkExpressionHaveResult()
        
        calculation.numberString += numberText
        textView.text.append(numberText)
    }
    
    @IBAction func tappedOperand(_ sender: UIButton) {
        
        guard let operand = sender.currentTitle else {
            return displayAlert("Can't receive information from sender.currenTitle")
        }
        if calculation.canAddOperator {
            addOperand(operand)
        }
        
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculation.expressionIsCorrect else {
            return displayAlert("Un operateur est déjà mis !")
        }
        
        guard calculation.expressionHaveEnoughElement else {
            return displayAlert("Démarrez un nouveau calcul !")
        }
        
        textView.text = calculation.solveEquation()
    }
    
    private func addScripture(data: String ) {
        textView.text.append(" \(data) ")
        calculation.addToArray(data)
    }
    
    private func checkExpressionHaveResult() {
        if calculation.expressionHaveResult {
            textView.text.removeAll()
            calculation.numberString.removeAll()
        }
    }
    
    private func addOperand(_ operand: String) {
        switch operand {
        case "+": addScripture(data: operand)
        case "-":
            checkExpressionHaveResult()
            if calculation.numberString.count < 1 {
                textView.text.append("-")
                calculation.numberString += ("-")
            } else {
                addScripture(data: operand)
            }
        case "x": addScripture(data: operand)
        case "/": addScripture(data: operand)
            
        default : displayAlert("Un operateur est déjà mis !")
            
        }
    }
    
    //MARK: - Setup
    
    private func displayAlert(_ message: String) {
        
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
}
