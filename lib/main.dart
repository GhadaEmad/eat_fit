import 'package:be_happy/core/helpers/cach_helpers.dart';
import 'package:be_happy/eat_fit.dart';
import 'package:flutter/material.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
await CacheData.Cachintiliztion();
  runApp(const EatFit());
}