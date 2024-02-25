import Foundation

public struct Token: Equatable, Sendable {
  public let surface: String
  public let reading: String
}

public class StringTokenizer {
  public init() {}

  public func tokenize(string: String) -> [Token] {
    let tokenizer = CFStringTokenizerCreate(
      nil,
      string as CFString,
      CFRange(location: 0, length: string.count),
      kCFStringTokenizerUnitWordBoundary,
      Locale(identifier: "ja-JP") as CFLocale
    )

    var tokens = [Token]()
    var currentToken = CFStringTokenizerGoToTokenAtIndex(tokenizer, 0)
    while currentToken != [] {
      if let surface = CFStringCreateWithSubstring(nil, string as CFString, CFStringTokenizerGetCurrentTokenRange(tokenizer)) as? String,
         let latin = CFStringTokenizerCopyCurrentTokenAttribute(tokenizer, kCFStringTokenizerAttributeLatinTranscription) as? String
      {
        tokens.append(Token(surface: surface, reading: latin))
      }

      currentToken = CFStringTokenizerAdvanceToNextToken(tokenizer)
    }

    return tokens
  }
}
