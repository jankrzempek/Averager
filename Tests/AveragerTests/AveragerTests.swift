import XCTest
@testable import Averager

final class AveragerTests: XCTestCase {
    
    private var averager: Averager!
    private var testArray: [Double]!
    private var chunkNumber: Int!
    
    override func setUp() {
        super.setUp()
        averager = Averager()
        testArray = [1, 2, 3, 4, 5, 6, 7]
        chunkNumber = 4
    }
    
    func testInitial() {
        XCTAssert(chunkNumber <= testArray.count)
    }
    
    func testGeometric() {
        let result = averager.geometricAverage(using: testArray, chunkedEvery: Double(chunkNumber))
        testResult(using: result)
    }
    
    func testMedian() {
        let result = averager.medianAverage(using: testArray, chunkedEvery: Double(chunkNumber))
        testResult(using: result)
    }
    
    func testArythmetic() {
        let result = averager.arithmeticAverage(using: testArray, chunkedEvery: Double(chunkNumber))
        testResult(using: result)
    }
    
    func testResult(using result: [Double]) {
        if chunkNumber == 0 {
            XCTAssert(result.count == 1)
        } else if testArray.count % chunkNumber == 0 {
            XCTAssert(result.count == testArray.count / chunkNumber)
        } else {
            XCTAssert(result.count == (testArray.count / chunkNumber) + 1)
        }
    }
}
