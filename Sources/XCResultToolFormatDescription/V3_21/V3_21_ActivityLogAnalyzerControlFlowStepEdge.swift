
import Foundation

public extension V3_21 {

    class ActivityLogAnalyzerControlFlowStepEdge: Codable {
        public let startLocation: DocumentLocation?
        public let endLocation: DocumentLocation?

        private enum CodingKeys: CodingKey {
            case startLocation
            case endLocation
        }

        public init(
            startLocation: DocumentLocation?,
            endLocation: DocumentLocation?
            ) {
            self.startLocation = startLocation
            self.endLocation = endLocation
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            startLocation = try container.decodeIfPresent(DocumentLocation.self, forKey: .startLocation)
            endLocation = try container.decodeIfPresent(DocumentLocation.self, forKey: .endLocation)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(startLocation, forKey: .startLocation)
            try container.encodeIfPresent(endLocation, forKey: .endLocation)
        }
    }
}
