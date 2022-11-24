//
//  ⊢.swift
//  
//
//  Created by Dr. Brandon Wiley on 2/1/22.
//

import Foundation
import Starfish

prefix operator ⊢
infix operator ⊢

// Same
public prefix func ⊢<T>(_ x: T) -> T
{
    same(x)
}

public prefix func ⊢<T>(_ x: [T]) -> [T]
{
    same(x)
}

// Left
public func ⊢<S,T>(_ x: S, _ y: T) -> T
{
    right(x, y)
}

public func ⊢<S,T>(_ x: [S], _ y: T) -> T
{
    right(x, y)
}

public func ⊢<S,T>(_ x: S, _ y: [T]) -> [T]
{
    right(x, y)
}

public func ⊢<S,T>(_ x: [S], _ y: [T]) -> [T]
{
    right(x, y)
}

