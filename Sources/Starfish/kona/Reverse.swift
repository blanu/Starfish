//
//  File.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/6/22.
//

import Foundation

public func reverse<T>(_ x: [T]) -> [T]
{
    return x.reversed()
}

public func revere(_ x: Data) -> Data
{
    return Data(x.reversed())
}

public func reverse(_ x: String) -> String
{
    var result: String = ""

    var currentIndex = x.startIndex
    while currentIndex < x.endIndex
    {
        result.append(x[currentIndex])
        currentIndex = x.index(after: currentIndex)
    }

    result.append(x[currentIndex])

    return result
}
