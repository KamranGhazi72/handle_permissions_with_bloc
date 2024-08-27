part of 'accident_location_cubit.dart';

abstract class LocationPermissionStatus {}

class LocationPermissionInitialState extends LocationPermissionStatus {}

class LocationPermissionDeniedForever extends LocationPermissionStatus {}

class LocationPermissionDenied extends LocationPermissionStatus {}

class LocationPermissionGranted extends LocationPermissionStatus {}