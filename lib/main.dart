import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ifa_21312076/app/controllers/auth_controller.dart';
import 'package:ifa_21312076/app/utils/loading.dart';
import 'package:ifa_21312076/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CAuth = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: CAuth.streamAuthStatus, 
      builder: (context, snapshoot) {
        return Loading();
      };
    );
  }
}