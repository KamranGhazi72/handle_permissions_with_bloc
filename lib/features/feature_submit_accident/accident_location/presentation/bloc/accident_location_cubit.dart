import 'package:bloc/bloc.dart';
import 'package:location/location.dart';

part 'accident_location_state.dart';

part 'location_permission_status.dart';

class AccidentLocationCubit extends Cubit<AccidentLocationState> {
  AccidentLocationCubit()
      : super(
          AccidentLocationState(
            locationPermissionStatus: LocationPermissionInitialState(),
          ),
        );

  Future<void> checkLocationPermission() async {
    bool serviceEnabled;
    PermissionStatus permissionStatus;

    Location location = Location();
    serviceEnabled = await location.requestService();

    if (serviceEnabled) {
      permissionStatus = await location.hasPermission();
      if (permissionStatus == PermissionStatus.granted ||
          permissionStatus == PermissionStatus.grantedLimited) {
        emit(
          state.copyWith(
              newLocationPermissionStatus: LocationPermissionGranted()),
        );
      } else {
        permissionStatus = await location.requestPermission();
        if (permissionStatus == PermissionStatus.granted ||
            permissionStatus == PermissionStatus.grantedLimited) {
          emit(
            state.copyWith(
                newLocationPermissionStatus: LocationPermissionGranted()),
          );
        } else if (permissionStatus == PermissionStatus.denied) {
          emit(
            state.copyWith(
                newLocationPermissionStatus: LocationPermissionDenied()),
          );
        } else if (permissionStatus == PermissionStatus.deniedForever) {
          emit(
            state.copyWith(
                newLocationPermissionStatus: LocationPermissionDeniedForever()),
          );
        }
      }
    } else {
      emit(
        state.copyWith(
            newLocationPermissionStatus: LocationPermissionInitialState()),
      );
    }
  }
}
