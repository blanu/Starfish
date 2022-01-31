//
//  Count.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public func count<T>(_ x: T) -> Int
{
    return 1
}

public func count<T>(_ x: [T]) -> Int
{
    return x.count
}

public func count<T>(_ x: [[T]]) -> Int
{
    return x.count
}

public func count<K,V>(_ x: [K:V]) -> Int
{
    return x.count
}

public func count(_ x: String) -> Int
{
    return x.count
}

public func count(_ x: Data) -> Int
{
    return x.count
}
