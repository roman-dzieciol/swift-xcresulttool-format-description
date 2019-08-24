
import Foundation

public extension V3_21 {

    class ResultMetrics: Codable {
        public let analyzerWarningCount: Int?
        public let errorCount: Int?
        public let testsCount: Int?
        public let testsFailedCount: Int?
        public let warningCount: Int?

        private enum CodingKeys: CodingKey {
            case analyzerWarningCount
            case errorCount
            case testsCount
            case testsFailedCount
            case warningCount
        }

        public init(
            analyzerWarningCount: Int?,
            errorCount: Int?,
            testsCount: Int?,
            testsFailedCount: Int?,
            warningCount: Int?
            ) {
            self.analyzerWarningCount = analyzerWarningCount
            self.errorCount = errorCount
            self.testsCount = testsCount
            self.testsFailedCount = testsFailedCount
            self.warningCount = warningCount
        }

        public required init(
            from decoder: Decoder
            ) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            analyzerWarningCount = try container.decodeIfPresent(_Value<Int>.self, forKey: .analyzerWarningCount)?._value
            errorCount = try container.decodeIfPresent(_Value<Int>.self, forKey: .errorCount)?._value
            testsCount = try container.decodeIfPresent(_Value<Int>.self, forKey: .testsCount)?._value
            testsFailedCount = try container.decodeIfPresent(_Value<Int>.self, forKey: .testsFailedCount)?._value
            warningCount = try container.decodeIfPresent(_Value<Int>.self, forKey: .warningCount)?._value
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(analyzerWarningCount, forKey: .analyzerWarningCount)
            try container.encodeIfPresent(errorCount, forKey: .errorCount)
            try container.encodeIfPresent(testsCount, forKey: .testsCount)
            try container.encodeIfPresent(testsFailedCount, forKey: .testsFailedCount)
            try container.encodeIfPresent(warningCount, forKey: .warningCount)
        }
    }
}
