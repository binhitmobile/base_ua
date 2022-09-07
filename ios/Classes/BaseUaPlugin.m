#import "BaseUaPlugin.h"
#if __has_include(<base_ua/base_ua-Swift.h>)
#import <base_ua/base_ua-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "base_ua-Swift.h"
#endif

@implementation BaseUaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBaseUaPlugin registerWithRegistrar:registrar];
}
@end
