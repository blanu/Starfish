//
//  Negate+Minus.swift
//  
//
//  Created by Dr. Brandon Wiley on 11/13/21.
//

import Numerics

// Negate
public func negate<T>(_ a: T) -> T where T: SignedNumeric
{
    // Strangely mutable API
    var result = a
    result.negate()
    return result
}

public func negate<T>(_ `as`: [T]) -> [T] where T: SignedNumeric
{
    return `as`.map
    {
        a in

        // Strangely mutable API
        var result = a
        result.negate()
        return result
    }
}

public func negate<T>(_ c: Complex<T>) -> Complex<T>
{
    // Strangely mutable API
    var result = c
    result.negate()
    return result
}

public func negate<T>(_ cs: [Complex<T>]) -> [Complex<T>]
{
    return cs.map
    {
        c in

        // Strangely mutable API
        var result = c
        result.negate()
        return result
    }
}

// Minus
public func minus<T>(_ a: T, _ b: T) -> T where T: AdditiveArithmetic
{
    return a - b
}

public func minus<T>(_ `as`: [T], _ b: T) -> [T] where T: AdditiveArithmetic
{
    return `as`.map
    {
        a in

        return a - b
    }
}

public func minus<T>(_ a: T, _ bs: [T]) -> [T] where T: AdditiveArithmetic
{
    return bs.map
    {
        b in

        return a - b
    }
}

public func minus<T>(_ `as`: [T], _ bs: [T]) -> [T] where T: AdditiveArithmetic
{
    let zipped = zip(`as`, bs)
    return zipped.map
    {
        (a, b) in

        return a - b
    }
}
