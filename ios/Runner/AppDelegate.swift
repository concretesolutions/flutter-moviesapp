import UIKit
import Flutter

@available(iOS 13.0, *)
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let viewFactory = UIKitViewFactory()
    registrar(forPlugin: "Kitty")?.register(viewFactory, 
    withId: "<platform-view-type>")
        
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
