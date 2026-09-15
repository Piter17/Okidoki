import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)
    super.awakeFromNib()
  }
}

// class CustomTitleBarButton: NSObject {  
//     func addButton(to window: NSWindow) {  
//         print("adding button")
//         // Create a button  
//         let customButton: NSButton = NSButton(title: "→", target: self, action: #selector(buttonClicked))  

//         customButton.target = self
//         customButton.setButtonType(.momentaryPushIn)  
//         customButton.bezelStyle = .texturedRounded  
//         customButton.controlSize = .regular  
//         customButton.frame = NSRect(x: 0, y: 0, width: 22, height: 22)  
 
//         // Create an accessory view controller for the title bar  
//         let accessoryVC = NSTitlebarAccessoryViewController()  
//         accessoryVC.view = customButton  
//         accessoryVC.layoutAttribute = .left  // Position on the right side  
 
//         // Add the accessory to the window  
//         window.addTitlebarAccessoryViewController(accessoryVC)  
//     }  
 
//     @objc func buttonClicked() {  
//         print("Custom button clicked!")  
//         confirmAbletonIsReady(question: "asdf", text: "qwer")
//         // Add your action here (e.g., run a script, open a panel)  
//     }  

//     func confirmAbletonIsReady(question: String, text: String) -> Bool {
//         let alert = NSAlert()
//         alert.messageText = question
//         alert.informativeText = text
//         alert.alertStyle = NSAlert.Style.warning
//         alert.addButton(withTitle: "OK")
//         alert.addButton(withTitle: "Cancel")
//         return alert.runModal() == NSApplication.ModalResponse.alertFirstButtonReturn
//     }
// }  

