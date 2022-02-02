//
//  MatrixInverse+MatrixDivide.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/14/21.
//

import Foundation
import Accelerate

public func matrixInvert(_ matrix : [Double]) -> [Double]
{
    var inMatrix = matrix
    var N1 = __CLPK_integer(sqrt(Double(matrix.count)))
    var N2 = __CLPK_integer(sqrt(Double(matrix.count)))
    var N3 = __CLPK_integer(sqrt(Double(matrix.count)))
    var pivots = [__CLPK_integer](repeating: 0, count: Int(N1))
    var workspace = [Double](repeating: 0.0, count: Int(N1))
    var error : __CLPK_integer = 0
    dgetrf_(&N1, &N2, &inMatrix, &N3, &pivots, &error)
    dgetri_(&N1, &inMatrix, &N2, &pivots, &workspace, &N3, &error)
    return inMatrix
}

public func matrixDivide(_ a: [Double], _ b: [Double]) -> [Double]
{
    return times(a, matrixInvert(b))
}
