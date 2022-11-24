//
//  Direction+Times.swift
//  
//
//  Created by Dr. Brandon Wiley on 11/13/21.
//

import Numerics

import BigArray
import BigNumber

// Direction
public func direction<T>(_ a: T) -> T where T: BinaryInteger
{
    if a < 0
    {
        return T(-1)
    }
    else if a == 0
    {
        return T(0)
    }
    else
    {
        // a > 0
        return T(1)
    }
}

public func direction<T>(_ `as`: [T]) -> [T] where T: BinaryInteger
{
    return `as`.map
    {
        a in

        if a < 0
        {
            return T(-1)
        }
        else if a == 0
        {
            return T(0)
        }
        else
        {
            // a > 0
            return T(1)
        }
    }
}

public func direction<T>(_ c: Complex<T>) -> Complex<T>
{
    let m = Complex<T>(c.magnitude)
    return c / m
}

public func direction<T>(_ cs: [Complex<T>]) -> [Complex<T>]
{
    return cs.map
    {
        c in

        let m = Complex<T>(c.magnitude)
        return c / m
    }
}

// Times
public func times<T>(_ a: T, _ b: T) -> T where T: Numeric
{
    return a * b
}

public func times<T>(_ `as`: [T], _ b: T) -> [T] where T: Numeric
{
    return `as`.map
    {
        a in

        return a * b
    }
}

public func times<T>(_ a: T, _ bs: [T]) -> [T] where T: Numeric
{
    return bs.map
    {
        b in

        return a * b
    }
}

public func times<T>(_ `as`: [T], _ bs: [T]) -> [T] where T: Numeric
{
    let zipped = zip(`as`, bs)
    return zipped.map
    {
        (a, b) in

        return a * b
    }
}
