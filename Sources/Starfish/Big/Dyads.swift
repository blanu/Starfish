//
//  Dyads.swift
//  
//
//  Created by Dr. Brandon Wiley on 11/21/22.
//

import Foundation

import BigArray
import BigNumber

public func and(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys, {$0 & $1})
}

public func assertWithMessage<T>(_ xs: BigArray<T>, _ ys: BigArray<BInt>) throws -> BigArray<BInt> where T: AdditiveArithmetic
{
    guard ys.count == 1 else
    {
        throw BigMonadError.scalarRequired
    }

    let y = ys[BInt(0)]
    guard y == BInt(1) else
    {
        throw BigDyadError.assertionFailedWithMessage(xs)
    }

    return ys
}

public func binomial(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys)
    {
        k, n in

        return BDouble(n.factorial()) / BDouble(k.factorial() * (n - k).factorial())
    }
}

public func divide(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys, {BDouble($0) / BDouble($1)})
}

public func divideInteger(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys) {$0 / $1}
}

public func equals(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x == y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func equals(_ xs: BigArray<BInt>, _ ys: BigArray<BDouble>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if BDouble(x) == y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func equals(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x == BDouble(y)
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func equals(_ xs: BigArray<BDouble>, _ ys: BigArray<BDouble>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x == y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func find<T>(_ xs: BigArray<T>, _ ys: BigArray<T>) throws -> BigArray<BInt>
{
    var results: BigArray<BInt> = BigArray<BInt>()
    for start in ys.startIndex..<ys.endIndex
    {
        var mismatch = false
        for (offset, x) in xs.enumerated()
        {
            if x != ys[start + offset]
            {
                mismatch = true
                break
            }
        }

        if mismatch
        {
            results.append(BInt(0))
        }
        else
        {
            results.append(BInt(1))
        }
    }

    return results
}

public func gcd(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys) {gcd($0, $1)}
}

public func greaterThan(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x > y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func greaterThan(_ xs: BigArray<BInt>, _ ys: BigArray<BDouble>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if BDouble(x) > y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func greaterThan(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x > BDouble(y)
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func greaterThan(_ xs: BigArray<BDouble>, _ ys: BigArray<BDouble>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x > y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func greaterThanOrEqualTo(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x >= y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func greaterThanOrEqualTo(_ xs: BigArray<BInt>, _ ys: BigArray<BDouble>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if BDouble(x) >= y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func greaterThanOrEqualTo(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x >= BDouble(y)
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func greaterThanOrEqualTo(_ xs: BigArray<BDouble>, _ ys: BigArray<BDouble>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x >= y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func indexOf<T>(_ xs: BigArray<T>, _ ys: BigArray<T>) throws -> BigArray<BInt> where T: AdditiveArithmetic
{
    var results: BigArray<BInt> = BigArray<BInt>()
    var seen: [T: BInt] = [:]

    var counter: BInt = BInt(0)
    for y in ys
    {
        if let position = seen[y]
        {
            results.append(position)
        }
        else
        {
            for (index, x) in xs.enumerated()
            {
                if x == y
                {
                    let position = BInt(index)
                    seen[y] = position
                    results.append(position)
                    break
                }
            }

            // This is a special value that represents "not found".
            results.append(BInt(xs.count))
        }

        counter += 1
    }

    return results
}

public func lcm(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys, lcm)
}

public func left<S, T>(_ xs: BigArray<S>, _ ys: BigArray<T>) throws -> BigArray<S>
{
    return xs
}

public func lessThan(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x < y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func lessThan(_ xs: BigArray<BInt>, _ ys: BigArray<BDouble>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if BDouble(x) < y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func lessThan(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x < BDouble(y)
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func lessThan(_ xs: BigArray<BDouble>, _ ys: BigArray<BDouble>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x < y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func lessThanOrEqualTo(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x <= y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func lessThanOrEqualTo(_ xs: BigArray<BInt>, _ ys: BigArray<BDouble>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if BDouble(x) <= y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func lessThanOrEqualTo(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x <= BDouble(y)
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func lessThanOrEqualTo(_ xs: BigArray<BDouble>, _ ys: BigArray<BDouble>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x <= y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func maximum(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys, {max($0, $1)})
}

public func maximum(_ xs: BigArray<BInt>, _ ys: BigArray<BDouble>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys) {max(BDouble($0), $1)}
}

public func maximum(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys) {max($0, BDouble($1))}
}

public func maximum(_ xs: BigArray<BDouble>, _ ys: BigArray<BDouble>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys, {max($0, $1)})
}

public func memberOf<T>(_ xs: BigArray<T>, _ ys: BigArray<T>) throws -> BigArray<BInt>
{
    var results: BigArray<BInt> = BigArray<BInt>()
    for x in xs
    {
        if ys.contains(where: {$0 == x})
        {
            results.append(BInt(1))
        }
        else
        {
            results.append(BInt(0))
        }
    }

    return results
}

public func minimum(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys) {min($0, $1)}
}

public func minimum(_ xs: BigArray<BInt>, _ ys: BigArray<BDouble>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys) {min(BDouble($0), $1)}
}

public func minimum(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys) {min($0, BDouble($1))}
}

public func minimum(_ xs: BigArray<BDouble>, _ ys: BigArray<BDouble>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys) {min($0, $1)}
}

public func minus(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys, {$0 - $1})
}

public func minus(_ xs: BigArray<BInt>, _ ys: BigArray<BDouble>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys) {BDouble($0) - $1}
}

public func minus(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys) {$0 - $1}
}

public func minus(_ xs: BigArray<BDouble>, _ ys: BigArray<BDouble>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys) {$0 - $1}
}

public func nand(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys) {~($0 & $1)}
}

public func nor(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys) {~($0 | $1)}
}

public func notEquals(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x != y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func notEquals(_ xs: BigArray<BInt>, _ ys: BigArray<BDouble>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if BDouble(x) != y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func notEquals(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x != BDouble(y)
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func notEquals(_ xs: BigArray<BDouble>, _ ys: BigArray<BDouble>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        if x != y
        {
            return BInt(1)
        }
        else
        {
            return BInt(0)
        }
    }
}

public func or(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys) {$0 | $1}
}

public func plus(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys, {$0 + $1})
}

public func plus(_ xs: BigArray<BInt>, _ ys: BigArray<BDouble>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys, {$0 + $1})
}

public func plus(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys, {$0 + $1})
}

public func plus(_ xs: BigArray<BDouble>, _ ys: BigArray<BDouble>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys, {$0 + $1})
}

public func power(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys)
    {
        x, y in

        var result = x
        for _ in 1...y
        {
            result = result * x
        }

        return result
    }
}

