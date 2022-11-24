//
//  Combinators.swift
//  
//
//  Created by Dr. Brandon Wiley on 11/23/22.
//

import Foundation

import BigArray
import BigNumber

public func after<S, U, V>(_ f: (BigArray<S>, BigArray<U>) -> BigArray<V>, _ g: (BigArray<S>) -> BigArray<U>, _ xs: BigArray<S>) -> BigArray<V> where S: AdditiveArithmetic, U: AdditiveArithmetic, V: AdditiveArithmetic
{
    return f(xs, g(xs))
}

public func after<S, T, U>(_ f: @escaping (BigArray<S>) -> BigArray<T>, _ g: @escaping (BigArray<T>, BigArray<S>) -> BigArray<U>) -> (BigArray<S>) -> BigArray<U> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic
{
    return {xs in g(f(xs), xs)}
}

public func after<S, T, U, V>(_ f: (BigArray<S>, BigArray<U>) -> BigArray<V>, _ g: (BigArray<T>) -> BigArray<U>, _ xs: BigArray<S>, _ ys: BigArray<T>) -> BigArray<V> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic, V: AdditiveArithmetic
{
    return f(xs, g(ys))
}

public func after<S, T, U, V>(_ f: @escaping (BigArray<S>, BigArray<U>) -> BigArray<V>, _ g: @escaping (BigArray<T>) -> BigArray<U>) -> (BigArray<S>, BigArray<T>) -> BigArray<V> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic, V: AdditiveArithmetic
{
    return {xs, ys in f(xs, g(ys))}
}

public func atop<S, T, U>(_ f: (BigArray<S>) -> BigArray<T>, _ g: (BigArray<T>) -> BigArray<U> , _ xs: BigArray<S>) -> BigArray<U> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic
{
    return g(f(xs))
}

public func atop<S, T, U>(_ f: @escaping (BigArray<S>) -> BigArray<T>, _ g: @escaping (BigArray<T>) -> BigArray<U>) -> (BigArray<S>) -> BigArray<U> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic
{
    return {xs in g(f(xs))}
}

public func atop<S, T, U, V>(_ f: (BigArray<S>, BigArray<T>) -> BigArray<U>, _ g: (BigArray<U>) -> BigArray<V>, _ xs: BigArray<S>, _ ys: BigArray<T>) -> BigArray<V> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic, V: AdditiveArithmetic
{
    return g(f(xs, ys))
}

public func atop<S, T, U, V>(_ f: @escaping (BigArray<S>, BigArray<T>) -> BigArray<U>, _ g: @escaping (BigArray<U>) -> BigArray<V>) -> (BigArray<S>, BigArray<T>) -> BigArray<V> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic, V: AdditiveArithmetic
{
    return {xs, ys in g(f(xs, ys))}
}

public func before<S, T, U>(_ f: (BigArray<S>) -> BigArray<T>, _ g: (BigArray<T>, BigArray<S>) -> BigArray<U>, _ xs: BigArray<S>) -> BigArray<U> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic
{
    return g(f(xs), xs)
}

public func before<S, T, U>(_ f: @escaping (BigArray<S>) -> BigArray<T>, _ g: @escaping (BigArray<T>, BigArray<S>) -> BigArray<U>) -> (BigArray<S>) -> BigArray<U> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic
{
    return {xs in g(f(xs), xs)}
}

public func before<S, T, U, V>(_ f: (BigArray<S>) -> BigArray<T>, _ g: (BigArray<T>, BigArray<U>) -> BigArray<V>, _ xs: BigArray<S>, _ ys: BigArray<U>) -> BigArray<V> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic, V: AdditiveArithmetic
{
    return g(f(xs), ys)
}

public func before<S, T, U, V>(_ f: @escaping (BigArray<S>) -> BigArray<U>, _ g: @escaping (BigArray<U>, BigArray<T>) -> BigArray<V>) -> (BigArray<S>, BigArray<T>) -> BigArray<V> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic, V: AdditiveArithmetic
{
    return {xs, ys in g(f(xs), ys)}
}

public func catchError<S, T>(_ f: (BigArray<S>) throws -> BigArray<T>, _ g: (BigArray<S>) -> BigArray<T>, _ xs: BigArray<S>) -> BigArray<T> where S: AdditiveArithmetic, T: AdditiveArithmetic
{
    do
    {
        return try f(xs)
    }
    catch
    {
        return g(xs)
    }
}

public func catchError<S, T>(_ f: @escaping (BigArray<S>) throws -> BigArray<T>, _ g: @escaping (BigArray<S>) -> BigArray<T>) -> (BigArray<S>) -> BigArray<T> where S: AdditiveArithmetic, T: AdditiveArithmetic
{
    return {
        xs in

        do
        {
            return try f(xs)
        }
        catch
        {
            return g(xs)
        }
    }
}

public func choose<S, T>(_ f: (BigArray<S>, BigArray<T>) -> BigArray<BInt>, _ g: [(BigArray<S>, BigArray<T>) -> BigArray<BInt>], _ xs: BigArray<S>, _ ys: BigArray<T>) -> BigArray<BInt> where S: AdditiveArithmetic, T: AdditiveArithmetic
{
    let indices = f(xs, ys)
    guard indices.count == 1 else
    {
        return indices
    }

    let index = indices[0]
    guard let int = index.asInt() else
    {
        return indices
    }

    guard int >= 0, int < g.count else
    {
        return indices
    }

    let h = g[int]
    return h(xs, ys)
}

