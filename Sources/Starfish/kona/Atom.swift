//
//  File.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public func atom<T>(_ x: T) -> Bool
{
    return true
}

public func atom<T>(_ x: [T]) -> Bool
{
    return false
}

public func atom<T>(_ x: [[T]]) -> Bool
{
    return false
}

public func atom<S,T>(_ x: (S,T)) -> Bool
{
    return false
}

public func atom<R,S,T>(_ x: (R,S,T)) -> Bool
{
    return false
}

public func atom<Q,R,S,T>(_ x: (Q,R,S,T)) -> Bool
{
    return false
}

public func atom<K,V>(_ x: [K:V]) -> Bool
{
    return false
}
