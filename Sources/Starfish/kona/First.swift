//
//  First.swift
//
//
//  Created by Dr. Brandon Wiley on 1/6/22.
//

import Foundation

public func first<T>(_ x: [T]) -> T?
{
    guard x.count > 0 else {return nil}
    return x[0]
}

public func first<A,B>(_ x: (A, B)) -> A?
{
    return x.0
}

public func first<A,B,C>(_ x: (A, B, C)) -> A?
{
    return x.0
}

public func first<A,B,C,D>(_ x: (A, B, C, D)) -> A?
{
    return x.0
}

public func first(_ x: Data) -> UInt8?
{
    guard x.count > 0 else {return nil}
    return x[0]
}

public func first(_ x: String) -> Character
{
    return x[x.index(x.startIndex, offsetBy: 0)]
}
