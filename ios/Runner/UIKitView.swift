//
//  UIKitView.swift
//  Runner
//
//  Created by mateus.santos on 23/04/21.
//

import Foundation

@available(iOS 13.0, *)
public class UIKitView: NSObject, FlutterPlatformView {

    let frame: CGRect
    let viewId: Int64
    
    init(_ frame:CGRect, viewId:Int64, args:Any?) {
        self.frame = frame
        self.viewId = viewId
    }
    
    public func view() -> UIView {
        let movieDetail = MovieDetailView(MovieFake1())
        movieDetail.translatesAutoresizingMaskIntoConstraints = false
        movieDetail.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        movieDetail.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        return movieDetail
    }
}


struct MovieFake1:Movie {
    var id:Int
    var title:String
    var overview:String
    var poster:String
    var releaseDate:String

    init() {
        self.id = 3
        self.title = "Spider Man"
        self.overview = "So perhaps, you've generated some fancy text, and you're content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you're wondering how it's even possible to change the font of your text? Is it some sort of hack? Are you copying and pasting an actual font?"
        self.poster = "ERROR"
        self.releaseDate = "2010"
    }
}
