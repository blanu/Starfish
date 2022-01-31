//
//  ⌈.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation
import Starfish

infix operator ⌈
prefix operator ⌈

public prefix func ⌈<F,T>(x: F) -> T where F: BinaryFloatingPoint, T: BinaryInteger
{
    return ceiling(x)
}

public func ⌈<T>(x: T, y: T) -> T where T: BinaryInteger
{
    return maximum(x, y)
}

public prefix func ⌈<F,T>(x: [F]) -> [T] where F: BinaryFloatingPoint, T: BinaryInteger
{
    let result = x.map
    {
        (f: F) -> T in

        ceiling(f)
    }

    return result
}

public func ⌈<T>(x: [T], y: [T]) -> [T] where T: BinaryInteger
{
    return zip(x,y).map{maximum($0,$1)}
}
