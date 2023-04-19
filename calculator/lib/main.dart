import 'package:calculator/provider/calculator_provider.dart';
import 'package:calculator/screens/calculator.dart';
import 'package:calculator/model/historyitem.dart';
import 'package:calculator/screens/history.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:calculator/imports.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryItemAdapter());
  await Hive.openBox<HistoryItem>('history');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
    return ChangeNotifierProvider<CalculatorProvider>(
      create: (_) => CalculatorProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 52, 66, 92),
          appBarTheme: AppBarTheme(
            color:Colors.transparent,
            elevation: 0.0,
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            
          ),
         
        ),
        routes: {
          '/': (context) => Calculator(),
          '/history': (context) => History(),
        },
      ),
    );
      }
    );
  }
}
