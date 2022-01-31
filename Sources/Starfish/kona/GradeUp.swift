//
//  GradeUp.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public func gradeUp<T>(_ x: [T]) -> [Int] where T: Comparable
{
    let indexes = enumerate(x.count)

    let list = zip(x, indexes)

    let sorted = list.sorted
    {
        (t1, t2) -> Bool in

        let (value1, _) = t1
        let (value2, _) = t2

        return value1 > value2
    }

    return sorted.map
    {
        (t) -> Int in

        let (_, index) = t

        return index
    }
}
