//
//  File.swift
//  
//
//  Created by Dr. Brandon Wiley on 2/2/22.
//

import Foundation

// Or
public func or(_ x: Bool, _ y: Bool) -> Bool
{
    return x || y
}

public func or(_ x: [Bool], _ y: Bool) -> [Bool]
{
    return x.map
    {
        (left: Bool) -> Bool in

        return left || y
    }
}

public func or(_ x: Bool, _ y: [Bool]) -> [Bool]
{
    return y.map
    {
        (right: Bool) -> Bool in

        return x || right
    }
}

public func or(_ x: [Bool], _ y: [Bool]) throws -> [Bool]
{
    guard x.count == y.count else {throw StarfishError.lengthMismatch(x.count, y.count)}

    return zip(x, y).map
    {
        (left: Bool, right: Bool) -> Bool in

        return left || right
    }
}

public enum StarfishError: Error
{
    case lengthMismatch(Int, Int)
}

// GCD
public func gcd<T>(_ x: T, _ y: T) -> T where T: BinaryInteger
{
    var a: T = 0
    var b: T = max(x, y)
    var r: T = min(x, y)

    while r != 0
    {
        a = b
        b = r
        r = a % b
    }

    return b
}

public func gcd<T>(_ x: [T], _ y: T) -> [T] where T: BinaryInteger
{
    return x.map
    {
        (left: T) -> T in

        return gcd(left, y)
    }
}

public func gcd<T>(_ x: T, _ y: [T]) -> [T] where T: BinaryInteger
{
    return y.map
    {
        (right: T) -> T in

        return gcd(x, right)
    }
}

public func gcd<T>(_ x: [T], _ y: [T]) throws -> [T] where T: BinaryInteger
{
    guard x.count == y.count else {throw StarfishError.lengthMismatch(x.count, y.count)}

    return zip(x, y).map
    {
        (left: T, right: T) -> T in

        return gcd(left, right)
    }
}
