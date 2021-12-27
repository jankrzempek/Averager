import Foundation

// Taken from https://www.hackingwithswift.com/example-code/language/how-to-split-an-array-into-chunks and modified
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        guard size > 0 else { return [self] }
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
