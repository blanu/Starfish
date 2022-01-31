//
//  ○.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation
import Starfish

prefix operator ○
infix operator ○

public prefix func ○<F>(_ x: F) -> F where F: BinaryFloatingPoint
{
    return piTimes(x)
}

public func ○<F>(_ x: Int, _ y: F) -> F? where F: BinaryFloatingPoint
{
    return circularFunctions(x, y)
}
