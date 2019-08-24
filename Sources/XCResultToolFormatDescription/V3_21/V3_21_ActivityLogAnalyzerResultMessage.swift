
import Foundation

public extension V3_21 {

    class ActivityLogAnalyzerResultMessage: ActivityLogMessage {
        public let steps: [ActivityLogAnalyzerStep]?
        public let resultType: String?
        public let keyEventIndex: Int?

        private enum CodingKeys: CodingKey {
            case steps
            case resultType
            case keyEventIndex
        }

        public init(
            type: String?,
            title: String?,
            shortTitle: String?,
            category: String?,
            location: DocumentLocation?,
            annotations: [ActivityLogMessageAnnotation]?,
            steps: [ActivityLogAnalyzerStep]?,
            resultType: String?,
            keyEventIndex: Int?
            ) {
            self.steps = steps
            self.resultType = resultType
            self.keyEventIndex = keyEventIndex
            super.init(type: type, title: title, shortTitle: shortTitle, category: category, location: location, annotations: annotations)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            steps = try container.decodeIfPresent(_Values<ActivityLogAnalyzerStep>.self, forKey: .steps)?._values
            resultType = try container.decodeIfPresent(_Value<String>.self, forKey: .resultType)?._value
            keyEventIndex = try container.decodeIfPresent(_Value<Int>.self, forKey: .keyEventIndex)?._value
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(steps, forKey: .steps)
            try container.encodeIfPresent(resultType, forKey: .resultType)
            try container.encodeIfPresent(keyEventIndex, forKey: .keyEventIndex)
        }
    }
}
