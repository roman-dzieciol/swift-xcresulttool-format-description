
import Foundation

public extension V3_21 {

    class ActivityLogAnalyzerEventStep: ActivityLogAnalyzerStep {
        public let title: String?
        public let location: DocumentLocation?
        public let description: String?
        public let callDepth: Int?

        private enum CodingKeys: CodingKey {
            case title
            case location
            case description
            case callDepth
        }

        public init(
            parentIndex: Int?,
            title: String?,
            location: DocumentLocation?,
            description: String?,
            callDepth: Int?
            ) {
            self.title = title
            self.location = location
            self.description = description
            self.callDepth = callDepth
            super.init(parentIndex: parentIndex)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decodeIfPresent(_Value<String>.self, forKey: .title)?._value
            location = try container.decodeIfPresent(DocumentLocation.self, forKey: .location)
            description = try container.decodeIfPresent(_Value<String>.self, forKey: .description)?._value
            callDepth = try container.decodeIfPresent(_Value<Int>.self, forKey: .callDepth)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(title, forKey: .title)
            try container.encodeIfPresent(location, forKey: .location)
            try container.encodeIfPresent(description, forKey: .description)
            try container.encodeIfPresent(callDepth, forKey: .callDepth)
        }
    }
}
