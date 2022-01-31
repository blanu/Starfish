//
//  Rotate.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public func rotate<T>(_ x: Int, _ y: [T]) -> [T]
{
    if x == 0
    {
        return y
    }
    else if x > 0
    {
        // Rotate left
        let take = [T](y[..<x])
        var result = [T](y.dropFirst(x))
        result += take

        return result
    }
    else // x < 0
    {
        // Rotate right
        let i = -x
        let c = y.count
        let take = [T](y[c-i..<c])
        var result = [T](y.dropLast(i))
        result += take

        return result
    }
}
