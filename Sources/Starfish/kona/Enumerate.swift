//
//  Enumerate.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/6/22.
//

import Foundation
import Gardener

public func enumerate<T>(_ x: T) -> [T] where T: BinaryInteger, T.Stride: SignedInteger
{
    var result: [T] = []
    for index in 0..<x
    {
        result.append(index)
    }

    return result
}

public func enumerate(_ x: String) -> [String]?
{
    return File.contentsOfDirectory(atPath: x)
}

public func enumerate<K,V>(_ x: [K: V]) -> [K]
{
    return [K](x.keys)
}

// Odometer
public func enumerate<T>(_ x: [T]) -> [[T]]where T:BinaryInteger, T.Stride: SignedInteger
{
    let final = [T](x.reversed())
    var results: [[T]] = []

    var current: [T] = []
    for _ in 0..<x.count
    {
        current.append(0)
    }
    results.append(current)

    var isFinal = false
    while !isFinal
    {
        isFinal = true
        for index in 0..<x.count
        {
            if current[index] < final[index]-1
            {
                current[index] += 1
                isFinal = false
                results.append([T](current.reversed()))
                break
            }
            else if current[index] == final[index]-1
            {
                current[index] = 0
            }
        }
    }

    return results
}
