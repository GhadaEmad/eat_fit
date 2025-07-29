
import 'package:be_happy/eat_fit.dart';
import 'package:flutter/material.dart';

import 'core/helpers/cach_helpers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.Cachintiliztion();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EatFit());
}
