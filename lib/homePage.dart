import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'homeController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {

  HomeController homeController=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(



          ),
          Container(
            child: Obx(()=>CalendarDatePicker2(
              config: CalendarDatePicker2Config(),
              value: homeController.dates,
              onValueChanged: (dates) {


    if (dates.isNotEmpty && dates.first != null) {
      // Format the date to 'yyyy-MM-dd' and exclude the time
      String formattedDate = DateFormat('yyyy-MM-dd').format(dates.first!);
      homeController.date=formattedDate;

      if(kDebugMode){
        print('----------------$formattedDate');

      }
    }



                homeController.dates.value = dates;

              },
            )),
          ),
          ElevatedButton(onPressed: (){
            homeController.fetchData();
          }, child: const Text('Get the Image'))
        ],
      ),
    );
  }
}
