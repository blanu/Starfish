//
//  Last.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/6/22.
//

import Foundation

public func last<T>(_ x: [T]) -> T?
{
    guard x.count > 0 else {return nil}
    return x.last
}

public func last<A,B>(_ x: (A, B)) -> B?
{
    return x.1
}

public func last<A,B,C>(_ x: (A, B, C)) -> C?
{
    return x.2
}

public func last<A,B,C,D>(_ x: (A, B, C, D)) -> D?
{
    return x.3
}

public func last(_ x: Data) -> UInt8?
{
    guard x.count > 0 else {return nil}
    return x[x.count-1]
}

public func last(_ x: String) -> Character
{
    return x[x.index(x.endIndex, offsetBy: 0)]
}
