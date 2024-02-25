import Foundation
import GomamayoDetection

guard CommandLine.arguments.count > 1 else {
  print("""
  OVERVIEW: Gomamayo detection

  USAGE: gomamayo <input>
  """)

  exit(EXIT_SUCCESS)
}

let detector = GomamayoDetector()
let input = CommandLine.arguments[1]
if let gomamayo = detector.detect(string: input).gomamayo {
  print("\(gomamayo.ary) ary \(gomamayo.degree) degree(s) gomamayo is found")
} else {
  print("gomamayo is not found")
}
