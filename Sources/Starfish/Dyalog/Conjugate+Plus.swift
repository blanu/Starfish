//
//  Conjugate+Plus.swift
//
//
//  Created by Dr. Brandon Wiley on 11/13/21.
//

import Numerics

import BigArray
import BigNumber

// Conjugate
public func conjugate<T>(_ a: T) -> T where T: AdditiveArithmetic
{
    return a
}

public func conjugate<T>(_ `as`: [T]) -> [T] where T: AdditiveArithmetic
{
    return `as`
}

public func conjugate<T>(_ c: Complex<T>) -> Complex<T>
{
    return c.conjugate
}

public func conjugate<T>(_ cs: [Complex<T>]) -> [Complex<T>]
{
    return cs.map
    {
        c in

        return c.conjugate
    }
}

// Plus
public func plus<T>(_ a: T, _ b: T) -> T where T: AdditiveArithmetic
{
    return a + b
}

public func plus<T>(_ `as`: [T], _ b: T) -> [T] where T: AdditiveArithmetic
{
    return `as`.map
    {
        a in

        return a + b
    }
}

public func plus<T>(_ a: T, _ bs: [T]) -> [T] where T: AdditiveArithmetic
{
    return bs.map
    {
        b in

        return a + b
    }
}

public func plus<T>(_ `as`: [T], _ bs: [T]) -> [T] where T: AdditiveArithmetic
{
    let zipped = zip(`as`, bs)
    return zipped.map
    {
        (a, b) in

        return a + b
    }
}