public func power(_ xs: BigArray<BInt>, _ ys: BigArray<BDouble>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys) {pow(BDouble($0), $1)}
}

public func power(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys) {pow($0, $1)}
}

public func power(_ xs: BigArray<BDouble>, _ ys: BigArray<BDouble>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys) {pow($0, $1)}
}

public func replicate<T>(_ xs: BigArray<BInt>, _ ys: BigArray<T>) throws -> BigArray<T> where T: AdditiveArithmetic
{
    guard xs.count == ys.count else {throw StarfishError.lengthMismatch(xs.count, ys.count)}

    let zipped = zip(xs, ys)
    var results: BigArray<T> = BigArray<T>()

    for (x, y) in zipped
    {
        var counter = BInt(0)
        while counter < x
        {
            results.append(y)
            counter += 1
        }
    }

    return results
}

public func residue(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys, {$0 % $1})
}

public func right<S, T>(_ xs: BigArray<S>, _ ys: BigArray<T>) throws -> BigArray<T>
{
    return ys
}

public func root(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys)
    {
        x, y in

        let n = y.asInt()!
        return BDouble(x).nthroot(n)
    }
}

public func root(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys)
    {
        x, y in

        let n = y.asInt()!
        return x.nthroot(n)
    }
}

public func span(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys, {BInt(1)+($0-$1)})
}

public func select<T>(_ xs: BigArray<BInt>, _ ys: BigArray<T>) throws -> BigArray<T> where T: AdditiveArithmetic
{
    return try dyad(xs, ys)
    {
        x, _ in

        let index = x

        guard index < ys.count else
        {
            throw BigDyadError<T>.outOfRange(index, BInt(ys.count))
        }

        return ys[index]
    }
}

public func times(_ xs: BigArray<BInt>, _ ys: BigArray<BInt>) throws -> BigArray<BInt>
{
    return try dyad(xs, ys, {$0 * $1})
}

public func times(_ xs: BigArray<BInt>, _ ys: BigArray<BDouble>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys, {$0 * $1})
}

public func times(_ xs: BigArray<BDouble>, _ ys: BigArray<BInt>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys, {$0 * $1})
}

public func times(_ xs: BigArray<BDouble>, _ ys: BigArray<BDouble>) throws -> BigArray<BDouble>
{
    return try dyad(xs, ys, {$0 * $1})
}

public enum BigDyadError<T>: Error where T: AdditiveArithmetic, T: Comparable, T: Codable, T: Equatable, T: Hashable, T: Numeric
{
    case assertionFailedWithMessage(BigArray<T>)
    case outOfRange(BInt, BInt) // selection, maximum
}
