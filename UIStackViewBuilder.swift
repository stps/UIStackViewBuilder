import UIKit

public extension UIStackView {
    convenience init(
    axis: NSLayoutConstraint.Axis,
    distribution: UIStackView.Distribution = .fill,
    alignment: UIStackView.Alignment = .fill,
    spacing: CGFloat = 0,
    @StackViewBuilder builder: () -> [UIView]) {
        self.init(arrangedSubviews: builder())
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

public protocol UIViewGroup {
    func asArray() -> [UIView]
}

extension UIView: UIViewGroup {
    public func asArray() -> [UIView] { [self] }
    static var emptyGroup: [UIView] { [] }
}

extension Array: UIViewGroup where Element == UIView {
    public func asArray() -> [UIView] { return self }
}

@resultBuilder
public struct StackViewBuilder {
    public static func buildBlock(_ views: UIViewGroup...) -> [UIView] {
        views.flatMap { $0.asArray() }
    }

    public static func buildIf(_ value: UIViewGroup?) -> [UIView] {
        value.flatMap { $0.asArray() } ?? []
    }

    public static func buildEither(first component: [UIViewGroup]) -> [UIView] {
        component.flatMap { $0.asArray() }
    }

    public static func buildEither(second component: [UIViewGroup]) -> [UIView] {
        component.flatMap { $0.asArray() }
    }
}
