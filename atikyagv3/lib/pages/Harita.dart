import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HaritaPage extends StatefulWidget {
  @override
  State<HaritaPage> createState() => _HaritaPageState();
}

class _HaritaPageState extends State<HaritaPage> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;

  @override
  void initState() {
    super.initState();
    setOzelMarker();
  }

  void setOzelMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/iconYag90.png');
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('toplamaMerkezi'),
          position: LatLng(39.4251797, 29.9896107),
          icon: mapMarker,
          infoWindow: InfoWindow(
            title: 'Yag Toplama Merkezi',
            snippet: 'sube-1',
          ),
        ),
      );
    });
  }

  var cameraPosition =
      CameraPosition(target: LatLng(39.4251797, 29.9896107), zoom: 17);

  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: onMapCreated,
        markers: _markers,
        initialCameraPosition: cameraPosition,
      ),
    );
  }
}
