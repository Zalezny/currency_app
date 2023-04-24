import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkDialog extends StatelessWidget {
  const NetworkDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Theme.of(context).cardColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Missing Internet Connection",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Image.asset(
              'assets/images/grave_net.png',
              height: MediaQuery.of(context).size.height * 0.18,
            ),
            ElevatedButton(
              onPressed: () {
                _checkInternetConnection().then((isConnectivity) {
                  if (isConnectivity) {
                    Navigator.of(context).pop();
                  }
                });
              },
              child: const Text(
                "Try Reconnect",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _checkInternetConnection() async {
    final connectivity = await (Connectivity().checkConnectivity());
    if (connectivity == ConnectivityResult.mobile ||
        connectivity == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
