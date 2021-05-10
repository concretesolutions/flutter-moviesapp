//
//  FLMovieDetailViewFactory.swift
//  Runner
//
//  Created by Matheus de Vasconcelos on 04/05/21.
//

import Foundation

internal class FLMovieDetailViewFactory: NSObject, FlutterPlatformViewFactory {

    internal func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return FLMovieDetailView(frame, viewId: viewId, args: args)
    }

    internal func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterJSONMessageCodec()
    }

}
