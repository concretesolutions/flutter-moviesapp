import Flutter
import UIKit
import RealmSwift

public class SwiftDataPlugin: NSObject, FlutterPlugin {
    let crud = CRUDRealm()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "data_plugin", binaryMessenger: registrar.messenger())
        let instance = SwiftDataPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        
        //DispatchQueue.global(qos: .default).async{
            
            if call.method == "dataRealmSwiftFetch" {
                let crud = CRUDRealm()
                crud.fetch()
                
                let dict:[[String:Any]] = crud.movies.map{$0.toDict()}
                result(dict)
            }
            if call.method == "dataRealmSwiftInsert" {
                let args = call.arguments as? NSDictionary ?? [:]
                let id = args["id"] as? Int ?? 0
                let title = args["title"] as? String ?? "Error"
                let overview = args["overview"] as? String ?? "Error"
                let path = args["path"] as? String ?? "Error"
                let release_date = args["release_date"] as? String ?? "Error"
          
                let movie = MovieObject()
                movie.id = id
                movie.title = title
                movie.overview = overview
                movie.poster_path = path
                movie.release_date = release_date
                
                
                let crud = CRUDRealm()
                let returnSave = crud.save(movie)
                
                result(NSNumber(value: returnSave))
                
            }
        //}
        
    }
}
