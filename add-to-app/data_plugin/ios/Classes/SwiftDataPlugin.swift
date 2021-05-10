import Flutter
import UIKit
import RealmSwift

public class SwiftDataPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "data_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftDataPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    DispatchQueue.global(qos: .default).async {
        if call.method == "dataRealmSwiftFetch" {
          let args = call.arguments as! NSDictionary
          let path = args["path"] as! String
          var endOperation:Bool = false
          var movies = []


      }
       if call.method == "dataRealmSwiftUpdate" {
          let args = call.arguments as! NSDictionary
          let path = args["path"] as! String
          var endOperation:Bool = false
          var movies = []


      }
       if call.method == "dataRealmSwiftDrop" {
          let args = call.arguments as! NSDictionary
          let path = args["path"] as! String
          var endOperation:Bool = false
          var movies = []


      }
       if call.method == "dataRealmSwiftInsert" {
          let args = call.arguments as! NSDictionary
          let path = args["path"] as! String
          var endOperation:Bool = false
          var movies = []

      
      }
  }
}
