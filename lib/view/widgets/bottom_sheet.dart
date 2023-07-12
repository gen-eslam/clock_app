import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/alarm_controller.dart';
import '../../model/alarm_info.dart';
import 'color_picker/color_palette.dart';

class CustomBottomSheet extends StatefulWidget {
  CustomBottomSheet({
    super.key,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  var controller = Get.find<AlarmController>();
  late DateTime _alarmTime;
  bool _isRepeatSelected = false;
  late String _alarmTimeString;
  late AlarmInfo _alarmInfo ;

  @override
  void initState() {
    _alarmTimeString = DateFormat.jm().format(DateTime.now());
    _alarmTime = DateTime.now();
    _alarmInfo = AlarmInfo(alarmDataTime: DateTime.now(), title: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.r),
      child: Column(
        children: [
          SizedBox(
            child: TextButton(
              onPressed: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (selectedTime != null) {
                  final now = DateTime.now();
                  var selectedDateTime = DateTime(now.year, now.month, now.day,
                      selectedTime.hour, selectedTime.minute);
                  _alarmTime = selectedDateTime;
                  setState(() {
                    _alarmTimeString = DateFormat.jm().format(selectedDateTime);
                  });
                }
              },
              child: Text(_alarmTimeString,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 30.sp,
                      letterSpacing: 10.r)),
            ),
          ),
          ListTile(
            title: Text(
              'Repeat',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Switch(
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _isRepeatSelected = value;
                });
              },
              value: _isRepeatSelected,
            ),
          ),
          ListTile(
            title: Text('Sound', style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
          ),
          ListTile(
            title: Text('Title', style: TextStyle(color: Colors.white)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
          ColorPalette(alarmInfo: _alarmInfo! ),
          Flexible(
            child: FloatingActionButton.extended(
              onPressed: () {
                controller.insertAlarm(_alarmInfo);
                Navigator.pop(context);
              },
              icon: Icon(Icons.alarm),
              label: Text(
                'Save',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
