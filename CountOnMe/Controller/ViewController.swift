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
        
        print(calculation.numberStringArray)
        if calculation.expressionHaveResult {
            textView.text.removeAll()
            calculation.numberStringArray.removeAll()
        }
        
        calculation.numberStringArray += numberText
        textView.text.append(numberText)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calculation.canAddOperator {
            textView.text.append(" + ")
            calculation.numberStringArray += (" + ")
        } else {
            displayAlert("Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calculation.canAddOperator {
            textView.text.append(" - ")
            calculation.numberStringArray += (" - ")
        } else {
            displayAlert("Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calculation.expressionIsCorrect else {
            return displayAlert("Un operateur est déjà mis !")
        }
        
        guard calculation.expressionHaveEnoughElement else {
            return displayAlert("Démarrez un nouveau calcul !")
        }
        
        //        textView.text.removeAll()
        
        textView.text = calculation.solveEquation()
    }
    
    //MARK: - Setup
    
    private func displayAlert(_ message: String) {
        
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

