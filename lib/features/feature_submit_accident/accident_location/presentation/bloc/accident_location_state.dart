part of 'accident_location_cubit.dart';

class AccidentLocationState {
  LocationPermissionStatus locationPermissionStatus;

  AccidentLocationState({required this.locationPermissionStatus});

  AccidentLocationState copyWith({
    LocationPermissionStatus? newLocationPermissionStatus,
  }) {
    return AccidentLocationState(
        locationPermissionStatus:
            newLocationPermissionStatus ?? locationPermissionStatus);
  }
}
