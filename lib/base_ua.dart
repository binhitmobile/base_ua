import 'base_ua_platform_interface.dart';

class BaseUa {
  Future<String?> getPlatformVersion() {
    return BaseUaPlatform.instance.getPlatformVersion();
  }

  Future<String?> getBaseUserAgent() {
    return BaseUaPlatform.instance.getUserAgent();
  }
}
