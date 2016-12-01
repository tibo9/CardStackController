func drawWindowHierarchy(afterScreenUpdates afterScreenUpdates: Bool) -> UIImage? {
    guard let window = UIApplication.shared.keyWindow else { return nil }
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, false, 0)
    window.drawHierarchy(in: window.bounds, afterScreenUpdates: afterScreenUpdates)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}

func delay(delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}

extension UIView {

    func pinEdgesToSuperviewEdges() {
        pinLeading(toLeadingOf: superview!)
        pinTop(toTopOf: superview!)
        pinTrailing(toTrailingOf: superview!)
        pinBottom(toBottomOf: superview!)
    }

    func pinLeading(toLeadingOf view: UIView, constant: CGFloat = 0) {
        NSLayoutConstraint(item: view,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: constant).isActive = true
    }

    func pinTrailing(toTrailingOf view: UIView, constant: CGFloat = 0) {
        NSLayoutConstraint(item: view,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: -constant).isActive = true
    }

    func pinTop(toTopOf view: UIView, constant: CGFloat = 0) {
        NSLayoutConstraint(item: view,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: constant).isActive = true
    }

    func pinTop(toBottomOf view: UIView, constant: CGFloat = 0) {
        NSLayoutConstraint(item: view,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: constant).isActive = true
    }

    func pinBottom(toBottomOf view: UIView, constant: CGFloat = 0) {
        NSLayoutConstraint(item: view,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: -constant).isActive = true
    }

    func pinBottom(toTopOf view: UIView, constant: CGFloat = 0) {
        NSLayoutConstraint(item: self,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: -constant).isActive = true
    }

    func setHeight(to constant: CGFloat) {
        NSLayoutConstraint(item: self,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: constant).isActive = true
    }
}
