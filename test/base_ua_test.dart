import 'package:flutter_test/flutter_test.dart';
import 'package:base_ua/base_ua.dart';
import 'package:base_ua/base_ua_platform_interface.dart';
import 'package:base_ua/base_ua_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBaseUaPlatform
    with MockPlatformInterfaceMixin
    implements BaseUaPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getUserAgent() => Future.value("User-Agent");
}

void main() {
  final BaseUaPlatform initialPlatform = BaseUaPlatform.instance;

  test('$MethodChannelBaseUa is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBaseUa>());
  });

  test('getPlatformVersion', () async {
    BaseUa baseUaPlugin = BaseUa();
    MockBaseUaPlatform fakePlatform = MockBaseUaPlatform();
    BaseUaPlatform.instance = fakePlatform;

    expect(await baseUaPlugin.getPlatformVersion(), '42');
  });
}
