//
//  Modifiers.swift
//  
//
//  Created by Dr. Brandon Wiley on 11/23/22.
//

import Foundation

import BigArray
import BigNumber

public func each<S, T>(_ f: (S) -> T, _ xs: BigArray<S>) -> BigArray<T> where S: AdditiveArithmetic, T: AdditiveArithmetic
{
    return xs.map(f)
}

public func each<S, T>(_ f: @escaping (S) -> T) -> (BigArray<S>) -> BigArray<T> where S: AdditiveArithmetic, T: AdditiveArithmetic
{
    return {xs in xs.map(f)}
}

// fold RIGHT
public func fold<T>(_ f: (T, T) -> T, _ xs: BigArray<T>) -> BigArray<T> where T: AdditiveArithmetic
{
    if xs.count <= 0
    {
        return xs
    }
    else
    {
        var current: T = xs[0]
        for offset in xs.index(after: xs.startIndex)..<xs.endIndex // from the RIGHT
        {
            let index = xs.index(before: xs.endIndex) - offset
            let element = xs[index]
            current = f(current, element)
        }

        var results: BigArray<T> = BigArray<T>()
        results.append(current)
        return results
    }
}

struct Identities
{
    static let add = BInt(0)
    static let subtract = BInt(0)
    static let multiply = BInt(1)
    static let divide = BInt(1)
    static let power = BInt(1)
    static let not = BInt(1)
    static let or = BInt(0)
    static let and = BInt(1)
    static let notEquals = BInt(0)
    static let equals = BInt(1)
    static let greaterThan = BInt(0)
    static let greatThanOrEqualTo = BInt(1)
    static let lessThan = BInt(0)
    static let lessThanOrEqualTo = BInt(1)
}

public func foldAdd(_ xs: BigArray<BInt>) -> BigArray<BInt>
{
    var xs2 = xs
    xs2.append(Identities.add)

    return fold(+, xs)
}

public func foldAdd(_ xs: BigArray<BDouble>) -> BigArray<BDouble>
{
    var xs2 = xs
    xs2.append(BDouble(Identities.add))

    return fold(+, xs)
}

public func foldSubtract(_ xs: BigArray<BInt>) -> BigArray<BInt>
{
    var xs2 = xs
    xs2.append(Identities.subtract)

    return fold(-, xs)
}

public func foldSubtract(_ xs: BigArray<BDouble>) -> BigArray<BDouble>
{
    var xs2 = xs
    xs2.append(BDouble(Identities.subtract))

    return fold(-, xs)
}

// scan LEFT
public func scan<T>(_ f: (T, T) -> T, _ xs: BigArray<T>) -> BigArray<T> where T: AdditiveArithmetic
{
    if xs.count <= 0
    {
        return xs
    }
    else
    {
        var results: BigArray<T> = BigArray<T>()
        var current: T = xs[0]
        for index in xs.startIndex..<xs.endIndex // scan from the LEFT
        {
            let element = xs[index]
            current = f(current, element)
            results.append(current)
        }

        return results
    }
}
