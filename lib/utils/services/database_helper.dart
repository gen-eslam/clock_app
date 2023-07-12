import 'package:clock_app/utils/constans/constans_string.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../model/alarm_info.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  Database? _database;

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initiateDatabase();
    return _database;
  }

  Future<Database> _initiateDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, ConstanceString.databaseName);
    Database database = await openDatabase(path,
        version: ConstanceString.version, onCreate: _onCreate);
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
          create table ${ConstanceString.tableName} ( 
          ${ConstanceString.columnId} integer primary key autoincrement, 
          ${ConstanceString.columnTitle} text not null,
          ${ConstanceString.columnDateTime} text not null,
          ${ConstanceString.columnPending} integer,
          ${ConstanceString.columnColorIndex} integer)
        ''');
  }

  void insertAlarm(AlarmInfo alarmInfo) async {
    var result = await _database?.insert(
        ConstanceString.tableName, alarmInfo.toJson());
    print(result);
  }

  Future<List<AlarmInfo>> getAlarms() async {
    List<Map<String, Object?>> map = await _database!.query(
        ConstanceString.tableName);

    return List.generate(map.length, (index) {
      print(map[index].toString());
      return AlarmInfo.fromJson(map[index]);
    }
    );


  }

  Future<void> deleteAlarm(int id) async{
    await _database!.delete(ConstanceString.tableName,where: "${ConstanceString.columnId} =?" ,whereArgs: [id]);
  }
}
