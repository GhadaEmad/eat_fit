
import 'package:be_happy/eat_fit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/helpers/cach_helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.Cachintiliztion();
  await Firebase.initializeApp();
  runApp(const EatFit());
}
