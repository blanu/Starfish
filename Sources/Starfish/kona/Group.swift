//
//  File.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public func group<T>(_ x: [T]) -> [[Int]] where T: Hashable
{
    var dict: [T: [Int]] = [:]

    for (index, value) in x.enumerated()
    {
        if let list = dict[value]
        {
            dict[value] = list + [index]
        }
        else
        {
            dict[value] = [index]
        }
    }

    let result = [[Int]](dict.values)
    return result.sorted
    {
        (list1, list2) -> Bool in

        for (value1, value2) in zip(list1, list2)
        {
            if value1 < value2
            {
                return false
            }
        }

        return true
    }
}
