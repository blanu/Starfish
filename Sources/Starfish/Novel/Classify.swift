//
//  Classify.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/13/21.
//

import Foundation

public func classify<T>(_ classifiers: [String : (T) -> Bool], list: [T]) -> [String : [T]]?
{
    guard classifiers.count == 2 else
    {
        // FIXME - implement the harder case of unlimited classifiers
        return nil
    }

    var result: [String: [T]] = [:]

    let keys = [String](classifiers.keys)

    let name1 = keys[0]
    let name2 = keys[1]
    let intersection = "\(name1)∩\(name2)"

    guard let f1 = classifiers[name1] else {return nil}
    guard let f2 = classifiers[name2] else {return nil}

    var result1List: [T] = []
    var result2List: [T] = []
    var resultIntersectionList: [T] = []
    var resultElseList: [T] = []

    for item in list
    {
        let result1 = f1(item)
        let result2 = f2(item)
        let resultIntersection = result1 && result2

        if resultIntersection
        {
            resultIntersectionList.append(item)
        }
        else
        {
            if result1
            {
                result1List.append(item)
            }
            else if result2
            {
                result2List.append(item)
            }
            else
            {
                resultElseList.append(item)
            }
        }
    }

    result[name1] = result1List
    result[name2] = result2List
    result[intersection] = resultIntersectionList
    result["else"] = resultElseList

    return result
}
