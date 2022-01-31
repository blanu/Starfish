//
//  Enlist.swift
//  
//
//  Created by Dr. Brandon Wiley on 1/7/22.
//

import Foundation

public func enlist<T>(_ x: T) -> [T]
{
    return [x]
}

public func enlist<T>(_ x: [T]) -> [[T]]
{
    return [x]
}
