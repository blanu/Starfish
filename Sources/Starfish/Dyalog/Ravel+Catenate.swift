//
//  Ravel+Catenate.swift
//  
//
//  Created by Dr. Brandon Wiley on 2/7/22.
//

import Foundation

// Ravel
public func ravel<T>(x: T) -> [T]
{
    return [x]
}

public func ravel<T>(x: [T]) -> [T]
{
    return x
}

public func ravel<T>(x: [[T]]) -> [T]
{
    var results: [T] = []
    for sublist in x
    {
        results.append(contentsOf: sublist)
    }

    return results
}

public func ravel<T>(x: [[T]], axis: Int = 2) throws -> [T]
{
    switch axis
    {
        case 1:
            var results: [T] = []
            for sublist in x
            {
                results.append(contentsOf: sublist)
            }

            return results
        case 2:
            var results: [T] = []
            for sublist in x
            {
                results.append(contentsOf: sublist)
            }

            return results
        default:
            throw RavelOrCatenateError.badAxis(axis)
    }
}

public func ravel<T>(x: [[[T]]]) -> [T]
{
    var results: [T] = []
    for sublist in x
    {
        for subsublist in sublist
        {
            results.append(contentsOf: subsublist)
        }
    }

    return results
}

// Catenate
public func catenate<T>(x: T, y: T) -> [T]
{
    var results: [T] = []
    results.append(x)
    results.append(y)
    return results
}

public func catenate<T>(x: [T], y: T) -> [T]
{
    var results: [T] = x
    results.append(y)
    return results
}

public func catenate<T>(x: T, y: [T]) -> [T]
{
    var results: [T] = [x]
    results.append(contentsOf: y)
    return results
}

public func catenate<T>(x: [T], y: [T]) -> [T]
{
    var results: [T] = x
    results.append(contentsOf: y)
    return results
}

//public func catenate<T>(x: T, y: [[T]], axis: Int = 2) throws -> [[T]]
//{
//    switch axis
//    {
//        case 1:
//
//        case 2:
//        default:
//            throw RavelOrCatenateError.badAxis(axis)
//    }
//
//    var results: [T] = x
//    results.append(contentsOf: y)
//    return results
//}

public enum RavelOrCatenateError: Error
{
    case badAxis(Int)
}
