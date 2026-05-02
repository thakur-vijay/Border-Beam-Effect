# BorderBeamEffect ✨

A lightweight SwiftUI modifier that creates a **smooth, animated beam
effect** around view borders using gradients and masking.

Perfect for highlighting UI elements with a modern, dynamic glow.

------------------------------------------------------------------------

## ✨ Why BorderBeamEffect?

BorderBeamEffect provides a **clean and reusable SwiftUI API** to add
animated borders without complex drawing code.

-   ⚡ Plug & play modifier
-   🎨 Gradient beam animation
-   🌫 Customizable blur for soft glow
-   🔄 Smooth rotation using KeyframeAnimator
-   📱 Built for SwiftUI (iOS 17+)
-   🧩 Minimal and flexible API

------------------------------------------------------------------------

## 📱 Demo

(Add your demo GIF/image here)

------------------------------------------------------------------------

## 🚀 Installation

### Swift Package Manager

To integrate `BorderBeamEffect`, add:

``` swift
dependencies: [
    .package(url: "https://github.com/thakur-vijay/BorderBeamEffect.git", from: "1.0.0")
]
```

Then add to your target:

``` swift
.target(
    name: "YourTarget",
    dependencies: ["BorderBeamEffect"]
)
```

Or in Xcode:

    File → Add Package Dependencies…

Repository URL:

    https://github.com/thakur-vijay/BorderBeamEffect.git

------------------------------------------------------------------------

## 📦 Import

``` swift
import BorderBeamEffect
```

------------------------------------------------------------------------

## 🛠 Requirements

-   iOS 17.0+
-   SwiftUI

------------------------------------------------------------------------

## 💡 Usage

``` swift
import SwiftUI
import BorderBeamEffect

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .padding()
            .borderBeamEffect(
                border: .white,
                beam: [.blue, .purple],
                beamBlur: 8,
                cornerRadius: 12
            )
    }
}
```

------------------------------------------------------------------------

## ⚙️ Configuration Options

  Parameter              Description
  ---------------------- -----------------------------
  `border`               Base border color
  `beam`                 Gradient colors for beam
  `beamBlur`             Blur radius for glow effect
  `cornerRadius`         Corner radius of border
  `isEnabled`            Enable/disable animation
  `isFadeBorderHidden`   Hide base border

------------------------------------------------------------------------

## 🧠 How It Works

-   Uses SwiftUI `KeyframeAnimator` for smooth animation
-   Applies rotating `AngularGradient` for border highlight
-   Combines multiple masks and blur effects
-   Creates a glowing animated beam illusion

------------------------------------------------------------------------

## 🎯 Best Practices

-   Use for highlighting important UI elements
-   Works best with moderate blur values
-   Avoid overusing in dense layouts

------------------------------------------------------------------------

## 📄 License

MIT License

## ⭐ Support

If you find this project useful:

-   ⭐ Star the repository
-   🚀 Share it with other developers
