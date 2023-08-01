part of 'location_bloc.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationReceived extends LocationState {
  final LatLng locations;

  LocationReceived(this.locations);
}

class LocationError extends LocationState {
  final String errorMessage;

  LocationError(this.errorMessage);
}
