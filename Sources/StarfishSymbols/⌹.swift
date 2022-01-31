//
//  ⌹.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation
import Starfish

prefix operator ⌹
infix operator ⌹

public prefix func ⌹(_ matrix : [Double]) -> [Double]
{
    matrixInvert(matrix)
}

public func ⌹(_ a: [Double], _ b: [Double]) -> [Double]
{
    matrixDivide(a, b)
}
