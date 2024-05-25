import 'package:flutter/material.dart';
import 'package:music_app/main/my_app.dart';
import 'package:music_app/shared/database_service/databse_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.instance.init();
  runApp(const MyApp());
}
