//
//  Reciprocal+Divide.swift
//  
//
//  Created by Dr. Brandon Wiley on 11/13/21.
//

import Numerics

// Reciprocal
public func reciprocal<T,F>(_ a: T) -> F where T: BinaryInteger, F: FloatingPoint
{
    let fa = F(a)
    let f1 = F(1)
    return f1 / fa
}

public func reciprocal<T,F>(_ `as`: [T]) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return `as`.map
    {
        a in

        let fa = F(a)
        let f1 = F(1)
        return f1 / fa
    }
}

public func reciprocal<T>(_ c: Complex<T>) -> Complex<T>
{
    return Complex.one / c
}

public func reciprocal<T>(_ cs: [Complex<T>]) -> [Complex<T>]
{
    return cs.map
    {
        c in

        return Complex.one / c
    }
}

// Divide
public func divide<T,F>(_ a: T, _ b: T) -> F where T: BinaryInteger, F: FloatingPoint
{
    let af = F(a)
    let bf = F(b)
    return af / bf
}

public func divide<T,F>(_ `as`: [T], _ b: T) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return `as`.map
    {
        a in

        let af = F(a)
        let bf = F(b)
        return af / bf
    }
}

public func divide<T,F>(_ a: T, _ bs: [T]) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return bs.map
    {
        b in

        let af = F(a)
        let bf = F(b)
        return af / bf
    }
}

public func divide<T,F>(_ `as`: [T], _ bs: [T]) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    let zipped = zip(`as`, bs)
    return zipped.map
    {
        (a, b) in

        let af = F(a)
        let bf = F(b)
        return af / bf
    }
}
