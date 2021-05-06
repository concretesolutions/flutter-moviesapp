//
//  FLMovieDetailView.swift
//  Runner
//
//  Created by Matheus de Vasconcelos on 04/05/21.
//

import Foundation

internal class FLMovieDetailView: NSObject, FlutterPlatformView {

    internal let frame: CGRect
    internal let viewId: Int64

    internal init(_ frame:CGRect, viewId:Int64, args:Any?) {
        self.frame = frame
        self.viewId = viewId
    }

    internal func view() -> UIView {
        return MovieDetailView(frame: frame)
    }
}
