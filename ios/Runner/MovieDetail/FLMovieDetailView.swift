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
    internal let args: Any?

    internal init(_ frame:CGRect, viewId:Int64, args:Any?) {
        self.frame = frame
        self.viewId = viewId
        self.args = args
    }

    internal func view() -> UIView {
        let view = MovieDetailView(frame: frame)
        if let dict = args as? Dictionary<String, Any>, let movie = Movie(dict: dict) {
            view.bind(movie: movie)
        }
        return view
    }
}
