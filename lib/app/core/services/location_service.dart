class LocationService {
  // Future<LocationData?> getLocationData() async {
  //   Location location = Location();

  //   bool serviceEnabled;
  //   PermissionStatus permissionGranted;
  //   // ignore: unused_local_variable
  //   LocationData? locationData;

  //   serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //   }
  //   if (serviceEnabled) {
  //     permissionGranted = await location.hasPermission();
  //     if (permissionGranted == PermissionStatus.denied) {
  //       permissionGranted = await location.requestPermission();
  //     }
  //     if (permissionGranted == PermissionStatus.granted) {
  //       locationData = await location.getLocation();
  //     }
  //   }
  //   return locationData;
  // }
}
