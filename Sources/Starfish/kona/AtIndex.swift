//
//  AtIndex.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public func atIndex<T>(_ x: [T], _ y: Int) -> T
{
    return x[y]
}

public func atIndex<T>(_ x: [T], _ y: [Int]) -> [T]
{
    return y.map({atIndex(x, $0)})
}
