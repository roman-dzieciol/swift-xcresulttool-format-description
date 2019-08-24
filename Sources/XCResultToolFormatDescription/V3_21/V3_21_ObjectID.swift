
import Foundation

public extension V3_21 {

    class ObjectID: Codable {
        public let hash: String?

        private enum CodingKeys: CodingKey {
            case hash
        }

        public init(
            hash: String?
            ) {
            self.hash = hash
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            hash = try container.decodeIfPresent(_Value<String>.self, forKey: .hash)?._value
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(hash, forKey: .hash)
        }
    }
}
