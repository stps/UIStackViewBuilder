# UIStackViewBuilder

A simple extension on UIStackView using result builders, for a concise way to compose stack views with UIKit. Result builders allow declarative syntax similar to Stack in SwiftUI, while also allowing control flow like if/else and switch.

## Example

```
let stackView = UIStackView(axis: .vertical, distribution: .fillEqually) {
    blueView
    redView

    UIStackView(axis: .horizontal) {
        if showGreenView {
            greenView
        }
        purpleView
    }
}
```