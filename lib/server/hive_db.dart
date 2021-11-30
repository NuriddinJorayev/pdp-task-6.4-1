import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';

class Hive_db{

  bool setObject_Save(String key, var item, String db_name) {
    var  db = Hive.box(db_name);
    db.put(key, item);
    if (db.containsKey(key)){
      return true;
    }
    return false;
  }
  String loadStore(String key, String db_name)  {
    var db = Hive.box(db_name);
    if (db.containsKey(key)){
      return db.get(key);
    }
    return "";
  }
  bool deleteItem(String key, String db_name){
    var db = Hive.box(db_name);
     if (db.containsKey(key) ){
       return true;
     }
    return false;
  }
  bool key_exist(String key, String db_name){
    var db = Hive.box(db_name);
    return db.containsKey(key);
  }

}