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
                if let isEnabled = call.arguments as? Bool {
                    setBackEnabled(isEnabled: isEnabled)
                }
                result(nil)
            case "setContinueEnabled":
                if let isEnabled = call.arguments as? Bool {
                    setContinueEnabled(isEnabled: isEnabled)
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

        if let backController = FlutterTitlebarPlugin.backController,
           !window.titlebarAccessoryViewControllers.contains(where: { $0 === backController }) {
            window.addTitlebarAccessoryViewController(backController)
        }
        if let continueController = FlutterTitlebarPlugin.continueController,
           !window.titlebarAccessoryViewControllers.contains(where: { $0 === continueController }) {
            window.addTitlebarAccessoryViewController(continueController)
        }
    }

    private func setBackEnabled(isEnabled: Bool) {
        FlutterTitlebarPlugin.backController?.button?.isEnabled = isEnabled
    }
    private func setContinueEnabled(isEnabled: Bool) {
        FlutterTitlebarPlugin.continueController?.button?.isEnabled = isEnabled
    }
}
