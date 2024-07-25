// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CartDao? _cartDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CartItem` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `productId` TEXT, `name` TEXT NOT NULL, `imageUrl` TEXT NOT NULL, `price` REAL NOT NULL, `quantity` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CartDao get cartDao {
    return _cartDaoInstance ??= _$CartDao(database, changeListener);
  }
}

class _$CartDao extends CartDao {
  _$CartDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _cartItemInsertionAdapter = InsertionAdapter(
            database,
            'CartItem',
            (CartItem item) => <String, Object?>{
                  'id': item.id,
                  'productId': item.productId,
                  'name': item.name,
                  'imageUrl': item.imageUrl,
                  'price': item.price,
                  'quantity': item.quantity
                }),
        _cartItemUpdateAdapter = UpdateAdapter(
            database,
            'CartItem',
            ['id'],
            (CartItem item) => <String, Object?>{
                  'id': item.id,
                  'productId': item.productId,
                  'name': item.name,
                  'imageUrl': item.imageUrl,
                  'price': item.price,
                  'quantity': item.quantity
                }),
        _cartItemDeletionAdapter = DeletionAdapter(
            database,
            'CartItem',
            ['id'],
            (CartItem item) => <String, Object?>{
                  'id': item.id,
                  'productId': item.productId,
                  'name': item.name,
                  'imageUrl': item.imageUrl,
                  'price': item.price,
                  'quantity': item.quantity
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CartItem> _cartItemInsertionAdapter;

  final UpdateAdapter<CartItem> _cartItemUpdateAdapter;

  final DeletionAdapter<CartItem> _cartItemDeletionAdapter;

  @override
  Future<List<CartItem>> findAllCartItems() async {
    return _queryAdapter.queryList('SELECT * FROM CartItem',
        mapper: (Map<String, Object?> row) => CartItem(
            id: row['id'] as int?,
            productId: row['productId'] as String?,
            name: row['name'] as String,
            imageUrl: row['imageUrl'] as String,
            price: row['price'] as double,
            quantity: row['quantity'] as int));
  }

  @override
  Future<CartItem?> findProductById(String id) async {
    return _queryAdapter.query('SELECT * FROM CartItem WHERE productId = ?1',
        mapper: (Map<String, Object?> row) => CartItem(
            id: row['id'] as int?,
            productId: row['productId'] as String?,
            name: row['name'] as String,
            imageUrl: row['imageUrl'] as String,
            price: row['price'] as double,
            quantity: row['quantity'] as int),
        arguments: [id]);
  }

  @override
  Future<void> clearCart() async {
    await _queryAdapter.queryNoReturn('DELETE * FROM CartItem');
  }

  @override
  Future<void> insertCartItem(CartItem cartItem) async {
    await _cartItemInsertionAdapter.insert(cartItem, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCartItem(CartItem cartItem) async {
    await _cartItemUpdateAdapter.update(cartItem, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCartItem(CartItem cartItem) async {
    await _cartItemDeletionAdapter.delete(cartItem);
  }
}
