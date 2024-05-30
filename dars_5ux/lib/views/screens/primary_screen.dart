import 'package:dars_5ux/services/product_2_http_services.dart';
import 'package:dars_5ux/views/screens/users_screen.dart';
import 'package:flutter/material.dart';

class PrimaryScreen extends StatefulWidget {
  const PrimaryScreen({super.key});

  @override
  State<PrimaryScreen> createState() => _PrimaryScreenState();
}

class _PrimaryScreenState extends State<PrimaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const LoadingScreen();
                      },
                    ));
                  },
                  child: const Text('PRODUCT SCREEN')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const UserScreen();
                      },
                    ));
                  },
                  child: const Text('USER SCREEN')),
            ],
          ),
        ],
      ),
    );
  }
}
