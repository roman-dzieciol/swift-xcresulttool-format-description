
import Foundation

public extension V3_21 {

    class ActivityLogAnalyzerWarningMessage: ActivityLogMessage {

        private enum CodingKeys: CodingKey {
        }

        public override init(
            type: String?,
            title: String?,
            shortTitle: String?,
            category: String?,
            location: DocumentLocation?,
            annotations: [ActivityLogMessageAnnotation]?
            ) {
            super.init(type: type, title: title, shortTitle: shortTitle, category: category, location: location, annotations: annotations)
        }

        public required init(
            from decoder: Decoder
            ) throws {
            try super.init(from: decoder)
        }

        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
        }
    }
}
