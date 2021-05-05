import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        let viewFactory = FLMovieDetailViewFactory()
        registrar(forPlugin: "moviePlugin")?.register(viewFactory, withId: "<platform-view-type>")
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
