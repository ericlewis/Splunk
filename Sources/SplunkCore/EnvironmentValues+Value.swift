import SwiftUI
import OSLog

extension EnvironmentValues {
  func findEnvironment() -> Any? {
    if #available(iOS 15, watchOS 8, tvOS 15, macOS 12, *) {
      return Mirror(reflecting: self).descendant("_plist", "elements", "some")
    } else {
      return Mirror(reflecting: self).descendant("plist", "elements", "some")
    }
  }
  /// Find arbitrary environment values with a key & type.
  public func value<T>(of key: String, as: T.Type = T.self) -> T? {
    let logger = Logger(subsystem: "com.splunk", category: key)
    let desiredKey = "TypedElement<EnvironmentPropertyKey<\(key)>>"
    guard let environment = findEnvironment() else {
      #if DEBUG
      logger.error("could not find environment.")
      #endif
      return nil
    }
    func visit(_ node: Any) -> T? {
      let currentKey = String(describing: type(of: node))
      let mirror = Mirror(reflecting: node)
      if currentKey == desiredKey {
        if let value = mirror.descendant("value", "some") as? T {
          return value
        } else if let value = mirror.descendant("value") as? T {
          return value
        }
        return nil
      }
      guard let nextNode = mirror.superclassMirror?.descendant("after", "some") else {
        return nil
      }
      return visit(nextNode)
    }
    return visit(environment)
  }
}
