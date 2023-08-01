import 'package:bloc/bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:websocket/domain/usecases/location_usecase.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  WebSocketLocationUseCase locationUseCase;

  LocationBloc(this.locationUseCase) : super(LocationInitial()) {
    on<ConnectWebSocket>((event, emit) async {
      try {
        await for (var data in locationUseCase.getLocationsStream()) {
          emit(LocationReceived(data));
        }
      } catch (e) {
        emit(LocationError('Error connecting to WebSocket: $e'));
      }
    });
  }
}
