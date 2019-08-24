
import Foundation

public extension V3_21 {

    class Reference: Codable {
        public let id: String?
        public let targetType: TypeDefinition?

        private enum CodingKeys: CodingKey {
            case id
            case targetType
        }

        public init(
            id: String?,
            targetType: TypeDefinition?
            ) {
            self.id = id
            self.targetType = targetType
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decodeIfPresent(_Value<String>.self, forKey: .id)?._value
            targetType = try container.decodeIfPresent(TypeDefinition.self, forKey: .targetType)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(id, forKey: .id)
            try container.encodeIfPresent(targetType, forKey: .targetType)
        }
    }
}
