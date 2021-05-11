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
    
    DispatchQueue.global(qos: .default).async {
        if call.method == "dataRealmSwiftFetch" {
            

            DispatchQueue.main.sync {
            let crud = CRUDRealm()
            var movies:[Movie] = []
            crud.fetch()
            movies = Array(crud.movies)
            result(movies)
                if movies.isEmpty {
                  DispatchQueue.main.sync {
                    result(FlutterError(code: "Sem Resultados",
                    message: "Insira dados pelo RealmSwift",
                    details: nil))
                  }
               }
            }
        }
           if call.method == "dataRealmSwiftInsert" {
            DispatchQueue.main.sync {
            var movie = Movie()
            movie.title = "Homen Aranha"
            movie.poster_path = ""
            movie.overview = "dfdf df df df d f df df d f d"

            
              let crud = CRUDRealm()
              crud.save(movie)
            result(true)
          }
        }
   }
  }
}
