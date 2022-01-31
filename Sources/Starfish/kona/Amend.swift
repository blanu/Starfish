//
//  Amend.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation
import Abacus

// https://github.com/kevinlawler/kona/wiki/Amend
// "Tetradic Amend generalizes in the following way. If the expression is represented as @[x;i;f;y], then i represents a list of arbitrary shape. Arguments i and y must look similar in shape, specifically, they must be conformable. Amend will update x at each value of i using the value of y corresponding to the current position in i."
public func amend<T>(_ x: [T], _ i: Int?, _ f: ((T,T)->T)?, _ y: T) -> [T]
{
    let index = i ?? 0

    var result = x

    if let function = f
    {
        result[index] = function(x[index], y)
    }
    else
    {
        result[index] = y
    }

    return result
}

public func amend<T>(_ x: [T], _ i: [Int]?, _ f: ((T,T)->T)?, _ y: [T]) -> [T]
{
    if let indexes = i
    {
        var result = x

        for (yindex, xindex) in indexes.enumerated()
        {
            if let function = f
            {
                result[xindex] = function(x[xindex], y[yindex])
            }
            else
            {
                result[xindex] = y[yindex]
            }
        }

        return result
    }
    else
    {
        var result = x

        for index in 0..<x.count
        {
            if let function = f
            {
                result[index] = function(x[index], y[index])
            }
            else
            {
                result[index] = y[index]
            }
        }

        return result
    }
}

public func amend<S,T>(_ x: [S], _ i: Int?, _ f: ((S,T)->S), _ y: [T]) -> [S]
{
    let index = i ?? 0

    var result = x

    result[index] = f(x[index], y[0])

    return result
}

public func amend<S,T>(_ x: [S], _ i: [Int]?, _ f: (S,T)->S, _ y: [T]) -> [S]
{
    if let indexes = i
    {
        var result = x

        for (yindex, xindex) in indexes.enumerated()
        {
            result[xindex] = f(x[xindex], y[yindex])
        }

        return result
    }
    else
    {
        var result = x

        for index in 0..<x.count
        {
            result[index] = f(x[index], y[index])
        }

        return result
    }
}

public func amend<K,V>(_ x: [K:V], _ i: K, _ f: ((V,V)->V)?, _ y: V) -> [K:V]
{
    var result = x

    if let function = f
    {
        if let v = x[i]
        {
            result[i] = function(v, y)
        }
    }
    else
    {
        result[i] = y
    }

    return result
}

public func amend<K,V>(_ x: SimpleSortedDictionary<K,V>, _ i: [K]?, _ f: ((V,V)->V)?, _ y: [V]) -> SimpleSortedDictionary<K,V>
{
    if let indexes = i
    {
        // FIXME - copy this, because it is a class
        let result = x

        for (yindex, xindex) in indexes.enumerated()
        {
            if let function = f
            {
                if let v = x.get(key: xindex)
                {
                    result.set(key: xindex, value: function(v, y[yindex]))
                }
            }
            else
            {
                result.set(key: xindex, value: y[yindex])
            }
        }

        return result
    }
    else
    {
        let result = x

        for index in 0..<x.keys().array.count
        {
            if let function = f
            {
                if let v = x.get(index: index)
                {
                    result.set(index: index, value: function(v, y[index]))
                }
            }
            else
            {
                result.set(index: index, value: y[index])
            }
        }

        return result
    }
}

//Triadic Amend At is much like Tetradic Amend At except that the third argument is monadic, and so there is no need for a fourth argument.
public func amend<T>(_ x: [T], _ i: Int?, _ f: (T)->T) -> [T]
{
    let index = i ?? 0

    var result = x

    result[index] = f(x[index])

    return result
}

public func amend<T>(_ x: [T], _ i: [Int]?, _ f: ((T)->T)) -> [T]
{
    if let indexes = i
    {
        var result = x

        for index in indexes
        {
            result[index] = f(x[index])
        }

        return result
    }
    else
    {
        var result = x

        for index in 0..<x.count
        {
            result[index] = f(x[index])
        }

        return result
    }
}

public func amend<K,V>(_ x: SimpleSortedDictionary<K,V>, _ i: K, _ f: (V)->V) -> SimpleSortedDictionary<K,V>
{
    // FIXME - copy this because it is a class
    let result = x

    if let v = x.get(key: i)
    {
        result.set(key: i, value: f(v))
    }

    return result
}

public func amend<K,V>(_ x: SimpleSortedDictionary<K,V>, _ i: [K]?, _ f: (V)->V) -> SimpleSortedDictionary<K,V>
{
    if let indexes = i
    {
        // FIXME - make a copy
        let result = x

        for index in indexes
        {
            if let v = x.get(key: index)
            {
                result.set(key: index, value: f(v))
            }
        }

        return result
    }
    else
    {
        // FIXME - make a copy
        let result = x

        for index in 0..<x.keys().array.count
        {
            if let v = x.get(index: index)
            {
                result.set(index: index, value: f(v))
            }
        }

        return result
    }
}
