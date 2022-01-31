//
//  Shape.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/6/22.
//

import Foundation

public func shape(_ a: Bool) -> [Int]
{
    return [0]
}

public func shape<T>(_ a: T) -> [Int] where T: BinaryInteger
{
    return [0]
}

public func shape<T>(_ a: [T]) -> [Int] where T: BinaryInteger
{
    return [a.count]
}

public func shape<T>(_ a: [[T]]) -> [Int] where T: BinaryInteger
{
    if a.isEmpty
    {
        return [0, 0]
    }
    else
    {
        return [a[0].count, a.count]
    }
}
