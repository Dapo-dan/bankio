import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> appSetUp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
