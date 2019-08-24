
import Foundation

public extension V3_21 {

    class ActivityLogAnalyzerStep: Codable {
        public let parentIndex: Int?

        private enum CodingKeys: CodingKey {
            case parentIndex
        }

        public init(
            parentIndex: Int?
            ) {
            self.parentIndex = parentIndex
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            parentIndex = try container.decodeIfPresent(_Value<Int>.self, forKey: .parentIndex)?._value
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(parentIndex, forKey: .parentIndex)
        }
    }
}
