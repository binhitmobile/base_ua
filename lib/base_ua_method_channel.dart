import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'base_ua_platform_interface.dart';

/// An implementation of [BaseUaPlatform] that uses method channels.
class MethodChannelBaseUa extends BaseUaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('base_ua');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getUserAgent() async {
    final userAgent = await methodChannel.invokeMethod<String>('getUserAgent');
    return userAgent ?? "";
  }
}
