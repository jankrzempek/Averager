import XCTest
@testable import Averager

final class AveragerTests: XCTestCase {
    
    private var averager: Averager!
    private var testArray: [Double]!
    private var chunkNumber: Int!
    
    override func setUp() {
        super.setUp()
        averager = Averager()
        testArray = [1, 2, 3, 4, 5, 6]
        chunkNumber = 5
    }
    
    func testAverageFunctionData() {
        XCTAssert(chunkNumber <= testArray.count)
    }
    
    func testAverageFunctionProcessing() {
        let result = averager.average(data: testArray, chunkNumber: Double(chunkNumber))
        print(result)
        XCTAssert(result.count == ((testArray.count % chunkNumber == 0) ?
                                   (testArray.count / chunkNumber) : (testArray.count / chunkNumber) + 1))
    }
}
