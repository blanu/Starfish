//
//  Match.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public func match<T>(_ x: T, _ y: T) -> Bool where T: BinaryInteger
{
    return x == y
}

public func match<T>(_ x: T, _ y: [T]) -> [Bool] where T: BinaryInteger
{
    return y.map{match(x, $0)}
}

public func match<T>(_ x: [T], _ y: T) -> [Bool] where T: BinaryInteger
{
    return x.map{match($0,y)}
}

public func match<T>(_ x: [T], _ y: [T]) -> [Bool] where T: BinaryInteger
{
    return zip(x, y).map{match($0, $1)}
}

public func match<F>(_ x: F, _ y: F) -> Bool where F: BinaryFloatingPoint
{
    return x == y
}

public func match<F>(_ x: F, _ y: [F]) -> [Bool] where F: BinaryFloatingPoint
{
    return y.map{match(x, $0)}
}

public func match<F>(_ x: [F], _ y: F) -> [Bool] where F: BinaryFloatingPoint
{
    return x.map{match($0, y)}
}

public func match<F>(_ x: [F], _ y: [F]) -> [Bool] where F: BinaryFloatingPoint
{
    return zip(x, y).map{match($0, $1)}
}

public func match<F,T>(_ x: F, _ y: T) -> Bool where F: BinaryFloatingPoint, T: BinaryInteger
{
    return false
}

public func match<F,T>(_ x: F, _ y: [T]) -> [Bool] where F: BinaryFloatingPoint, T: BinaryInteger
{
    y.map({_ in return false})
}

public func match<F,T>(_ x: [F], _ y: T) -> [Bool] where F: BinaryFloatingPoint, T: BinaryInteger
{
    x.map({_ in return false})
}

public func match<F,T>(_ x: [F], _ y: [T]) -> [Bool] where F: BinaryFloatingPoint, T: BinaryInteger
{
    zip(x, y).map({_ in return false})
}

public func match<F,T>(_ x: T, _ y: F) -> Bool where F: BinaryFloatingPoint, T: BinaryInteger
{
    return false
}

public func match<F,T>(_ x: T, _ y: [F]) -> [Bool] where F: BinaryFloatingPoint, T: BinaryInteger
{
    y.map({_ in return false})
}

public func match<F,T>(_ x: [T], _ y: F) -> [Bool] where F: BinaryFloatingPoint, T: BinaryInteger
{
    return x.map({_ in return false})
}

public func match<F,T>(_ x: [T], _ y: [F]) -> [Bool] where F: BinaryFloatingPoint, T: BinaryInteger
{
    return zip(x, y).map({_ in return false})
}
