import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let alertChannel = FlutterMethodChannel(name: "com.example.native_alert",
                                            binaryMessenger: controller.binaryMessenger)
    
    alertChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "showAlert" {
        if let args = call.arguments as? [String: Any],
           let title = args["title"] as? String,
           let message = args["message"] as? String {
          self.showAlert(title: title, message: message)
          result(nil)
        } else {
          result(FlutterError(code: "INVALID_ARGUMENT", message: "Title or message not provided", details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func showAlert(title: String, message: String) {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

    window?.rootViewController?.present(alert, animated: true, completion: nil)
  }
}

