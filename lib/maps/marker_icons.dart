import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'page.dart';

class MarkerIconsPage extends Page {
  MarkerIconsPage() : super(const Icon(Icons.location_on), 'Vet Locations');

  @override
  Widget build(BuildContext context) {
    return const MarkerIconsBody();
  }
}

class MarkerIconsBody extends StatefulWidget {
  const MarkerIconsBody();

  @override
  State<StatefulWidget> createState() => MarkerIconsBodyState();
}

const LatLng _kMapCenter = LatLng(8.696711, 80.482685);
const LatLng _kMapCenter2 = LatLng(8.76293836, 80.48998117);
const LatLng _kMapCenter3 = LatLng(8.762493, 80.49245954);
const LatLng _kMapCenter4 = LatLng(8.76302319, 80.48862398);
const LatLng _kMapCenter5 = LatLng(8.75790691, 80.48736334);
const LatLng _kMapCenter6 = LatLng(8.75094019, 80.50111234);

class MarkerIconsBodyState extends State<MarkerIconsBody> {
  GoogleMapController controller;
  BitmapDescriptor _markerIcon;

  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppBar(
          title: Text('Nearby Vets',style: new TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,
        ),
        Center(
          child: SizedBox(
            width: 350.0,
            height: 700.0,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _kMapCenter2,
                zoom: 100.0,
              ),
              markers: _createMarker(),
              onMapCreated: _onMapCreated,
            ),
          ),
        )
      ],
    );
  }

  Set<Marker> _createMarker() {
    // TODO(iskakaushik): Remove this when collection literals makes it to stable.
    // https://github.com/flutter/flutter/issues/28312
    // ignore: prefer_collection_literals
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: _kMapCenter,
        icon: _markerIcon,
      ),
      Marker(
        markerId: MarkerId("marker_2"),
        position: _kMapCenter2,
        icon: _markerIcon,
      ),
      Marker(
        markerId: MarkerId("marker_3"),
        position: _kMapCenter3,
        icon: _markerIcon,
      ),
      Marker(
        markerId: MarkerId("marker_4"),
        position: _kMapCenter4,
        icon: _markerIcon,
      ),
      Marker(
        markerId: MarkerId("marker_5"),
        position: _kMapCenter5,
        icon: _markerIcon,
      ),
      Marker(
        markerId: MarkerId("marker_6"),
        position: _kMapCenter6,
        icon: _markerIcon,
      ),
    ].toSet();
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/red_square.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;
    });
  }
}
