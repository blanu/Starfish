//
//  Same+Left.swift
//  
//
//  Created by Dr. Brandon Wiley on 2/1/22.
//

import Foundation

// Same
public func same<T>(_ x: T) -> T
{
    return x
}

public func same<T>(_ x: [T]) -> [T]
{
    return x
}

// Left
public func left<S,T>(_ x: S, _ y: T) -> S
{
    return x
}

public func left<S,T>(_ x: [S], _ y: T) -> [S]
{
    return x
}

public func left<S,T>(_ x: S, _ y: [T]) -> S
{
    return x
}

public func left<S,T>(_ x: [S], _ y: [T]) -> [S]
{
    return x
}

// Right
public func right<S,T>(_ x: S, _ y: T) -> T
{
    return y
}

public func right<S,T>(_ x: [S], _ y: T) -> T
{
    return y
}

public func right<S,T>(_ x: S, _ y: [T]) -> [T]
{
    return y
}

public func right<S,T>(_ x: [S], _ y: [T]) -> [T]
{
    return y
}

