//
//  ∘.swift
//
//
//  Created by Dr. Brandon Wiley on 12/2/23.
//

import Foundation
import Starfish

prefix operator ∘

public prefix func ∘<X, Y, Z>(_ tuple: ((Y) throws -> Z, (X) throws -> Y)) -> (X) throws -> Z
{
    let (f, g) = tuple
    return atop(f, g)
}

public func atop<X, Y, Z>(_ f: @escaping (Y) throws -> Z, _ g: @escaping (X) throws -> Y) -> (X) throws -> Z
{
    return {
        (x: X) -> Z in

        try f(try g(x))
    }
}
