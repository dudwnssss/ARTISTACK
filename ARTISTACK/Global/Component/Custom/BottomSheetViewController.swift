//
//  BottomSheetViewController.swift
//  ARTISTACK
//
//  Created by 임영준 on 2023/09/14.
//

import UIKit
import FloatingPanel

enum BottomSheetType{
    case volume
    case profileImage
    
    var fractionalHeight: CGFloat {
        switch self {
        case .volume:
            return 352/844
        case .profileImage:
            return 190/844
        }
    }
}


protocol ScrollableViewController where Self: UIViewController {
    var scrollView: UIScrollView {get}
}

final class BottomSheetViewController: FloatingPanelController{
    
    var bottomSheetType : BottomSheetType?

    
    init(type: BottomSheetType, contentViewController: UIViewController){
        self.bottomSheetType = type
        
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
            $0.backgroundColor = Color.white
        }
        
        surfaceView.do {
            $0.grabberHandle.isHidden = false
            $0.grabberHandle.backgroundColor = Color.artistackSystem3.withAlphaComponent(0.5)
            $0.grabberHandleSize = .init(width: 35, height: 3)
            $0.appearance = appearance
        }
        
        backdropView.do {
            $0.dismissalTapGestureRecognizer.isEnabled = true
            let backdropColor = Color.black
            $0.backgroundColor = backdropColor
        }
        
        guard let type = bottomSheetType else {return}
        let layout = TouchBlockIntrinsicPanelLayout(type: type)
        self.layout = layout

        
        delegate = self
    }
}

extension BottomSheetViewController: FloatingPanelControllerDelegate{
    
    func floatingPanelDidMove(_ fpc: FloatingPanelController) {
        let loc = fpc.surfaceLocation
        let minY = fpc.surfaceLocation(for: .full).y
        let maxY = fpc.surfaceLocation(for: .tip).y
        let y =  min(max(loc.y, minY), maxY)
        fpc.surfaceLocation = CGPoint(x: loc.x, y: y)
    }
    
    public func floatingPanelWillEndDragging(_ fpc: FloatingPanelController, withVelocity velocity: CGPoint, targetState: UnsafeMutablePointer<FloatingPanelState>) {
        guard velocity.y > 50 else {return}
        dismiss(animated: true)
    }
}

final class TouchBlockIntrinsicPanelLayout: FloatingPanelBottomLayout {
    init(type: BottomSheetType) {
        bottomSheetType = type
        super.init()
    }
    var bottomSheetType : BottomSheetType?
    override var initialState: FloatingPanelState {.full}
    override var anchors: [FloatingPanelState : FloatingPanelLayoutAnchoring] {
        return [ .full: FloatingPanelLayoutAnchor(fractionalInset: bottomSheetType?.fractionalHeight ?? 0, edge: .bottom, referenceGuide: .safeArea)]
    }
    override func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
        0.8
    }
}
