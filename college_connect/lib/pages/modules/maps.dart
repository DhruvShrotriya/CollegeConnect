// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';
// import 'package:label_marker/label_marker.dart';

// class NiramaMaps extends StatefulWidget {
//   const NiramaMaps({super.key});

//   @override
//   State<NiramaMaps> createState() => _NiramaMapsState();
// }

// class _NiramaMapsState extends State<NiramaMaps> {
//   Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(23.128304912972787, 72.5434414280204),
//     zoom: 16,
//   );
//   // List<Marker> marker = [];
//   // List<Marker> _list = const [
//   //   Marker(
//   //     markerId: MarkerId("1"),
//   //     position: LatLng(23.127728976772524, 72.54339485420431),
//   //     infoWindow: InfoWindow(title: "D Block"),
//   //   ),
//   //   Marker(
//   //     markerId: MarkerId("2"),
//   //     position: LatLng(23.127703073998404, 72.54118839745857),
//   //   )
//   // ];
//   Set<Marker> markers = {};
//   @override
//   void initState() {
//     super.initState();
//     //marker.addAll(_list);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Nirma Map'),
//           centerTitle: true,
//         ),
//         body: GoogleMap(
//           initialCameraPosition: _kGooglePlex,
//           compassEnabled: false,
//           myLocationEnabled: true,
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//           },
//           //markers: Set<Marker>.of(marker),
//           markers: markers,
//         ));
//   }
// }
