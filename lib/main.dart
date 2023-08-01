import 'package:flutter/material.dart';
import 'package:websocket/domain/usecases/location_usecase.dart';
import 'package:websocket/locator.dart';
import 'package:websocket/presenter/bloc/location_bloc.dart';
import 'package:websocket/presenter/pages/map_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocation();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => locator<LocationBloc>(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MapView(),
    );
  }
}
