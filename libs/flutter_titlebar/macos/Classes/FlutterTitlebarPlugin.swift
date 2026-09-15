import Cocoa
import FlutterMacOS

public class FlutterTitlebarPlugin: NSObject, FlutterPlugin {
  private static var channel: FlutterMethodChannel?
  private static var backController: TitlebarButtonViewController?
  private static var continueController: TitlebarButtonViewController?

  public static func register(with registrar: FlutterPluginRegistrar) {
    FlutterTitlebarPlugin.channel = FlutterMethodChannel(name: "flutter_titlebar", binaryMessenger: registrar.messenger)
    let instance = FlutterTitlebarPlugin()
    registrar.addMethodCallDelegate(instance, channel: FlutterTitlebarPlugin.channel!)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch(call.method)
        {
            case "addButtons":
                addButtons()
                result(nil)
            case "setBackEnabled":
                if let args = call.arguments as? [Any], args.count > 0 {
                    if let isEnabled = args[0] as? Bool {
                        setBackEnabled(isEnabled: isEnabled)
                    }
                }
                result(nil)
            case "setContinueEnabled":
                if let args = call.arguments as? [Any], args.count > 0 {
                    if let isEnabled = args[0] as? Bool {
                        setContinueEnabled(isEnabled: isEnabled)
                    }
                }
                result(nil)
            default:
                result(FlutterMethodNotImplemented)
        }
    }

    private func addButtons() {
        guard let window = NSApplication.shared.windows.first else { return }
        if FlutterTitlebarPlugin.backController == nil
        {
            FlutterTitlebarPlugin.backController = TitlebarButtonViewController(
                buttonText: "←",
                onTaped: {
                    FlutterTitlebarPlugin.channel!.invokeMethod("backButtonPressed", arguments: nil)
                }
            )
        }

        if FlutterTitlebarPlugin.continueController == nil
        {
            FlutterTitlebarPlugin.continueController = TitlebarButtonViewController(
                buttonText: "→",
                onTaped: {
                    FlutterTitlebarPlugin.channel!.invokeMethod("continueButtonPressed", arguments: nil)
                }
            )
        }

        window.addTitlebarAccessoryViewController(FlutterTitlebarPlugin.backController!)
        window.addTitlebarAccessoryViewController(FlutterTitlebarPlugin.continueController!)
    }

    private func setBackEnabled(isEnabled: Bool) {
        FlutterTitlebarPlugin.backController!.button?.isEnabled = isEnabled
    }
    private func setContinueEnabled(isEnabled: Bool) {
        FlutterTitlebarPlugin.continueController!.button?.isEnabled = isEnabled
    }
}
