//
//  GreaterThan.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public func greaterThan<T>(_ x: T, y: T) -> Bool where T: Comparable
{
    return x > y
}

public func greaterThan<T>(_ x: [T], _ y: T) -> [Bool] where T: Comparable
{
    return x.map
    {
        (a: T) -> Bool in

        return a > y
    }
}

public func greaterThan<T>(_ x: T, _ y: [T]) -> [Bool] where T: Comparable
{
    return y.map
    {
        (a: T) -> Bool in

        return x > a
    }
}

public func greaterThan<T>(_ x: [T], _ y: [T]) -> [Bool] where T: Comparable
{
    return zip(x, y).map
    {
        (a: T, b: T) -> Bool in

        return a > b
    }
}

