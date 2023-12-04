//
//  ¨.swift
//
//
//  Created by Dr. Brandon Wiley on 12/2/23.
//

import Foundation

import Starfish

prefix operator ⟝
prefix operator ⟞

infix operator →
infix operator ⇢

public func →<X, Y>(_ xs: [X], _ f: (X) throws -> Y) throws -> [Y]
{
    return try xs.map(f)
}

public func ⇢<X, Y>(_ xs: [X], _ f: (X) throws -> Y) -> [Y]
{
    return xs.compactMap
    {
        x in

        do
        {
            return try f(x)
        }
        catch
        {
            return nil
        }
    }
}
