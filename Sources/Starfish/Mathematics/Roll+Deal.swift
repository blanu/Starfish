//
//  Roll+Deal.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation

// Roll
public func roll(_ x: Int) -> Int
{
    return Int.random(in: 1..<x)
}

public func roll(_ x: Float) -> Float?
{
    guard x == 0 else {return nil}
    return Float.random(in: 0..<1)
}

// Deal
public func deal(_ x: Int, _ y: Int) -> [Int]?
{
    guard x < y else {return nil}

    var options = enumerate(y)
    var results: [Int] = []
    let total = Int(x)

    for _ in 0..<total
    {
        let index = Int.random(in: 1..<y)
        let element = options[index]
        options.remove(at: index)

        results.append(element)
    }

    return results
}
