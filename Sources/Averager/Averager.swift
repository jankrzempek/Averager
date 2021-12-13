public struct Averager {
    public init() {}
    
    public func average(data: Array<Double>, chunkNumber: Double) -> Array<Double> {
        let decider: Double = 1 / chunkNumber
        var calculator = 0.0
        var averaged = [Double]()
        var temporaryHolder = 0.0
        
        data.forEach { number in
            temporaryHolder += number
            calculator += decider
            
            if calculator < 1 && number == data.last {
                let devideBy = Int(calculator / decider)
                averaged.append(temporaryHolder / Double(devideBy))
                clearParameters(first: &temporaryHolder, second: &calculator)
            }
            
            if calculator >= 1 {
                averaged.append(temporaryHolder / chunkNumber)
                clearParameters(first: &temporaryHolder, second: &calculator)
            }
        }
        if Int(chunkNumber) > data.count {
            assertionFailure("Chunk number > number of elements in array")
        }
        return averaged
    }
}

private extension Averager {
    func clearParameters(first: inout Double, second: inout Double) {
        first = 0.0
        second = 0.0
    }
}
