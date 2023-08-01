import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:websocket/core/constants.dart';
import 'package:websocket/presenter/bloc/location_bloc.dart';
import 'package:flutter_map/flutter_map.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  MapController controller = MapController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LocationBloc>(context).add(ConnectWebSocket());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<LocationBloc>(context).add(ConnectWebSocket());
          },
          child: const Icon(Icons.not_listed_location_sharp),
        ),
        body: BlocConsumer<LocationBloc, LocationState>(
          builder: (context, state) {
            String message = '';
            if (state is LocationInitial) {
              message = 'loading...';
            } else if (state is LocationReceived) {
              message =
                  "lat : ${state.locations.latitude} | lng : ${state.locations.longitude}";
            } else if (state is LocationError) {
              message = state.errorMessage;
            } else {
              message = 'Unknown state';
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    message,
                    style: const TextStyle(fontSize: 20),
                  )),
                ),
                Expanded(
                  child: FlutterMap(
                    mapController: controller,
                    options: MapOptions(
                      minZoom: 5,
                      maxZoom: 18,
                      zoom: 13,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: AppConstants.mapBoxTemplate,
                        additionalOptions: const {
                          'accessToken': AppConstants.mapBoxAccessToken,
                        },
                      ),
                      MarkerLayer(
                        markers: [
                          if (state is LocationReceived)
                            Marker(
                                width: 50,
                                height: 50,
                                point: state.locations,
                                builder: (ctx) => const Icon(
                                      Icons.location_pin,
                                      color: Colors.red,
                                      size: 50,
                                    )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          listener: (context, state) {
            if (state is LocationReceived) {
              controller.move(state.locations, 13);
            }
          },
        ));
  }
}
