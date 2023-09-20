//
//  BottomSheetViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/14.
//

import UIKit
import FloatingPanel

protocol ScrollableViewController where Self: UIViewController {
    var scrollView: UIScrollView {get}
}

final class BottomSheetViewController: FloatingPanelController{
    
    private let isTouchPassable: Bool
    
    init(isTouchPassable: Bool, contentViewController: UIViewController){
        self.isTouchPassable = isTouchPassable
        
        super.init(delegate: nil)
        
        setupView(contentViewController: contentViewController)
        
    }
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(contentViewController: UIViewController){
        set(contentViewController: contentViewController)
//        track(scrollView: contentViewController.scrollView)
        
        let appearance = SurfaceAppearance().then{
            $0.cornerRadius = 5
            $0.backgroundColor = .white
        }
        
        surfaceView.do {
            $0.grabberHandle.isHidden = false
            $0.grabberHandle.backgroundColor = .artistackSystem3?.withAlphaComponent(0.5)
            $0.grabberHandleSize = .init(width: 35, height: 3)
            $0.appearance = appearance
        }
        
        backdropView.do {
            $0.dismissalTapGestureRecognizer.isEnabled = !isTouchPassable
            let backdropColor = isTouchPassable ? UIColor.clear : .black
            $0.backgroundColor = backdropColor
        }
        
        let layout = isTouchPassable ? TouchPassIntrinsicPanelLayout() : TouchBlockIntrinsicPanelLayout()
        self.layout = layout

        
        delegate = self
    }
}

extension BottomSheetViewController: FloatingPanelControllerDelegate{
    
    func floatingPanelDidMove(_ fpc: FloatingPanelController) {
        let loc = fpc.surfaceLocation
        let minY = fpc.surfaceLocation(for: .full).y
        let maxY = fpc.surfaceLocation(for: .tip).y
        let y = isTouchPassable ? max(min(loc.y, minY), maxY) : min(max(loc.y, minY), maxY)
        fpc.surfaceLocation = CGPoint(x: loc.x, y: y)
    }
    
    public func floatingPanelWillEndDragging(_ fpc: FloatingPanelController, withVelocity velocity: CGPoint, targetState: UnsafeMutablePointer<FloatingPanelState>) {
        guard velocity.y > 50 else {return}
        dismiss(animated: true)
    }
}

final class TouchPassIntrinsicPanelLayout: FloatingPanelBottomLayout {
    override var initialState: FloatingPanelState {.tip}
    override var anchors: [FloatingPanelState : FloatingPanelLayoutAnchoring] {
        return [
            .tip: FloatingPanelIntrinsicLayoutAnchor(fractionalOffset: 0, referenceGuide: .safeArea)
        ]
    }
}


final class TouchBlockIntrinsicPanelLayout: FloatingPanelBottomLayout {
    override var initialState: FloatingPanelState {.full}
    override var anchors: [FloatingPanelState : FloatingPanelLayoutAnchoring] {
        return [ .full: FloatingPanelLayoutAnchor(fractionalInset: 190/844, edge: .bottom, referenceGuide: .safeArea)]
    }
    override func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
        0.8
    }
}

//class MyFloatingPanelLayout: FloatingPanelLayout {
//
//    var anchors: [FloatingPanelState : FloatingPanelLayoutAnchoring] {
//        return [.half: FloatingPanelIntrinsicLayoutAnchor(fractionalOffset: <#T##CGFloat#>)]
//    }
//
//
//
//    var position: FloatingPanelPosition {
//        return .bottom
//    }
//
//    var initialState: FloatingPanelState {
//        return .half
//    }
//
//
//    func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
//        0.8
//    }
//}
