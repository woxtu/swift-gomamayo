import Foundation

public struct Gomamayo: Equatable, Sendable {
  public let ary: Int
  public let degree: Int
}

public struct GomamayoDetectionResult: Equatable, Sendable {
  public let gomamayo: Gomamayo?
  public let tokens: [Token]
}

public class GomamayoDetector {
  public init() {}

  public func detect(string: String) -> GomamayoDetectionResult {
    let tokens = StringTokenizer().tokenize(string: string)

    guard tokens.count > 1 else { return GomamayoDetectionResult(gomamayo: nil, tokens: tokens) }

    var ary = 0
    var degree = 0
    for n in 0 ..< tokens.count - 1 {
      let first = Array(tokens[n].reading)
      let second = Array(tokens[n + 1].reading)

      let matched = (1 ... min(first.count, second.count))
        .reversed()
        .first { first.suffix($0) == second.prefix($0) }
        .map { String(first.suffix($0)) }

      if let matched {
        ary += 1
        degree = max(degree, matched.moraCount)
      }
    }

    if ary > 0 {
      return GomamayoDetectionResult(gomamayo: Gomamayo(ary: ary, degree: degree), tokens: tokens)
    } else {
      return GomamayoDetectionResult(gomamayo: nil, tokens: tokens)
    }
  }
}

extension String {
  var moraCount: Int {
    applyingTransform(.latinToKatakana, reverse: false)?
      .replacingOccurrences(of: "[ッャュョァィゥェォ]", with: "", options: .regularExpression)
      .count ?? 0
  }
}
