# QRCode Scanner

```dart

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerScreenComponent extends StatefulWidget {
  final void Function(String) onScanned;

  const QrScannerScreenComponent({super.key, required this.onScanned});

  @override
  State<QrScannerScreenComponent> createState() =>
      _QrScannerScreenComponentState();
}

class _QrScannerScreenComponentState extends State<QrScannerScreenComponent> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    // Hot reload fix for Android/iOS camera
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      final code = scanData.code;
      if (code != null) {
        await controller.pauseCamera(); // stop scanning more codes
        widget.onScanned(code);
        if (mounted) {
          Navigator.pop(context); // pop safely only once
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR Code")),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  await controller?.toggleFlash();
                },
                child: const Text("Toggle Flash"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```