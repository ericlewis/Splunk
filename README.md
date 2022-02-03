# Splunk
[![](https://img.shields.io/badge/Swift_Package_Manager-compatible-ed702d.svg?style=flat)](https://github.com/apple/swift-package-manager)

Go diving in SwiftUI's [EnvironmentValues](https://developer.apple.com/documentation/swiftui/environmentvalues) or use common values exposed for you.

## Read First
This uses [reflection](https://developer.apple.com/documentation/swift/mirror) under the hood. That means this is:
- Probably incredibly unstable
- Will almost definitely change
- May behave incorrectly on different versions of iOS

Currently, this has been tested on iOS 15.0 -> iOS 15.2.

## Examples
Splunk can be used to locate *any* values in Environment, there are a few ways to do that:

### Basic Usage
```swift
import Splunk
import SwiftUI

struct ContentView: View {
  @Environment(\.self)
  private var env
  
  var body: some View {
    Text("Hello!")
      .foregroundColor(env.value(of: "ForegroundColorKey", as: Color.self))
  }
}
```

### Colors Extension
```swift
import Splunk
import SwiftUI

struct ContentView: View {
  @Environment(\.colors.foregroundColor)
  private var foregroundColor
  
  var body: some View {
    Text("Hello!")
      .foregroundColor(foregroundColor)
  }
}
```

### Advanced Usage
```swift
import Splunk
import SwiftUI

struct ContentView: View {
  var body: some View {
    InnerView()
      .buttonBorderShape(.capsule)
  }
}

struct InnerView: View {
  @Environment(\.buttonBorderShape)
  private var buttonBorderShape
  
  var body: some View {
    if let shape = buttonBorderShape, shape == .capsule {
      Text("Never Capsule!")
    } else {
      Button("Okay, capsule is cool.") {
        // do something amazing.
      }
    }
  }
}

extension EnvironmentValues {
  var buttonBorderShape: ButtonBorderShape? {
    get { value(of: "ButtonBorderShapeKey", as: ButtonBorderShape.self) }
  }
}

```

## License
Splunk is released under the MIT license. See [LICENSE](LICENSE.md) for details.
