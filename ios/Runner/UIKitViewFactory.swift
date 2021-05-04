//
//  UIKitViewFactory.swift
//  Runner
//
//  Created by mateus.santos on 23/04/21.
//

import Foundation


@available(iOS 13.0, *)
public class UIKitViewFactory: NSObject, FlutterPlatformViewFactory {
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return UIKitView(frame, viewId: viewId, args: args)
    }
}
