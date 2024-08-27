
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:handle_permissions_with_bloc/common/components/button_component.dart';
import 'package:handle_permissions_with_bloc/features/feature_submit_accident/accident_location/presentation/bloc/accident_location_cubit.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

class AccidentLocationScreen extends StatefulWidget {
  const AccidentLocationScreen({super.key});

  @override
  State<AccidentLocationScreen> createState() => _AccidentLocationScreenState();
}

class _AccidentLocationScreenState extends State<AccidentLocationScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AccidentLocationCubit>(context).checkLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AccidentLocationCubit, AccidentLocationState>(
        buildWhen: (previous, current) {
          if (previous == current) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          if (state.locationPermissionStatus is LocationPermissionGranted) {
            return Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: FlutterMap(
                    options: MapOptions(
                      initialZoom: 15,
                      initialCenter: LatLng(35.757732, 51.412588),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: LatLng(35.757732, 51.412588),
                            child: Container(
                              child: IconButton(
                                icon: Icon(Icons.location_on),
                                color: Colors.red,
                                iconSize: 45.0,
                                onPressed: () {
                                  print('yeahaa');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          if (state.locationPermissionStatus is LocationPermissionDenied) {
            return ButtonComponent.permissionBtn(
              width: 200.0,
              isEnable: null,
              text: "اجازه دسترسی مجدد",
              onTap: () => BlocProvider.of<AccidentLocationCubit>(context)
                  .checkLocationPermission(),
            );
          }
          if (state.locationPermissionStatus
              is LocationPermissionDeniedForever) {
            return ButtonComponent.permissionBtn(
              width: 200.0,
              text: "ارجاع به تنظیمات تلفن همراه",
              onTap: () async => await openAppSettings(),
            );
          }
          if (state.locationPermissionStatus
              is LocationPermissionInitialState) {
            return Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 90.0,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: IconButton(
                          onPressed: () => context.pop(),
                          icon: Icon(Icons.arrow_back_ios_new_rounded),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/location_allowing.svg",
                      height: 200.0,
                      width: 300.0,
                    ),
                    SizedBox(
                      height: 100.0,
                      child: Text(
                        'برای ثبت اطلاعات موقعیت تصادف٬ باید gps دستگاه خود را فعال کنید',
                      ),
                    ),
                    ButtonComponent.permissionBtn(
                      width: 200.0,
                      text: 'فعال سازی موقعیت مکانی',
                      onTap: () =>
                          BlocProvider.of<AccidentLocationCubit>(context)
                              .checkLocationPermission(),
                    ),
                  ],
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
