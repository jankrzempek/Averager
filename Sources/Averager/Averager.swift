import Darwin
import Foundation

public struct Averager {
    public init() {}
    
    public func arithmeticAverage(using data: Array<Double>, chunkedEvery chunkNumber: Double) -> Array<Double> {
        assertCorrectness(of: data, chunkedBy: chunkNumber)
        var averaged = [Double]()
        let chunkedArray = data.chunked(into: Int(chunkNumber))
        
        chunkedArray.forEach { chunk in
            averaged.append(chunk.map({ $0 }).reduce(0, +) / Double(chunk.count))
        }
        return averaged
    }
    
    public func medianAverage(using data: Array<Double>, chunkedEvery chunkNumber: Double) -> Array<Double> {
        assertCorrectness(of: data, chunkedBy: chunkNumber)
        var averaged = [Double]()
        let chunkedArray = data.chunked(into: Int(chunkNumber))
        
        chunkedArray.forEach { chunk in
            let middle = chunk.count / 2
            if chunk.count % 2 == 0 {
                var counter = 0.0
                counter += chunk[middle]
                counter += chunk[middle - 1]
                averaged.append(counter / 2)
            } else {
                averaged.append(chunk[middle])
            }
        }
        return averaged
    }
    
    public func geometricAverage(using data: Array<Double>, chunkedEvery chunkNumber: Double) -> Array<Double> {
        assertCorrectness(of: data, chunkedBy: chunkNumber)
        var averaged = [Double]()
        let chunkedArray = data.chunked(into: Int(chunkNumber))
        
        chunkedArray.forEach { chunk in
            let sum = chunk.map({ $0 }).reduce(1, *)
            let element = pow(sum, 1.0 / Double(chunk.count))
            averaged.append(element)
        }
        return averaged
    }
}

internal extension Averager {
    func assertCorrectness(of data: Array<Double>, chunkedBy chunkNumber: Double) {
        if Int(chunkNumber) > data.count {
            assertionFailure("Chunk number is grater then number of elements in array")
        }
    }
}
