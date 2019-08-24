
import Foundation

public extension V3_21 {

    class ActivityLogAnalyzerControlFlowStep: ActivityLogAnalyzerStep {
        public let title: String?
        public let startLocation: DocumentLocation?
        public let endLocation: DocumentLocation?
        public let edges: [ActivityLogAnalyzerControlFlowStepEdge]?

        private enum CodingKeys: CodingKey {
            case title
            case startLocation
            case endLocation
            case edges
        }

        public init(
            parentIndex: Int?,
            title: String?,
            startLocation: DocumentLocation?,
            endLocation: DocumentLocation?,
            edges: [ActivityLogAnalyzerControlFlowStepEdge]?
            ) {
            self.title = title
            self.startLocation = startLocation
            self.endLocation = endLocation
            self.edges = edges
            super.init(parentIndex: parentIndex)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            title = try container.decodeIfPresent(_Value<String>.self, forKey: .title)?._value
            startLocation = try container.decodeIfPresent(DocumentLocation.self, forKey: .startLocation)
            endLocation = try container.decodeIfPresent(DocumentLocation.self, forKey: .endLocation)
            edges = try container.decodeIfPresent(_Values<ActivityLogAnalyzerControlFlowStepEdge>.self, forKey: .edges)?._values
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(title, forKey: .title)
            try container.encodeIfPresent(startLocation, forKey: .startLocation)
            try container.encodeIfPresent(endLocation, forKey: .endLocation)
            try container.encodeIfPresent(edges, forKey: .edges)
        }
    }
}
