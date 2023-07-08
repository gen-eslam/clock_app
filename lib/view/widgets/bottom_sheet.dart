import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  late DateTime _alarmTime;
  bool _isRepeatSelected = false;
  late String _alarmTimeString;

  @override
  void initState() {
    _alarmTimeString = DateFormat.jm().format(DateTime.now());
    _alarmTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.r),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
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
                    _alarmTimeString =
                        DateFormat.jm().format(selectedDateTime);
                  });
                }
              },
              child: Text(_alarmTimeString,
                  style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.w900 ,fontSize: 30.sp, letterSpacing: 10.r)),
            ),
          ),
          ListTile(
            title: Text('Repeat',style: TextStyle(color: Colors.white),),
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
            trailing: Icon(Icons.arrow_forward_ios,color: Colors.white),
          ),
          ListTile(
            title: Text('Title',style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              // onSaveAlarm(_isRepeatSelected);
            },
            icon: Icon(Icons.alarm),
            label: Text('Save',),
          ),
        ],
      ),
    );
  }
}
