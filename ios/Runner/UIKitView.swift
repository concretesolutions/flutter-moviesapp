//
//  UIKitView.swift
//  Runner
//
//  Created by mateus.santos on 23/04/21.
//

import Foundation

public class UIKitView: NSObject, FlutterPlatformView {

    let frame: CGRect
    let viewId: Int64
    
    init(_ frame:CGRect, viewId:Int64, args:Any?) {
        self.frame = frame
        self.viewId = viewId
    }
    
    public func view() -> UIView {
        return UISlider(frame: frame)
    }
}
