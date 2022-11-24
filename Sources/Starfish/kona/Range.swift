//
//  Range.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation
import Abacus

public func range<T>(_ x: [T]) -> [T] where T: Hashable
{
    let set = OrderedSet<T>()
    for value in x
    {
        set.add(value)
    }

    return set.array
}
