# base_ua

Flutter get base User-Agent

## Release Date: 07/09/2022


## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  base_ua: <latest_version>
    git:
      url: https://github.com/binhitmobile/base_ua.git
      ref: master
```

In your library add the following import:

```dart
import 'package:base_ua/base_ua.dart';
```

Using


```dart
   
Future<void> getUserAgent() async {
  String platformVersion;
  try {
    String userAgent = await _baseUaPlugin.getBaseUserAgent() ?? "";
    debugPrint("UA: $userAgent");
  } on PlatformException {
    platformVersion = 'Failed to get platform version.';
  }
}
```