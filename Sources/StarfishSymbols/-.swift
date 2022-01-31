//
//  -.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation
import Starfish
import Numerics

prefix operator -
infix operator -

// Negate
public prefix func -<T>(_ a: T) -> T where T: SignedNumeric
{
    return negate(a)
}

public prefix func -<T>(_ `as`: [T]) -> [T] where T: SignedNumeric
{
    return negate(`as`)
}

public prefix func -<T>(_ c: Complex<T>) -> Complex<T>
{
    return negate(c)
}

public prefix func -<T>(_ cs: [Complex<T>]) -> [Complex<T>]
{
    return negate(cs)
}

// Minus
public func -<T>(_ a: T, _ b: T) -> T where T: AdditiveArithmetic
{
    return minus(a, b)
}

public func -<T>(_ `as`: [T], _ b: T) -> [T] where T: AdditiveArithmetic
{
    return minus(`as`, b)
}

public func -<T>(_ a: T, _ bs: [T]) -> [T] where T: AdditiveArithmetic
{
    return minus(a, bs)
}

public func -<T>(_ `as`: [T], _ bs: [T]) -> [T] where T: AdditiveArithmetic
{
    return minus(`as`, bs)
}
