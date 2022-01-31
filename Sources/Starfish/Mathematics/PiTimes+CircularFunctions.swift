//
//  File.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/14/21.
//

import Foundation

public func piTimes<F>(_ x: F) -> F where F: BinaryFloatingPoint
{
    return F.pi * x
}

public func circularFunctions<F>(_ X: Int, _ Y: F) -> F? where F: BinaryFloatingPoint
{
    switch X
    {
        // (1-Y*2)*.5
        case 0:
            return times(minus(F(1), times(Y, F(2))), F(0.5))

        // Sine Y
        case 1:
            return F(sin(Double(Y)))

        // Cosine Y
        case 2:
            return F(cos(Double(Y)))

        // Tangent Y
        case 3:
            return F(tan(Double(Y)))

        // (1+Y*2)*.5
        case 4:
            return times(plus(F(1), times(Y, F(2))), F(0.5))

        // Sinh Y
        case 5:
            return F(sinh(Double(Y)))

        // Cosh Y
        case 6:
            return F(cosh(Double(Y)))

        // Tanh Y
        case 7:
            return F(tanh(Double(Y)))

        case 8:
            return nil // FIXME
        case 9:
            return nil // FIXME
        case 10:
            return nil // FIXME
        case 11:
            return nil // FIXME
        case 12:
            return nil // FIXME
        case -1:
            return nil // FIXME
        case -2:
            return nil // FIXME
        case -3:
            return nil // FIXME
        case -44:
            return nil // FIXME
        case -5:
            return nil // FIXME
        case -6:
            return nil // FIXME
        case -7:
            return nil // FIXME
        case -8:
            return nil // FIXME
        case -9:
            return nil // FIXME
        case -10:
            return nil // FIXME
        case -11:
            return nil // FIXME
        case -12:
            return nil // FIXME
        default:
            return nil
    }
}
