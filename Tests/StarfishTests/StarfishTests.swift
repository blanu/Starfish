import XCTest
@testable import Starfish

final class StarfishTests: XCTestCase
{
    func testEnumerateOdometer()
    {
        let correct = [
            [0, 0],
            [0, 1],
            [0, 2],
            [1, 0],
            [1, 1],
            [1, 2]
        ]

        let result = enumerate([2, 3])

        XCTAssertEqual(result, correct)
    }
}
