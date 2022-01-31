//
//  Ceiling+Maximum.swift
//
//
//  Created by Dr. Brandon Wiley on 11/13/21.
//

import Numerics

// Ceiling
public func ceiling<F,T>(_ a: F) -> T where T: BinaryInteger, F: BinaryFloatingPoint
{
    let rounded = a.rounded(.up)
    return T(rounded)
}

public func ceiling<F,T>(_ `as`: [F]) -> [T] where T: BinaryInteger, F: BinaryFloatingPoint
{
    `as`.map
    {
        a in

        return ceiling(a)
    }
}

// Max
public func maximum(_ a: Bool, _ b: Bool) -> Bool
{
    return a || b
}

public func maximum(_ a: [Bool]) -> Bool
{
    return a.reduce(false)
    {
        (partialResult: Bool, next: Bool) -> Bool in

        return partialResult || next
    }
}

public func maximum<T>(_ a: T, _ b: T) -> T where T: Comparable
{
    return max(a, b)
}

public func maximum<T>(_ `as`: [T], _ b: T) -> [T] where T: Comparable
{
    return `as`.map
    {
        a in

        return max(a, b)
    }
}

public func maximum<T>(_ a: T, _ bs: [T]) -> [T] where T: Comparable
{
    return bs.map
    {
        b in

        return max(a, b)
    }
}

public func maximum<T>(_ `as`: [T], _ bs: [T]) -> [T] where T: Comparable
{
    let zipped = zip(`as`, bs)
    return zipped.map
    {
        (a, b) in

        return max(a, b)
    }
}
