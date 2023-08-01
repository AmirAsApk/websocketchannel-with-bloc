import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:latlong2/latlong.dart';
import 'package:web_socket_channel/io.dart';
import 'package:websocket/core/constants.dart';

abstract class LocationUseCase {
  Stream<LatLng> getLocationsStream();
}

class WebSocketLocationUseCase implements LocationUseCase {
  @override
  Stream<LatLng> getLocationsStream() {
    WebSocketChannel webSocketChannel =
        IOWebSocketChannel.connect(AppConstants.webSocketUrl);
    return webSocketChannel.stream.map((data) {
      List<String> latLngData = data.toString().split(',');
      LatLng latLng =
          LatLng(double.parse(latLngData[0]), double.parse(latLngData[1]));
      if (kDebugMode) {
        print(latLng.toJson());
      }
      return latLng;
    });
  }
}
