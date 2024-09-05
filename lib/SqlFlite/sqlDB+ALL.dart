import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class sqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String datebasespath = await getDatabasesPath(); //موقع حفظ قاعده البيانات
    String path = join(
        datebasespath,
        /**join = getDatabasesPath/NameDatebase.db**/
        "Datebase.db"); //ربط قاعده البيانات مع موقع الحفظ واختيار اسم
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 5, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {}

  /**=============================SQL=======================*/

  //Create /var =text="hhj"  ,integer=1  ,real=1.5
  _onCreate(Database db, int version) async {
    Batch batch =db.batch();//لاضافه اكثر من جدول

    batch.execute('''
    create table Inheritance(
    id integer not null primary key autoincrement,
    name text not null
    )
    ''');

    print("create table =========================");
    await batch.commit();//تنفيذ كل العمليات
  }

  /**=================================SQL_plus========================================**/
  delete_db() async {
    String datebasespath = await getDatabasesPath(); //موقع حفظ قاعده البيانات
    String path = join(
        datebasespath,
        "Datebase.db");
    await deleteDatabase(path);
  }

//select
  select_plus(String table) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(table);
    return response;


  }

  //INSERT /INSERT INTO TB (name) VALUES (@NAME)
  insert_plus(String table,Map<String,Object?>values) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table,values);
    return response;
  }

  //updata
  updata_plus(String table,Map<String,Object?>value,String? mywhere) async {

    Database? mydb = await db;

    int response = await mydb!.update(table,value,where: mywhere);
    return response;
    /**
    * updata
    async {
    int r= await sql.updata("db",{
        "row1":"${obj.text}",
        "row2":"${obj.text}",
        },"id =  ${widget.id}"
        );
    print("updata===============");*/
  }

  //delete /"DELETE FROM TB WHERE id=(@id)"
  delete_plus(String table,String mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.delete(table,where: mywhere);
    return response;
    /**
    * DELETE
        async {
        int r= await sql.delete("db","id =  ${widget.id}")
        print("deletc============");
        },*/

  }
  /**=================================SQL_Normal========================================**/

  select(String sql) async{
    Database? mydb= await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  //INSERT /INSERT INTO TB (name) VALUES (@NAME)
  insert(String sql) async{
    Database? mydb= await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  //updata
  updata(String sql) async{
    Database? mydb= await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  //delete /"DELETE FROM TB WHERE id=(@id)"
  delet(String sql) async{
    Database? mydb= await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}