import 'package:flutter/material.dart';
import 'package:mvvm_pro/Model/LocalDbModel/db_dog.dart';
import 'package:mvvm_pro/View/StorageWidget/dog_form_view.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlitePage extends StatefulWidget {
  const SqlitePage({super.key});

  @override
  State<SqlitePage> createState() => _SqlitePageState();
}

class _SqlitePageState extends State<SqlitePage> {
  static Database? database;
  TextEditingController IdController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController AgeController = TextEditingController();
  List<Dog> lstDog = new List.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Sqlite 示範')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dog_form_page(
                IdField: IdController,
                NameField: NameController,
                AgeField: AgeController),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: insertEvent,
                        child: Text('Save'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: loadDogs,
                        child: Text('load'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: deleteEvent,
                        child: Text('delete'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemCount: lstDog.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(child: Text('${lstDog[index]}'));
                },
              ),
            )
          ],
        ));
  }

  void insertEvent() {
    if (IdController.text.isEmpty ||
        AgeController.text.isEmpty ||
        NameController.text.isEmpty) {
      ScaffoldMessenger.of(this.context).showSnackBar(
        SnackBar(
          content: Text('條件不能為空白'),
        ),
      );
      return;
    }

    Dog dog = Dog(
        id: int.parse(IdController.text),
        name: NameController.text,
        age: int.parse(AgeController.text));

    insertDog(dog);
  }

  void deleteEvent() {
    if (IdController.text.isEmpty) {
      ScaffoldMessenger.of(this.context).showSnackBar(
        SnackBar(
          content: Text('ID不為空白'),
        ),
      );
      return;
    }
    deleteDog(int.parse(IdController.text));
  }

  @override
  void initState() {
    super.initState();
    createDb();
  }

  Future<void> createDb() async {
    if (database != null) {
      loadDogs();
    }
    database = await openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertDog(Dog dog) async {
    final db = await database;
    await db!.insert(
      'dogs',
      dog.toMap(),
      //key 衝突時取代掉本來資料
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    loadDogs();
  }

  Future<void> loadDogs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('dogs');
    setState(() {
      lstDog = List.generate(maps.length, (i) {
        return Dog(
          id: maps[i]['id'] as int,
          name: maps[i]['name'] as String,
          age: maps[i]['age'] as int,
        );
      });
    });
  }

  Future<void> updateDog(Dog dog) async {
    final db = await database;
    await db!.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    final db = await database;
    await db!.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
