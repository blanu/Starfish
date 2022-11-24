//
//  And+LCM.swift
//  
//
//  Created by Dr. Brandon Wiley on 2/2/22.
//

import Foundation

import BigArray
import BigNumber

// And
public func and(_ x: Bool, _ y: Bool) -> Bool
{
    return x && y
}

public func and(_ x: [Bool], _ y: Bool) -> [Bool]
{
    return x.map
    {
        (left: Bool) -> Bool in

        return left && y
    }
}

public func and(_ x: Bool, _ y: [Bool]) -> [Bool]
{
    return y.map
    {
        (right: Bool) -> Bool in

        return x && right
    }
}

public func and(_ x: [Bool], _ y: [Bool]) throws -> [Bool]
{
    guard x.count == y.count else {throw StarfishError.lengthMismatch(x.count, y.count)}

    return zip(x, y).map
    {
        (left: Bool, right: Bool) -> Bool in

        return left && right
    }
}

// LCM
public func lcm<T>(_ x: T, _ y: T) -> T where T: BinaryInteger
{
    return (x * y) / gcd(x, y)
}

public func lcm<T>(_ x: [T], _ y: T) -> [T] where T: BinaryInteger
{
    return x.map
    {
        (left: T) -> T in

        return lcm(left, y)
    }
}

public func lcm<T>(_ x: T, _ y: [T]) -> [T] where T: BinaryInteger
{
    return y.map
    {
        (right: T) -> T in

        return lcm(x, right)
    }
}

public func lcm<T>(_ x: [T], _ y: [T]) throws -> [T] where T: BinaryInteger
{
    guard x.count == y.count else {throw StarfishError.lengthMismatch(x.count, y.count)}

    return zip(x, y).map
    {
        (left: T, right: T) -> T in

        return lcm(left, right)
    }
}
