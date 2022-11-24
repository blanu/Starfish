//
//  Utility.swift
//  
//
//  Created by Dr. Brandon Wiley on 11/21/22.
//

import Foundation

import BigArray
import BigNumber

public func monad<S, T>(_ xs: BigArray<S>, _ op: (S) -> T) -> BigArray<T> where T: AdditiveArithmetic
{
    return xs.map
    {
        x in

        return op(x)
    }
}

public func dyad<S, T, R>(_ xs: BigArray<S>, _ ys: BigArray<T>, _ op: (S, T) throws -> R) throws -> BigArray<R>
{
    guard xs.count == ys.count else {throw StarfishError.lengthMismatch(xs.count, ys.count)}

    let zipped = zip(xs, ys)
    var results: BigArray<R> = BigArray<R>()

    for (x, y) in zipped
    {
        let result = try op(x, y)
        results.append(result)
    }

    return results
}
