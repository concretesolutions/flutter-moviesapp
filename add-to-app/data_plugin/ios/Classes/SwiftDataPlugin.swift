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
    
                var moviesReturn:[String:[String]]  = [String:[String]]()
   
                crud.movies.forEach { movie in
                    moviesReturn.updateValue([movie.poster_path,movie.overview], forKey: movie.title)
                }
                
                print("Dictionary Enviado: \(moviesReturn)")
                
                result(moviesReturn)
                
                
                if crud.movies.isEmpty {
                    
                    result(FlutterError(code: "Sem Resultados",
                                        message: "Insira dados pelo RealmSwift",
                                        details: nil))
                    
                }
                
            }
            if call.method == "dataRealmSwiftInsert" {
                let args = call.arguments as? NSDictionary ?? [:]
                let title = args["title"] as? String ?? "Error"
                let overview = args["overview"] as? String ?? "Error"
                let path = args["path"] as? String ?? "Error"
          
                let movie = MovieObject()
                movie.title = title
                movie.overview = overview
                movie.poster_path = path
                
                
                let crud = CRUDRealm()
                let returnSave = crud.save(movie)
                
                result(NSNumber(value: returnSave))
                
            }
        //}
        
    }
}
