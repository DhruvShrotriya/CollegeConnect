import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'dart:typed_data';

class NiramaMaps extends StatefulWidget {
  const NiramaMaps({super.key});

  @override
  State<NiramaMaps> createState() => _NiramaMapsState();
}

class _NiramaMapsState extends State<NiramaMaps> {
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  Uint8List? markerImage;
  List<String> images = [
    "assets/images/A_BLOCK-removebg-preview.png",
    "assets/images/B_BLOCK-removebg-preview.png",
    "assets/images/C_BLOCK-removebg-preview.png",
    "assets/images/D_BLOCK-removebg-preview.png",
    "assets/images/E_BLOCK-removebg-preview.png",
    "assets/images/IDNU-removebg-preview.png",
    "assets/images/K_BLOCK-removebg-preview.png",
    "assets/images/ILNU-removebg-preview.png",
    "assets/images/IMNU-removebg-preview.png",
  ];
  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latlang = <LatLng>[
    LatLng(23.129029206649243, 72.54265944106875),
    LatLng(23.129082487768628, 72.54334859881426),
    LatLng(23.127722410465022, 72.54266553980985),
    LatLng(23.127728019059536, 72.5432845620326),
    LatLng(23.128717932318338, 72.54544961512693),
    LatLng(23.128373005864756, 72.54191234528267),
    LatLng(23.128373005864756, 72.54355900538259),
    LatLng(23.127590331741573, 72.54456290189677),
    LatLng(23.129094105865075, 72.54666200901072),
  ];
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.128739060630863, 72.54436413283568),
    //target: LatLng(23.128137202703986, 72.545179524350200),
    zoom: 16,
  );
  // List<Marker> marker = [];
  // List<Marker> _list = const [
  //   Marker(
  //     markerId: MarkerId("1"),
  //     position: LatLng(23.127728976772524, 72.54339485420431),
  //     infoWindow: InfoWindow(title: "D Block"),
  //   ),
  //   Marker(
  //     markerId: MarkerId("2"),
  //     position: LatLng(23.127703073998404, 72.54118839745857),
  //   )
  // ];

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();
    loadData();
    //marker.addAll(_list);
  }

  loadData() async {
    for (int i = 0; i < images.length; i++) {
      final Uint8List markerIcon = await getBytesFromAssets(images[i], 250);
      _markers.add(Marker(
          markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          position: _latlang[i],
          infoWindow: InfoWindow(title: "this" + i.toString())));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nirma Map'),
          centerTitle: true,
        ),
        body: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          compassEnabled: false,
          myLocationEnabled: true,

          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },

          markers: Set<Marker>.of(_markers),
          //markers: markers,
        ));
  }
}
