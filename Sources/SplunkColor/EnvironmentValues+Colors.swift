import SplunkCore
import SwiftUI

extension EnvironmentValues {
  public struct Colors {
    @usableFromInline struct Key {
      @usableFromInline static let accentColor = "AccentColorKey"
      @usableFromInline static let foregroundColor = "ForegroundColorKey"
      @usableFromInline static let foregroundStyle = "ForegroundStyleKey"
      @usableFromInline static let tintColor = "TintColorKey"
    }

    @usableFromInline
    let env: EnvironmentValues

    @usableFromInline
    init(_ env: EnvironmentValues) {
      self.env = env
    }

    /// Also reachable via `Color.accentColor`
    @inlinable public var accentColor: Color? {
      get { env.value(of: Key.accentColor) }
    }

    @inlinable public var foregroundColor: Color? {
      get { env.value(of: Key.foregroundColor) }
    }

    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    @inlinable public var foregroundStyle: AnyShapeStyle? {
      get { env.value(of: Key.foregroundStyle) }
    }

    /// Also reachable via `Color.tint`
    @inlinable public var tint: Color? {
      get { env.value(of: Key.tintColor) }
    }
  }

  /// Internal color values
  public var colors: Colors {
    .init(self)
  }
}
