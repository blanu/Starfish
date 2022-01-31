//
//  ⍟.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/31/22.
//

import Foundation
import Starfish

prefix operator ⍟
infix operator ⍟

// Natural Logarithm
public prefix func ⍟(_ a: Float) -> Float
{
    return naturalLogarithm(a)
}

public prefix func ⍟(_ a: Double) -> Double
{
    return naturalLogarithm(a)
}

public prefix func ⍟<T>(_ a: T) -> Float where T: BinaryInteger
{
    return naturalLogarithm(a)
}

public prefix func ⍟<T>(_ a: T) -> Double where T: BinaryInteger
{
    return naturalLogarithm(a)
}

public prefix func ⍟(_ `as`: [Float]) -> [Float]
{
    return naturalLogarithm(`as`)
}

public prefix func ⍟(_ `as`: [Double]) -> [Double]
{
    return naturalLogarithm(`as`)
}

public prefix func ⍟<T>(_ `as`: [T]) -> [Float] where T: BinaryInteger
{
    return naturalLogarithm(`as`)
}

public prefix func ⍟<T>(_ `as`: [T]) -> [Double] where T: BinaryInteger
{
    return naturalLogarithm(`as`)
}

// Logarithm
public func ⍟<F>(_ x: F, _ b: F) -> F where F: BinaryFloatingPoint
{
    return logarithm(x, b)
}

public func ⍟<F,T>(_ x: F, _ b: T) -> F where T: BinaryInteger, F: BinaryFloatingPoint
{
    return logarithm(x, b)
}

public func ⍟<F,T>(_ x: T, _ b: F) -> F where T: BinaryInteger, F: BinaryFloatingPoint
{
    return logarithm(x, b)
}

public func ⍟<T,F>(_ x: T, _ b: T) -> F where T: BinaryInteger, F: BinaryFloatingPoint
{
    return logarithm(x, b)
}

public func ⍟<F,T>(_ `as`: [T], _ b: T) -> [F] where T: BinaryInteger, F: BinaryFloatingPoint
{
    return logarithm(`as`, b)
}

public func ⍟<F,T>(_ a: T, _ bs: [T]) -> [F] where T: BinaryInteger, F: BinaryFloatingPoint
{
    return logarithm(a, bs)
}

public func ⍟<F,T>(_ `as`: [T], _ bs: [T]) -> [F] where T: BinaryInteger, F: BinaryFloatingPoint
{
    return logarithm(`as`, bs)
}
