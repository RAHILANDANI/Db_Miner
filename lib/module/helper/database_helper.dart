import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  DataBaseHelper._();

  static final DataBaseHelper databaseHelper = DataBaseHelper._();

  Database? db;

  Future<Database?> initDB() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, "FavouriteDB.db");

    print(databasePath);

    db = await openDatabase(databasePath, version: 1,
        onCreate: (Database db, _) async {
      String sql =
          "CREATE TABLE IF NOT EXISTS favourite (id INTEGER PRIMARY KEY AUTOINCREMENT, quote TEXT, auther TEXT);";

      await db.execute(sql);
    });

    return db;
  }

  Future<void> insertfavourite(
      String name, String description) async {
    db = await initDB();

    String sql = "INSERT INTO favourite(name,description) VALUES(?,?)";
    List args = [name, description];

    await db!.rawInsert(sql, args);
  }

  Future<List<Map<String, Object?>>> fetchAllData() async {
    db = await initDB();

    String sql = "SELECT * FROM favourite";

    List<Map<String, Object?>> fetchedData = await db!.rawQuery(sql);

    return fetchedData;
  }

  Future<void> deleteData({required String link}) async {
    db = await initDB();

    String sql = "DELETE FROM favourite WHERE description = ?";
    List values = [link];

    await db!.rawDelete(sql, values);
  }
}
