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
            
            if calculator >= 1 {
                averaged.append(temporaryHolder / chunkNumber)
                temporaryHolder = 0
                calculator = 0
            }
        }
        if Int(chunkNumber) > data.count - 1 {
            assertionFailure("Chunk number > number of elements in array")
        }
        return averaged
    }
}
