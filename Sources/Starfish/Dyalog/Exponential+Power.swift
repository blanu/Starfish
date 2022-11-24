//
//  Exponential+Power.swift
//
//
//  Created by Dr. Brandon Wiley on 11/13/21.
//

import Foundation
import Numerics

import BigArray
import BigNumber

// Exponential
public func exponential<T>(_ a: T) -> Double where T: BinaryInteger
{
    let e: Double = Double(2.718281828)
    let af: Double = Double(a)
    return pow(e, af)
}

public func exponential<T>(_ `as`: [T]) -> [Double] where T: BinaryInteger
{
    `as`.map
    {
        a in

        return exponential(a)
    }
}

public func exponential<T>(_ a: T) -> Float where T: BinaryInteger
{
    let e: Float = Float(2.718281828)
    let af: Float = Float(a)
    return pow(e, af)
}

public func exponential<T>(_ `as`: [T]) -> [Float] where T: BinaryInteger
{
    `as`.map
    {
        a in

        return exponential(a)
    }
}

// Power
public func power<T>(_ a: T, _ b: T) -> T where T: BinaryInteger
{
    let af: Double = Double(a)
    let bf: Double = Double(b)

    let resultf = pow(af, bf)
    return T(resultf)
}

public func power<T>(_ `as`: [T], _ b: T) -> [T] where T: BinaryInteger
{
    return `as`.map
    {
        a in

        return power(a, b)
    }
}

public func power<T>(_ a: T, _ bs: [T]) -> [T] where T: BinaryInteger
{
    return bs.map
    {
        b in

        return power(a, b)
    }
}

public func power<T>(_ `as`: [T], _ bs: [T]) -> [T] where T: BinaryInteger
{
    let zipped = zip(`as`, bs)
    return zipped.map
    {
        (a, b) in

        return power(a, b)
    }
}


