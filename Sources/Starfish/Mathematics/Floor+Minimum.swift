//
//  Floor+Minimum.swift
//
//
//  Created by Dr. Brandon Wiley on 11/13/21.
//

import Numerics

// Floor
public func floor<F,T>(_ a: F) -> T where T: BinaryInteger, F: BinaryFloatingPoint
{
    let rounded = a.rounded(.down)
    return T(rounded)
}

public func floor<F,T>(_ `as`: [F]) -> [T] where T: BinaryInteger, F: BinaryFloatingPoint
{
    `as`.map
    {
        a in

        return floor(a)
    }
}

// Min
public func minimum<T>(_ a: T, _ b: T) -> T where T: Comparable
{
    return min(a, b)
}

public func minimum<T>(_ `as`: [T], _ b: T) -> [T] where T: Comparable
{
    return `as`.map
    {
        a in

        return min(a, b)
    }
}

public func minimum<T>(_ a: T, _ bs: [T]) -> [T] where T: Comparable
{
    return bs.map
    {
        b in

        return min(a, b)
    }
}

public func minimum<T>(_ `as`: [T], _ bs: [T]) -> [T] where T: Comparable
{
    let zipped = zip(`as`, bs)
    return zipped.map
    {
        (a, b) in

        return min(a, b)
    }
}
