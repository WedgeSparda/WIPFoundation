#if canImport(Foundation)
import Foundation
#endif

extension String: WIPCompatibleValueType {}

public extension WIPContainer where T == String {

    var hasLetters: Bool {
        return type.rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }

    var hasNumbers: Bool {
        return type.rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
    }

    var isAlphabetic: Bool {
        return hasLetters && !hasNumbers
    }

    var isAlphaNumeric: Bool {
        return hasLetters && hasNumbers
    }

    var isNumeric: Bool {
        return !hasLetters && hasNumbers
    }

    #if canImport(Foundation)
    var base64Encoded: String? {
        return type.data(using: .utf8)?.base64EncodedString()
    }
    #endif

    #if canImport(Foundation)
    var base64Decoded: String? {
        guard let data = Data(base64Encoded: type, options: []) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    #endif
}
