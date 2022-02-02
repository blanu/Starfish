//
//  NaturalLogarithm+Logarithm.swift
//
//
//  Created by Dr. Brandon Wiley on 11/13/21.
//

import Foundation
import Numerics

// Natural Logarithm
public func naturalLogarithm(_ a: Float) -> Float
{
    return logf(a)
}

public func naturalLogarithm(_ a: Double) -> Double
{
    return log(a)
}

public func naturalLogarithm<T>(_ a: T) -> Float where T: BinaryInteger
{
    let af = Float(a)
    return logf(af)
}

public func naturalLogarithm<T>(_ a: T) -> Double where T: BinaryInteger
{
    let af = Double(a)
    return log(af)
}

public func naturalLogarithm(_ `as`: [Float]) -> [Float]
{
    `as`.map
    {
        a in

        return naturalLogarithm(a)
    }
}

public func naturalLogarithm(_ `as`: [Double]) -> [Double]
{
    `as`.map
    {
        a in

        return naturalLogarithm(a)
    }
}

public func naturalLogarithm<T>(_ `as`: [T]) -> [Float] where T: BinaryInteger
{
    `as`.map
    {
        a in

        return naturalLogarithm(a)
    }
}

public func naturalLogarithm<T>(_ `as`: [T]) -> [Double] where T: BinaryInteger
{
    `as`.map
    {
        a in

        return naturalLogarithm(a)
    }
}

// Logarithm
public func logarithm<F>(_ x: F, _ b: F) -> F where F: BinaryFloatingPoint
{
    let lx: Double = log(Double(x))
    let lb: Double = log(Double(b))
    return F(lx / lb)
}

public func logarithm<F,T>(_ x: F, _ b: T) -> F where T: BinaryInteger, F: BinaryFloatingPoint
{
    return logarithm(x, F(Int(b)))
}

public func logarithm<F,T>(_ x: T, _ b: F) -> F where T: BinaryInteger, F: BinaryFloatingPoint
{
    return logarithm(F(Int(x)), b)
}

public func logarithm<T,F>(_ x: T, _ b: T) -> F where T: BinaryInteger, F: BinaryFloatingPoint
{
    return logarithm(F(Int(x)), F(Int(b)))
}

public func logarithm<F,T>(_ `as`: [T], _ b: T) -> [F] where T: BinaryInteger, F: BinaryFloatingPoint
{
    return `as`.map
    {
        a in

        return logarithm(a, b)
    }
}

public func logarithm<F,T>(_ a: T, _ bs: [T]) -> [F] where T: BinaryInteger, F: BinaryFloatingPoint
{
    return bs.map
    {
        b in

        return logarithm(a, b)
    }
}

public func logarithm<F,T>(_ `as`: [T], _ bs: [T]) -> [F] where T: BinaryInteger, F: BinaryFloatingPoint
{
    let zipped = zip(`as`, bs)
    return zipped.map
    {
        (a, b) in

        return logarithm(a, b)
    }
}
