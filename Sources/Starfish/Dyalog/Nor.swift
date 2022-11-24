//
//  Nor.swift
//  
//
//  Created by Dr. Brandon Wiley on 2/2/22.
//

import Foundation

// Nor
public func nor(_ x: Bool, _ y: Bool) -> Bool
{
    return !(x || y)
}

public func nor(_ x: [Bool], _ y: Bool) -> [Bool]
{
    return x.map
    {
        (left: Bool) -> Bool in

        return !(left || y)
    }
}

public func nor(_ x: Bool, _ y: [Bool]) -> [Bool]
{
    return y.map
    {
        (right: Bool) -> Bool in

        return !(x || right)
    }
}

public func nor(_ x: [Bool], _ y: [Bool]) throws -> [Bool]
{
    guard x.count == y.count else {throw StarfishError.lengthMismatch(x.count, y.count)}

    return zip(x, y).map
    {
        (left: Bool, right: Bool) -> Bool in

        return !(left || right)
    }
}
