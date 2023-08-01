import 'package:get_it/get_it.dart';
import 'package:websocket/domain/usecases/location_usecase.dart';
import 'package:websocket/presenter/bloc/location_bloc.dart';

GetIt locator = GetIt.instance;

setupLocation() async {
  locator
      .registerSingleton<WebSocketLocationUseCase>(WebSocketLocationUseCase());

  locator.registerSingleton<LocationBloc>(LocationBloc(locator()));
}