public func choose<S, T>(_ f: @escaping (BigArray<S>, BigArray<T>) -> BigArray<BInt>, _ g: [(BigArray<S>, BigArray<T>) -> BigArray<BInt>]) -> (BigArray<S>, BigArray<T>) -> BigArray<BInt> where S: AdditiveArithmetic, T: AdditiveArithmetic
{
    return {
        xs, ys in

        let indices = f(xs, ys)
        guard indices.count == 1 else
        {
            return indices
        }

        let index = indices[0]
        guard let int = index.asInt() else
        {
            return indices
        }

        guard int >= 0, int < g.count else
        {
            return indices
        }

        let h = g[int]
        return h(xs, ys)
    }
}

public func constant<S, T, U>(_ f: @escaping (BigArray<S>) -> BigArray<T>, _ xs: BigArray<S>) -> (BigArray<U>) -> BigArray<T> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic
{
    return {_ in f(xs)}
}

public func constant<S, T, U, V, W>(_ f: @escaping (BigArray<S>, BigArray<V>) -> BigArray<T>, _ xs: BigArray<S>, _ ys: BigArray<V>) -> (BigArray<U>, BigArray<W>) -> BigArray<T> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic, V: AdditiveArithmetic, W: AdditiveArithmetic
{
    return {_, _ in f(xs, ys)}
}

public func over<S, T, U>(_ f: (BigArray<S>) -> BigArray<T>, _ g: (BigArray<T>) -> BigArray<U> , _ xs: BigArray<S>) -> BigArray<U> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic
{
    return g(f(xs))
}

public func over<S, T, U>(_ f: @escaping (BigArray<S>) -> BigArray<T>, _ g: @escaping (BigArray<T>) -> BigArray<U>) -> (BigArray<S>) -> BigArray<U> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic
{
    return {xs in g(f(xs))}
}

public func over<S, T, U>(_ f: (BigArray<T>, BigArray<T>) -> BigArray<U>, _ g: (BigArray<S>) -> BigArray<T>, _ xs: BigArray<S>, _ ys: BigArray<S>) -> BigArray<U> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic
{
    return f(g(xs), g(ys))
}

public func over<S, T, U>(_ f: @escaping (BigArray<T>, BigArray<T>) -> BigArray<U>, _ g: @escaping (BigArray<S>) -> BigArray<T>) -> (BigArray<S>, BigArray<S>) -> BigArray<U> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic
{
    return {xs, ys in f(g(xs), g(ys))}
}

public func swap<S, T>(_ f: (BigArray<S>, BigArray<S>) -> BigArray<T>, _ xs: BigArray<S>) -> BigArray<T> where S: AdditiveArithmetic, T: AdditiveArithmetic
{
    return f(xs, xs)
}

public func swap<S, T>(_ f: @escaping (BigArray<S>, BigArray<S>) -> BigArray<T>) -> (BigArray<S>) -> BigArray<T> where S: AdditiveArithmetic, T: AdditiveArithmetic
{
    return {xs in f(xs, xs)}
}

public func swap<S, T, V>(_ f: (BigArray<S>, BigArray<V>) -> BigArray<T>, _ xs: BigArray<V>, _ ys: BigArray<S>) -> BigArray<T> where S: AdditiveArithmetic, T: AdditiveArithmetic, V: AdditiveArithmetic
{
    return f(ys, xs)
}

public func swap<S, T, V>(_ f: @escaping (BigArray<S>, BigArray<V>) -> BigArray<T>) -> (BigArray<V>, BigArray<S>) -> BigArray<T> where S: AdditiveArithmetic, T: AdditiveArithmetic, V: AdditiveArithmetic
{
    return {zs, bs in f(bs, zs)}
}

public func valence<S, T, U, V>(_ f: (BigArray<S>) -> BigArray<V>, _ g: (BigArray<T>, BigArray<U>) -> BigArray<V>, _ xs: BigArray<S>) -> BigArray<V> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic, V: AdditiveArithmetic
{
    return f(xs)
}

public func valence<S, T, U, V>(_ f: (BigArray<S>) -> BigArray<V>, _ g: (BigArray<T>, BigArray<U>) -> BigArray<V>, _ xs: BigArray<T>, _ ys: BigArray<U>) -> BigArray<V> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic, V: AdditiveArithmetic
{
    return g(xs, ys)
}

public func under<S, T, U>(_ f: (BigArray<T>, BigArray<T>) -> BigArray<U>, _ g: (BigArray<S>) -> BigArray<T>, _ ung: (BigArray<U>) -> BigArray<S>, _ xs: BigArray<S>, _ ys: BigArray<S>) -> BigArray<S> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic
{
    return ung(f(g(xs), g(ys)))
}

public func under<S, T, U>(_ f: @escaping (BigArray<T>, BigArray<T>) -> BigArray<U>, _ g: @escaping (BigArray<S>) -> BigArray<T>, _ ung: @escaping (BigArray<U>) -> BigArray<S>) -> (BigArray<S>, BigArray<S>) -> BigArray<S> where S: AdditiveArithmetic, T: AdditiveArithmetic, U: AdditiveArithmetic
{
    return {xs, ys in ung(f(g(xs), g(ys)))}
}
