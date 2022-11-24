//
//  Monads.swift
//  
//
//  Created by Dr. Brandon Wiley on 11/21/22.
//

import Foundation

import BigArray
import BigNumber

public func assert(_ xs: BigArray<BInt>) throws -> BigArray<BInt>
{
    guard xs.count == 1 else
    {
        throw BigMonadError.scalarRequired
    }

    let x = xs[BInt(0)]
    guard x == BInt(1) else
    {
        throw BigMonadError.assertionFailed
    }

    return xs
}

public func ceiling(_ xs: BigArray<BDouble>) -> BigArray<BInt>
{
    return monad(xs) {ceil($0)}
}

public func classify<T>(_ xs: BigArray<T>) throws -> BigArray<BInt> where T: AdditiveArithmetic
{
    var results: BigArray<BInt> = BigArray<BInt>()
    var seen: [T: BInt] = [:]

    var counter: BInt = BInt(0)
    for x in xs
    {
        if let position = seen[x]
        {
            results.append(position)
        }
        else
        {
            results.append(counter)
            seen[x] = counter
        }

        counter += 1
    }

    return results
}

public func conjugate<T>(_ xs: BigArray<T>) -> BigArray<T> where T: AdditiveArithmetic
{
    return monad(xs, {(x: T) in conjugate(x)})
}

public func deduplicate<T>(_ xs: BigArray<T>) throws -> BigArray<T> where T: AdditiveArithmetic
{
    var results: BigArray<T> = BigArray<T>()
    var seen: [T: BInt] = [:]

    for (index, x) in xs.enumerated()
    {
        if seen[x] == nil
        {
            seen[x] = BInt(index)
            results.append(x)
        }
    }

    return results
}

public func direction<T>(_ xs: BigArray<T>) -> BigArray<BInt> where T: AdditiveArithmetic
{
    return monad(xs)
    {
        x in

        if x < 0
        {
            return BInt(-1)
        }
        else if x == 0
        {
            return BInt(0)
        }
        else
        {
            // x > 0
            return BInt(1)
        }
    }
}

public func exponential(_ xs: BigArray<BInt>) -> BigArray<BDouble>
{
    let e = BDouble(2.718281828)
    return monad(xs) {pow(e, $0)}
}

public func exponential(_ xs: BigArray<BDouble>) -> BigArray<BDouble>
{
    let e = BDouble(2.718281828)
    return monad(xs) {pow(e, $0)}
}

public func factorial(_ xs: BigArray<BInt>) -> BigArray<BInt>
{
    return monad(xs) {factorial($0)}
}

public func floor(_ xs: BigArray<BDouble>) -> BigArray<BInt>
{
    return monad(xs) {floor($0)}
}

public func first<T>(_ xs: BigArray<T>) -> BigArray<T> where T: AdditiveArithmetic
{
    guard xs.count > 0 else
    {
        return BigArray<T>()
    }

    var results: BigArray<T> = BigArray<T>()
    let result = xs[0]
    results.append(result)
    return results
}

public func gradeDown<T>(_ xs: BigArray<T>) throws -> BigArray<BInt> where T: AdditiveArithmetic
{
    let ys = enumerate(xs.count)

    let zipped = zip(xs, ys)
    let sortedZipped = zipped.sorted(by: {
        let (x1, _) = $0
        let (x2, _) = $1

        return x1 < x2
    })

    var results: BigArray<BInt> = BigArray<BInt>()
    for (_, y) in sortedZipped
    {
        results.append(BInt(y))
    }
    return results
}

public func gradeUp<T>(_ xs: BigArray<T>) throws -> BigArray<BInt> where T: AdditiveArithmetic
{
    let ys = enumerate(xs.count)

    let zipped = zip(xs, ys)
    let sortedZipped = zipped.sorted(by: {
        let (x1, _) = $0
        let (x2, _) = $1

        return x1 > x2
    })

    var results: BigArray<BInt> = BigArray<BInt>()
    for (_, y) in sortedZipped
    {
        results.append(BInt(y))
    }
    return results
}

public func magnitude(_ xs: BigArray<BInt>) -> BigArray<BInt>
{
    return monad(xs)
    {
        x in

        if x >= 0
        {
            return x
        }
        else
        {
            return x * BInt(-1)
        }
    }
}

public func magnitude(_ xs: BigArray<BDouble>) -> BigArray<BDouble>
{
    return monad(xs)
    {
        x in

        if x >= 0
        {
            return x
        }
        else
        {
            return x * BInt(-1)
        }
    }
}

public func markFirsts<T>(_ xs: BigArray<T>) throws -> BigArray<BInt> where T: AdditiveArithmetic
{
    var results: BigArray<BInt> = BigArray<BInt>()
    var seen: [T: BInt] = [:]

    for (index, x) in xs.enumerated()
    {
        if seen[x] == nil
        {
            seen[x] = BInt(index)
            results.append(BInt(0))
        }
        else
        {
            results.append(BInt(1))
        }
    }

    return results
}

public func negate(_ xs: BigArray<BInt>) -> BigArray<BInt>
{
    return monad(xs)
    {
        x in

        return x * BInt(-1)
    }
}

public func negate(_ xs: BigArray<BDouble>) -> BigArray<BDouble>
{
    return monad(xs)
    {
        x in

        return x * BDouble(-1)
    }
}

public func not(_ xs: BigArray<BInt>) -> BigArray<BInt>
{
    return monad(xs) {~$0}
}

public func occourenceCount<T>(_ xs: BigArray<T>) throws -> BigArray<BInt> where T: AdditiveArithmetic
{
    var results: BigArray<BInt> = BigArray<BInt>()
    var seen: [T: BInt] = [:]

    for x in xs
    {
        if var count = seen[x]
        {
            count += 1
            seen[x] = count

            results.append(count)
        }
        else
        {
            let count = BInt(0)
            seen[x] = count

            results.append(count)
        }
    }

    return results
}

public func roll(_ xs: BigArray<BInt>) -> BigArray<BInt>
{
    return monad(xs)
    {
        var result = BIntMath.randomBInt(bits: $0.size)
        while result >= $0
        {
            result = BIntMath.randomBInt(bits: $0.size)
        }
        return result
    }
}

public func reciprocal(_ xs: BigArray<BInt>) -> BigArray<BDouble>
{
    return monad(xs)
    {
        x in

        return BDouble(1) / x
    }
}

public func reciprocal(_ xs: BigArray<BDouble>) -> BigArray<BDouble>
{
    return monad(xs)
    {
        x in

        return BDouble(1) / x
    }
}

public func same<T>(_ xs: BigArray<T>) -> BigArray<T>
{
    return xs
}

public func sortUp<T>(_ xs: BigArray<T>) -> BigArray<T> where T: AdditiveArithmetic
{
    return xs.sorted(by: >)
}

public func sortDown<T>(_ xs: BigArray<T>) -> BigArray<T> where T: AdditiveArithmetic
{
    return xs.sorted(by: <)
}

public func squareRoot(_ xs: BigArray<BInt>) -> BigArray<BDouble>
{
    return monad(xs) {BDouble($0).squareRoot()}
}

public func squareRoot(_ xs: BigArray<BDouble>) -> BigArray<BDouble>
{
    return monad(xs) {$0.squareRoot()}
}

public enum BigMonadError: Error
{
    case scalarRequired
    case assertionFailed
}
