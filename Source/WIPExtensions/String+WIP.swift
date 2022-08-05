// MIT License
//
// Copyright (c) [2020] [Roberto Pastor Ortiz]
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

extension String: WIPCompatibleValueType {}

// MARK: - All Platforms

public extension WIPContainer where T == String {

    /// String value has any letter
    var hasLetters: Bool {
        return type.rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }

    /// String value has any number
    var hasNumbers: Bool {
        return type.rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
    }

    /// String value ONLY has letters
    var isAlphabetic: Bool {
        return hasLetters && !hasNumbers
    }

    /// String value has letters AND numbers
    var isAlphaNumeric: Bool {
        return hasLetters && hasNumbers
    }

    /// String value ONLY has numbers
    var isNumeric: Bool {
        return !hasLetters && hasNumbers
    }

    /// String representation of the Base64 for the value
    var base64Encoded: String? {
        return type.data(using: .utf8)?.base64EncodedString()
    }

    /// String value of a previous Base64 encoded text
    var base64Decoded: String? {
        guard let data = Data(base64Encoded: type, options: []) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }

    /// URL query encoded copy of the current string.
    var encodedForURLQuery: String? {
        return type.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }

    /// Localized version of the current string, if available. If not, uses the same string.
    /// Uses Main bundle, default table and no replace value if localization is not found.
    var localized: String {
        return localized()
    }

    /// Localized version of the current string.
    ///
    /// - Parameters:
    ///   - bundle: Bundle top look for tableName. Default is Main.
    ///   - tableName: The receiver’s string table to search. If `nil`, will use Localizable.strings
    ///   - value: The value to return if key can’t be found in the table.
    /// - Returns: Localized version of the string
    func localized(bundle: Bundle = .main,
                   table: String? = nil,
                   value: String? = nil) -> String {
        return bundle.localizedString(forKey: type,
                                      value: value,
                                      table: value)
    }

    /// Trimmed copy of the current string.
    var trimmed: String {
        return type.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Date object based on the current string, if it represents a Date.
    ///
    /// - Parameters:
    ///   - format: Expected format for the date string.
    ///   - timeZone: Time zone to be used on the format. By default is the current one.
    /// - Returns: A Date object based on the current string or nil if something went wrong.
    func date(withFormat format: String,
              timeZone: TimeZone = TimeZone.current) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        return dateFormatter.date(from: type)
    }

    /// A `NSRange` for all the length of the current string.
    var nsrange: NSRange {
        return NSRange(location: 0, length: type.utf16.count)
    }

    /// Copy of current string replacing occurrences of the provided RagExp patter with the replacement text
    ///
    /// - Parameters:
    ///   - pattern: RegExp pattern to look after
    ///   - replacement: Replacement text for the matched occurrence
    ///   - options: RegExp matching options
    /// - Returns: Copy of current string with replaced text. If no cahnge applied, return the same string value.
    func replace(pattern: String,
                 with replacement: String,
                 options: NSRegularExpression.Options) -> String {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: options)
            return regex.stringByReplacingMatches(in: type, options: [], range: self.nsrange, withTemplate: replacement)
        } catch {
            return type
        }
    }

    /// Basic match of the current string with email regular expression.
    ///
    /// - Parameters: stricted: if true it doesn't let email like user+1@mail.com.
    func isValidEmail(stricted: Bool = false) -> Bool {
        let regExp: String = {
            if stricted {
                return "^[A-Z0-9a-z\\._%-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
            } else {
                return "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
            }
        }()

        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", regExp)
        return emailPredicate.evaluate(with: type)
    }

    /// Basic match of the current string with HTTP URL regular expression.
    var isValidURL: Bool {
        let regExp = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExp)
        return predicate.evaluate(with: type)
    }
}
