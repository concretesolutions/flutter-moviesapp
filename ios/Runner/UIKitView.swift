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
//        let listView = ListMoviesView(numberItens: 3, listMovie: [MovieFake1(),MovieFake2(),MovieFake3()])
//        listView.translatesAutoresizingMaskIntoConstraints = false
//        listView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
//        listView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
//        return listView
        
        let helloWorld = HelloWorldView()
        helloWorld.translatesAutoresizingMaskIntoConstraints = false
        helloWorld.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        helloWorld.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        return helloWorld
    }
}
//
//struct MovieFake1:Movie {
//    var id:Int
//    var title:String
//    var overview:String
//    var poster:String
//    var releaseDate:String
//
//    init() {
//        self.id = 3
//        self.title = "Spider Man"
//        self.overview = "So perhaps, you've generated some fancy text, and you're content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you're wondering how it's even possible to change the font of your text? Is it some sort of hack? Are you copying and pasting an actual font?"
//        self.poster = "ERROR"
//        self.releaseDate = "2010"
//    }
//}
//struct MovieFake2:Movie {
//    var id:Int
//    var title:String
//    var overview:String
//    var poster:String
//    var releaseDate:String
//
//    init() {
//        self.id = 2
//        self.title = "Rambo"
//        self.overview = "So perhaps, you've generated some fancy text, and you're content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you're wondering how it's even possible to change the font of your text? Is it some sort of hack? Are you copying and pasting an actual font?"
//        self.poster = "ERROR"
//        self.releaseDate = "1993"
//    }
//}
//struct MovieFake3:Movie {
//    var id:Int
//    var title:String
//    var overview:String
//    var poster:String
//    var releaseDate:String
//
//    init() {
//        self.id = 3
//        self.title = "Nárnia"
//        self.overview = "So perhaps, you've generated some fancy text, and you're content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you're wondering how it's even possible to change the font of your text? Is it some sort of hack? Are you copying and pasting an actual font?"
//        self.poster = "ERROR"
//        self.releaseDate = "2005"
//    }
//}
