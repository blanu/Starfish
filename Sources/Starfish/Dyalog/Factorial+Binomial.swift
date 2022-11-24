//
//  Factorial+Binomial.swift
//
//
//  Created by Dr. Brandon Wiley on 11/13/21.
//

import Foundation
import Numerics

// Factorial
public func factorial<T>(_ a: T) -> T where T: BinaryInteger
{
    let index = Int(a)
    let result = (1...index).map(Double.init).reduce(1.0, *)
    return T(result)
}

public func factorial<T>(_ `as`: [T]) -> [T] where T: BinaryInteger
{
    `as`.map
    {
        a in

        return factorial(a)
    }
}

public func factorial<F,T>(_ a: T) -> F where T: BinaryInteger, F: FloatingPoint
{
    let index = Int(a)
    return (1...index).map(F.init).reduce(F(1), *)
}

public func factorial<F,T>(_ `as`: [T]) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    `as`.map
    {
        a in

        return factorial(a)
    }
}

// Binomial
public func binomial<F,T>(_ k: T, _ n: T) -> F where T: BinaryInteger, F: FloatingPoint
{
    return divide(factorial(n), times(factorial(k), factorial(minus(n, k))))
}

public func binomial<F,T>(_ `as`: [T], _ b: T) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return `as`.map
    {
        a in

        return binomial(a, b)
    }
}

public func binomial<F,T>(_ a: T, _ bs: [T]) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    return bs.map
    {
        b in

        return binomial(a, b)
    }
}

public func binomial<F,T>(_ `as`: [T], _ bs: [T]) -> [F] where T: BinaryInteger, F: FloatingPoint
{
    let zipped = zip(`as`, bs)
    return zipped.map
    {
        (a, b) in

        return binomial(a, b)
    }
}
