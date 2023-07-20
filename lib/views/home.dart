import 'admin.dart';
import 'manual_mark.dart';
import 'profile.dart';
import 'register.dart';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isQRCodeDetected = false;
  MobileScannerController scannerController = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
  );

  @override
  void dispose() {
    scannerController.dispose();
    super.dispose();
  }

  void goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterView(),
      ),
    );
  }

  void goToManualMark() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ManualMarkView(),
      ),
    );
  }

  void goToAdmin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AdminView(),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class App'),
        elevation: 4,
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: scannerController,
            onDetect: (capture) {
              if (!isQRCodeDetected) {
                isQRCodeDetected = true;
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  debugPrint('Barcode found! ${barcode.rawValue}');
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfileView(data: barcodes[0].rawValue ?? ''),
                  ),
                ).then((result) {
                  isQRCodeDetected = false;
                  scannerController.start(
                      cameraFacingOverride: CameraFacing.back);
                });
              }
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: Text(
                  'Please scan the QR code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              color: Colors.black.withOpacity(0.5),
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  ElevatedButton(
                      onPressed: goToRegister, child: const Text('Register')),
                  ElevatedButton(
                      onPressed: goToManualMark,
                      child: const Text('Manual Marking')),
                  ElevatedButton(
                      onPressed: goToAdmin, child: const Text('Admin')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
