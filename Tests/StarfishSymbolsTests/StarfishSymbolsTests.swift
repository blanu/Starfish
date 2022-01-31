import XCTest
@testable import StarfishSymbols

final class StarfishSymbolsTests: XCTestCase
{
    func testMaximumMonadic()
    {
        let a: Float = 0.5
        let result: Int = ⌈a
        XCTAssertEqual(result, 1)

        let b: [Float] = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]
        let result2: [Int] = ⌈b
        XCTAssertEqual(result2, [1, 1, 1, 1, 1, 1, 1, 1, 1])
    }

    func testMaximumDyadic()
    {
        let a = 5
        let b = 6
        let result = a ⌈ b
        XCTAssertEqual(result, b)

        let c: [Int] = [ 1, 2, 3, 0, 5, 5, 6, 7, 9]
        let d: [Int] = [11, 2, 0, 4, 5, 6, 7, 8, 99]
        let result2: [Int] = c ⌈ d
        XCTAssertEqual(result2, [11, 2, 3, 4, 5, 6, 7, 8, 99])
    }

    func testMinimumMonadic()
    {
        let a: Float = 0.5
        let result: Int = ⌈a
        XCTAssertEqual(result, 1)

        let b: [Float] = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]
        let result2: [Int] = ⌊b
        XCTAssertEqual(result2, [0, 0, 0, 0, 0, 0, 0, 0, 0])
    }

    func testMinimumDyadic()
    {
        let a = 5
        let b = 6
        let result = a ⌊ b
        XCTAssertEqual(result, a)

        let c: [Int] = [ 1, 2, 3, 0, 5, 5, 6, 7, 9]
        let d: [Int] = [11, 2, 0, 4, 5, 6, 7, 8, 99]
        let result2: [Int] = c ⌊ d
        XCTAssertEqual(result2, [1, 2, 0, 0, 5, 5, 6, 7, 9])
    }

    func testDirection()
    {
        let a = 5
        let b = -6
        let c = 0

        let resulta = ×a
        XCTAssertEqual(resulta, 1)

        let resultb = ×b
        XCTAssertEqual(resultb, -1)

        let resultc = ×c
        XCTAssertEqual(resultc, 0)
    }

    func testTimes()
    {
        let a = 5
        let b = -6
        let c = 0

        let resultab = a × b
        XCTAssertEqual(resultab, -30)

        let resultbc = b × c
        XCTAssertEqual(resultbc, 0)

        let resultac = a × c
        XCTAssertEqual(resultac, 0)
    }
}
