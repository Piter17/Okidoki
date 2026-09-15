import Cocoa

class TitlebarButtonViewController: NSTitlebarAccessoryViewController {
    public var button: NSButton?
    public var buttonText: String
    var onTaped: (() -> Void)
    
    init(buttonText: String, onTaped: @escaping (() -> Void)) {
        self.onTaped = onTaped
        self.buttonText = buttonText
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
         
    override func loadView() {
        button = NSButton(title: buttonText, target: self, action: #selector(myButtonPressed))
        button!.bezelStyle = .texturedRounded
             
        self.layoutAttribute = .left
        self.view = button!
    }

    @objc func myButtonPressed() {
        onTaped()
    }
}