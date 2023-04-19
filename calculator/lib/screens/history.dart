import 'package:calculator/model/historyitem.dart';
import 'package:calculator/imports.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class History extends StatelessWidget {
  History({Key? key}) : super(key: key);
  final List<HistoryItem> result = Hive.box<HistoryItem>('history')
      .values
      .toList()
      .reversed
      .toList()
      .cast<HistoryItem>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        context,
        '',
        Icons.delete,
        () {
          Navigator.pop(context);
          Hive.box<HistoryItem>('history').clear();
          showToast(context, 'History cleared successfully');
        },
      ),
      body: result.isEmpty
          ? Center(
              child: Text(
                'history deleted',
                style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w600,fontSize: 20.sp)
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.all(10.0),
              itemCount: result.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 10),
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  tileColor: Colors.black.withOpacity(0.5),
                  title: Text(
                    result[i].title,
                    style: TextStyle(color: Colors.white,fontSize: 20.sp),
                  ),
                  subtitle: Text(result[i].subtitle,style: TextStyle(color: Colors.grey,fontSize: 18.sp),),
                );
              },
            ),
    );
  }
}
