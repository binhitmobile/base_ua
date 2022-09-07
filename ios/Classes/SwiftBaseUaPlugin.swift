import Flutter
import UIKit

public class SwiftBaseUaPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "base_ua", binaryMessenger: registrar.messenger())
        let instance = SwiftBaseUaPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if(call.method == "getPlatformVersion") {
            result("iOS " + UIDevice.current.systemVersion)
        }else if(call.method == "getUserAgent"){
            guard let ua = self.getUAInfo() else {
                                result("")
                                return;
                            };
                            result(ua)
            result(ua)
        }else{
            result("")
        }
    }
    func getUAInfo() -> String? {
        let systemName = UIDevice.current.systemName;
        let systemVersion = UIDevice.current.systemVersion;
        let modelName = UIDevice.current.model;
        var systemInfo = utsname()
        uname(&systemInfo)
        let releaseInfo = Mirror(reflecting: systemInfo.release)
        let darwinVersion = releaseInfo.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8,
                  value != 0 else {
                      return identifier
                  }
            
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let realModelName = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8,
                  value != 0 else {
                      return identifier
                  }
            
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        guard
            let bundle = Bundle(identifier: "com.apple.CFNetwork"),
            let versionAny = bundle.infoDictionary?[kCFBundleVersionKey as String],
            let version = versionAny as? String
        else { return "CFNetwork/1.0.0" }
        return "CFNetwork/"+version+" "+"Darwin/"+darwinVersion+" "+"("+modelName+"/"+realModelName+" "+systemName+"/"+systemVersion+")"
    }
}
