# WWLogView
一個簡單的Log視窗版 (上傳至Cocoapods)

[![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)](https://developer.apple.com/swift/) [![Version](https://img.shields.io/cocoapods/v/WWLogView.svg?style=flat)](http://cocoapods.org/pods/WWRadioButton) [![Platform](https://img.shields.io/cocoapods/p/WWLogView.svg?style=flat)](http://cocoapods.org/pods/WWRadioButton) [![License](https://img.shields.io/cocoapods/l/WWLogView.svg?style=flat)](http://cocoapods.org/pods/WWRadioButton)

![一個簡單的Log視窗版 (上傳至Cocoapods)](https://raw.githubusercontent.com/William-Weng/WWLogView/master/WWLogView.gif)

# 使用範例

```swift
import UIKit
import WWLogView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        _ = WWLogView.shared
        return true
    }
}

```
```swift
import UIKit
import WWLogView

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showWindow(_ sender: UIButton) {
        let time = Date()
        WWLog(time.description(with: Locale.init(identifier: "zh-TW")))
    }
}
```