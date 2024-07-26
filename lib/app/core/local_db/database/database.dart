import 'dart:async';

import 'package:floor/floor.dart';
import 'package:mock_api_demo/app/core/local_db/dao/cart_dao.dart';
import 'package:mock_api_demo/app/core/local_db/entity/cart_item.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [CartItem])
abstract class AppDatabase extends FloorDatabase {
  CartDao get cartDao;
}
