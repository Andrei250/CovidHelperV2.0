// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:async';

import 'package:flutter/services.dart';

class PlacePlugin {
  static const MethodChannel _channel =
      const MethodChannel('place_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  //init google API key
  //we can restrict api keys for this app only
  static void initialize(String apiKey) async {
    await _channel.invokeMethod("initialize", <String, dynamic> {
      'apikey' : apiKey
    });
  }

  static Future<List<Place>> search(String keyword) async {
    var result = await _channel.invokeMethod("search", <String, dynamic>{
      'keyword' : keyword
    });

    if (result != null) {
      return Place.fromNative(result);
    }
  }
}
