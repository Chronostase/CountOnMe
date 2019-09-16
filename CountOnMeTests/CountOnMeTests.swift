//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Thomas on 12/09/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {
    
    var calculation: Calculation!
    
    override func setUp() {
        super.setUp()
        calculation = Calculation()
    }
  
    func testGivenElementsCountIsZero_WhenAddingNumber_ThenCountShouldBeOne() {
        calculation.addToArray("1")
        
        let elements = calculation.elements
        
        XCTAssertEqual(elements.count, 1)
    }
    
    func testGivenElementsCountIsOne_WhenAddingPlus_ThenCountShouldBeTwo() {
        calculation.addToArray("1")
        
        if calculation.canAddOperator {
            calculation.addToArray(" + ")
        }
        
        let elements = calculation.elements
        
    XCTAssertEqual(elements.count, 2)
    }
    
    func testGivenElementsCountIsOne_WhenAddingMinus_ThenCountShouldBeTwo() {
        calculation.addToArray("1")
        
        if calculation.canAddOperator {
            calculation.addToArray(" - ")
        }
        
        let elements = calculation.elements
        
        XCTAssertEqual(elements.count, 2)
    }
    
    func testGivenElementsCountIsOne_WhenAddingDivide_ThenCountShouldBeTwo() {
        calculation.addToArray("1")
        
        if calculation.canAddOperator {
            calculation.addToArray(" / ")
        }
        
        let elements = calculation.elements
        
        XCTAssertEqual(elements.count, 2)
    }
    
    func testGivenElementsCountIsOne_WhenAddingMultiply_ThenCountShouldBeTwo() {
        calculation.addToArray("1")
        
        if calculation.canAddOperator {
            calculation.addToArray(" * ")
        }
        
        let elements = calculation.elements
        
        XCTAssertEqual(elements.count, 2)
    }
    
    func testGivenElementsCountIsTwo_WhenAddingNumber_ThenCountShouldBeThree() {
        calculation.addToArray("1")
        if calculation.canAddOperator {
            calculation.addToArray(" + ")
        }
        
        calculation.addToArray("1")
        
        let elements = calculation.elements
        
        XCTAssertEqual(elements.count, 3)
    }
    
    func testGivenElementsCountIsThree_WhenPressEqual_ThenResultShouldBeTwo() {
        calculation.addToArray("1")
        if calculation.canAddOperator {
            calculation.addToArray(" + ")
        }
        calculation.addToArray("1")
        
        if calculation.expressionHaveEnoughElement {
            if calculation.expressionIsCorrect {
                let result = calculation.solveEquation()
                XCTAssertEqual(result, " = 2")
            }
            if calculation.expressionHaveResult {
                calculation.numberString.removeAll()
            }
        }
    }
    
    func testGivenElementsCountIsThreeAndOperandisMinus_WhenPressEqual_ThenResultShouldBeZero() {
        calculation.addToArray("1")
        if calculation.canAddOperator {
            calculation.addToArray(" - ")
        }
        calculation.addToArray("1")
        
        if calculation.expressionHaveEnoughElement {
            if calculation.expressionIsCorrect {
                let result = calculation.solveEquation()
                XCTAssertEqual(result, " = 0")
            }
            if calculation.expressionHaveResult {
                calculation.numberString.removeAll()
            }
        }
    }
    
    func testGivenElementsCountIsThreeAndOperandisMultiply_WhenPressEqual_ThenResultShouldBeOne() {
        calculation.addToArray("1")
        if calculation.canAddOperator {
            calculation.addToArray(" x ")
        }
        calculation.addToArray("1")
        
        if calculation.expressionHaveEnoughElement {
            if calculation.expressionIsCorrect {
                let result = calculation.solveEquation()
                XCTAssertEqual(result, " = 1")
            }
            if calculation.expressionHaveResult {
                calculation.numberString.removeAll()
            }
        }
    }
    
    func testGivenElementsCountIsThreeAndOperandisDivide_WhenPressEqual_ThenResultShouldBeOne() {
        calculation.addToArray("1")
        if calculation.canAddOperator {
            calculation.addToArray(" / ")
        }
        calculation.addToArray("1")
        
        if calculation.expressionHaveEnoughElement {
            if calculation.expressionIsCorrect {
                let result = calculation.solveEquation()
                XCTAssertEqual(result, " = 1")
            }
            if calculation.expressionHaveResult {
                calculation.numberString.removeAll()
            }
        }
    }
    
    func testGivenElementsCountIsThreeAndRightElementsIs0_WhenDivideAndPressEqual_ThenResultShouldBeError() {
        calculation.addToArray("1")
        if calculation.canAddOperator {
            calculation.addToArray(" / ")
        }
        calculation.addToArray("0")
        if calculation.expressionHaveEnoughElement {
            if calculation.expressionIsCorrect {
                let _ = calculation.solveEquation()
                XCTAssertEqual(calculation.numberString, "= Can't divide by 0")
            }
            if calculation.expressionHaveResult {
                calculation.numberString.removeAll()
            }
        }
    }
}
