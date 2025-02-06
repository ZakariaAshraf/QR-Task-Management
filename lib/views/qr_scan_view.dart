// import 'package:flutter/material.dart';
// import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
//
// class QrScanView extends StatefulWidget {
//   const QrScanView({Key? key}) : super(key: key);
//
//   @override
//   _QrScanViewState createState() => _QrScanViewState();
// }
//
// class _QrScanViewState extends State<QrScanView> {
//   bool _isCameraInitialized = false;
//
//   @override
//   void initState() {
//     super.initState();
//     //_initializeCamera();
//   }
//
//   // Future<void> _initializeCamera() async {
//   //   try {
//   //     // Request camera permission
//   //     var status = await Permission.camera.request();
//   //     if (status.isGranted) {
//   //       setState(() {
//   //         _isCameraInitialized = true;
//   //       });
//   //     } else {
//   //       print("Camera permission denied");
//   //     }
//   //   } catch (e) {
//   //     print("Error initializing camera: $e");
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!_isCameraInitialized) {
//       return Scaffold(
//         appBar: AppBar(),
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(),
//       body: QRCodeDartScanView(
//         scanInvertedQRCode: true,
//         typeScan: TypeScan.live,
//         onCapture: (Result result) {
//           if (result.text != null) {
//             print("Scanned QR Code: ${result.text}");
//           } else {
//             print("Failed to scan QR Code");
//           }
//         },
//         formats: [
//           BarcodeFormat.qrCode,
//         ],
//       ),
//     );
//   }
// }