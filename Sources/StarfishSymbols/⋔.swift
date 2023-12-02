//
//  ⋔.swift
//
//
//  Created by Dr. Brandon Wiley on 12/2/23.
//

import Foundation
import Starfish

prefix operator ⋔

public prefix func ⋔<X, Y, Z>(_ tuple: ((Y, Y) -> Z, (X) -> Y, (X) -> Y)) -> (X) -> Z
{
    let (f, g, h) = tuple
    return fork(f, g, h)
}
