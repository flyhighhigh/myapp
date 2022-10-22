import 'package:myapp/common/models/models.dart';
import 'package:myapp/common/utils/secure.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// 資料庫物件 (單一實例)
class DatabaseUtil {
  static final DatabaseUtil _instance = DatabaseUtil._();
  factory DatabaseUtil() => _instance;
  static Database? _database;

  static String databaseName = 'myapp.db';

  /// 物件建構子 (只會被使用一次)
  DatabaseUtil._();


  /// init db 初始化db
  static Future<void> init () async {
    if (_database == null){
      final databasePath = await getDatabasesPath();
      final path = join(databasePath,databaseName);

      _database = await openDatabase(path,version: 1, onCreate: _createDatabase);
    }

    final maps = await _database?.rawQuery('SELECT * FROM $userTable');
    print(maps);
  }

  static Future _createDatabase(Database db,int version) async{
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const stringType = "TEXT NOT NULL";
    
    db.execute('''
CREATE TABLE $userTable (
  ${UserField.id} $idType,
  ${UserField.account} $stringType,
  ${UserField.name} $stringType,
  ${UserField.password} $stringType
)
''');
    // insert captain
    final id = await db.insert(userTable,User(account: "captain", password: cryptoSHA("captain"),name: "captain").toJson());


  }
  /// 新增使用者到資料庫
  Future<User> insertUser(User user) async { // insert user
    print(user);
    final id = await _database?.insert(userTable,user.toJson());

    print("id=$id");
    return user.copy(id: id);
  }
  
  Future<User?> findUserByAccount(String account) async{
    final maps = await _database?.query(
      userTable,
      columns: UserField.values,
      where: "${UserField.account} = ?",
      whereArgs: [account]
    );
    if (maps!.isNotEmpty){
      return User.fromJson(maps.first);
    }
    return null;
  }

  Future<String?> resetUserPassword(String account) async{
    final user = await findUserByAccount(account);
    if (user == null) return null;

    await _database?.update(
      userTable,
      user.copy(password: cryptoSHA(account)).toJson(),
      where: "${UserField.id} = ?",
      whereArgs: [user.id]
    );
    return account;
  }

  /// 使用者登入要求
  Future<User?> userLoginRequest(String account,String password) async{
    final maps = await _database?.query(
      userTable,
      columns: UserField.values,
      where: "${UserField.account} = ? and ${UserField.password} = ?",
      whereArgs: [account, password]
    );
    if (maps!.isNotEmpty){
      return User.fromJson(maps.first);
    }
    return null;
  }

  Future close () async {
    _database!.close();
  }

  

  // insert to db

  // delete
}