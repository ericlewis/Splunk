import SwiftUI

extension EnvironmentValues {
  /// Find arbitrary environment values with a key & type.
  public func value<T>(of key: String, as: T.Type = T.self) -> T? {
    let desiredKey = "TypedElement<EnvironmentPropertyKey<\(key)>>"
    guard let environment = Mirror(reflecting: self).descendant("_plist", "elements", "some") else { return nil }
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
