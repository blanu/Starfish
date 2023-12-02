//
//  ⟝.swift
//
//
//  Created by Dr. Brandon Wiley on 12/2/23.
//

import Foundation

import Starfish

prefix operator ⟝
prefix operator ⟞

public prefix func ⟝<E>(_ array: [E]) throws -> E
{
    guard let result = array.first else
    {
        throw FirstError.emptyArray
    }

    return result
}

public prefix func ⟞<E>(_ array: [E]) throws -> E
{
    guard let result = array.last else
    {
        throw FirstError.emptyArray
    }

    return result
}

public enum FirstError: Error
{
    case emptyArray
}
