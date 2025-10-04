import Flutter
import UIKit

public class ScreenCornerRadiusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "screen_corner_radius", binaryMessenger: registrar.messenger())
    let instance = ScreenCornerRadiusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getScreenCornerRadius":
      result(UIScreen.main.displayCornerRadius)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

extension UIScreen {
    public var displayCornerRadius: [String: CGFloat]? {
        if #unavailable(iOS 11.0) {
            return nil
        }

        guard let cornerRadius = self.value(forKey:"_displayCornerRadius") as? CGFloat else {
            return nil
        }

        return [
          "topLeft": cornerRadius,
          "topRight": cornerRadius,
          "bottomLeft": cornerRadius,
          "bottomRight": cornerRadius,
        ]
     }
}
