//
//  ∑.swift
//
//
//  Created by Dr. Brandon Wiley on 12/3/23.
//

import Foundation

prefix operator ∑

public prefix func ∑<A>(_ xs: [A]) -> A where A: AdditiveArithmetic
{
    return xs.reduce(A.zero, +)
}
