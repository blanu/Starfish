//
//  ?.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation
import Starfish

prefix operator .?.
infix operator .?.

// Roll
public prefix func .?.(x: Int) -> Int
{
    return roll(x)
}

public prefix func .?.(x: Float) -> Float?
{
    return roll(x)
}

// Deal
public func .?.(x: Int, y: Int) -> [Int]?
{
    return deal(x, y)
}
