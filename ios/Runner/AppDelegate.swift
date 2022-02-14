import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
  if (CLLocationManager.locationServicesEnabled()) {
      switch CLLocationManager.authorizationStatus() {
      case .denied, .notDetermined, .restricted:
          self.manager.requestAlwaysAuthorization()
          break
      default:
          break
      }
  }
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
