@testable import GomamayoDetection
import XCTest

final class GomamayoDetectorTests: XCTestCase {
  func testGomamayoDetection() throws {
    let detector = GomamayoDetector()
    XCTAssertEqual(detector.detect(string: "ゴママヨ").gomamayo, Gomamayo(ary: 1, degree: 1))
  }

  func testNonGomamayoDetection() throws {
    let detector = GomamayoDetector()
    XCTAssertNil(detector.detect(string: "").gomamayo)
    XCTAssertNil(detector.detect(string: "ゴマ").gomamayo)
    XCTAssertNil(detector.detect(string: "オレンジジュース").gomamayo)
  }

  func testMultiAryGomamayoDetection() throws {
    let detector = GomamayoDetector()
    XCTAssertEqual(detector.detect(string: "オレンジレンジ").gomamayo, Gomamayo(ary: 1, degree: 3))
  }

  func testMultiDegreesGomamayoDetection() throws {
    let detector = GomamayoDetector()
    XCTAssertEqual(detector.detect(string: "多項高次ゴママヨ").gomamayo, Gomamayo(ary: 2, degree: 2))
  }
}
