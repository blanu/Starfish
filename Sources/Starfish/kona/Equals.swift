//
//  Equals.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public func equals<S,T>(_ x: S, _ y: T) -> Bool where S: BinaryInteger, T: BinaryInteger
{
    return Float(x) == Float(y)
}

public func equals<S,T>(_ x: S, _ y: [T]) -> [Bool] where S: BinaryInteger, T: BinaryInteger
{
    return y.map
    {
        a in

        equals(x, a)
    }
}

public func equals<S,T>(_ x: [S], _ y: T) -> [Bool] where S: BinaryInteger, T: BinaryInteger
{
    return x.map
    {
        a in

        equals(a, y)
    }
}

public func equals<S,T>(_ x: [S], _ y: [T]) -> [Bool] where S: BinaryInteger, T: BinaryInteger
{
    return zip(x, y).map
    {
        (a, b) in

        equals(a, b)
    }
}

public func equals<F,G>(_ x: F, _ y: G) -> Bool where F: BinaryFloatingPoint, G: BinaryFloatingPoint
{
    return Float(x) == Float(y)
}

public func equals<F,G>(_ x: F, _ y: [G]) -> [Bool] where F: BinaryFloatingPoint, G: BinaryFloatingPoint
{
    return y.map
    {
        a in

        equals(x, a)
    }
}

public func equals<F,G>(_ x: [F], _ y: G) -> [Bool] where F: BinaryFloatingPoint, G: BinaryFloatingPoint
{
    return x.map
    {
        a in

        equals(a, y)
    }
}

public func equals<F,G>(_ x: [F], _ y: [G]) -> [Bool] where F: BinaryFloatingPoint, G: BinaryFloatingPoint
{
    return zip(x, y).map
    {
        (a, b) in

        equals(a, b)
    }
}

public func equals<F,T>(_ x: F, _ y: T) -> Bool where F: BinaryFloatingPoint, T: BinaryInteger
{
    return Float(x) == Float(y)
}

public func equals<F,T>(_ x: F, _ y: [T]) -> [Bool] where F: BinaryFloatingPoint, T: BinaryInteger
{
    return y.map
    {
        a in

        equals(x, a)
    }
}

public func equals<F,T>(_ x: [F], _ y: T) -> [Bool] where F: BinaryFloatingPoint, T: BinaryInteger
{
    return x.map
    {
        a in

        equals(a, y)
    }
}

public func equals<F,T>(_ x: [F], _ y: [T]) -> [Bool] where F: BinaryFloatingPoint, T: BinaryInteger{
    return zip(x, y).map
    {
        (a, b) in

        equals(a, b)
    }
}

public func equals<F,T>(_ x: T, _ y: F) -> Bool where F: BinaryFloatingPoint, T: BinaryInteger
{
    return Float(x) == Float(y)
}

public func equals<F,T>(_ x: T, _ y: [F]) -> [Bool] where F: BinaryFloatingPoint, T: BinaryInteger
{
    return y.map
    {
        a in

        equals(x, a)
    }
}

public func equals<F,T>(_ x: [T], _ y: F) -> [Bool] where F: BinaryFloatingPoint, T: BinaryInteger
{
    return x.map
    {
        a in

        equals(a, y)
    }
}

public func equals<F,T>(_ x: [T], _ y: [F]) -> [Bool] where F: BinaryFloatingPoint, T: BinaryInteger
{
    return zip(x, y).map
    {
        (a, b) in

        equals(a, b)
    }
}
