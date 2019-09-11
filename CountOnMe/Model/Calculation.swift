//
//  Calculation.swift
//  CountOnMe
//
//  Created by Thomas on 15/08/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculation {
    
    var numberStringArray = String()
    
    var elements: [String] {
        return numberStringArray.split(separator: " ").map { "\($0)" }
    }
    
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "x"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "x"
    }
    
    var expressionHaveResult: Bool {
        return numberStringArray.firstIndex(of: "=") != nil
    }
    
    
    func solveEquation() -> String {
        
        var operationToReduce = elements
        
        while operationToReduce.count > 1 {
            
            guard let left = Int(operationToReduce[0]) else {
                break
            }
            
            let operand = operationToReduce[1]
            
            guard let right = Int(operationToReduce[2]) else {
                break
            }
            
            var result = 0
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "/":
                if right == 0 {
                    let error = "= Can't divide by 0"
                    numberStringArray = error
                    return error
                } else {
                    result = left / right
                }
            default: fatalError("Unknown operator !")
            }
            
            operationToReduce = Array(operationToReduce.dropFirst(3))
            //            Laisse apparaitre à partir du 4ème élément
            operationToReduce.insert("\(result)", at: 0)
        }
        guard let solution = operationToReduce.first else {
            return ""
        }
        numberStringArray = " = \(solution)"
        return " = \(solution)"
    }
}
