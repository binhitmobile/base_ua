import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'base_ua_method_channel.dart';

abstract class BaseUaPlatform extends PlatformInterface {
  /// Constructs a BaseUaPlatform.
  BaseUaPlatform() : super(token: _token);

  static final Object _token = Object();

  static BaseUaPlatform _instance = MethodChannelBaseUa();

  /// The default instance of [BaseUaPlatform] to use.
  ///
  /// Defaults to [MethodChannelBaseUa].
  static BaseUaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BaseUaPlatform] when
  /// they register themselves.
  static set instance(BaseUaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getUserAgent(){
    throw UnimplementedError('getUserAgent() has not been implemented.');
  }
}
