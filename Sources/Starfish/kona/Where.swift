//
//  File.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/6/22.
//

import Foundation
import AppKit

public func `where`<T>(_ a: [T]) -> [T] where T: BinaryInteger, T.Stride: SignedInteger
{
    var result: [T] = []

    for (index, value) in a.enumerated()
    {
        for _ in 0..<value
        {
            result.append(T(index))
        }
    }

    return result
}
