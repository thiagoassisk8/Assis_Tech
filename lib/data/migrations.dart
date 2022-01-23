// import 'dart:io' as io;

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';

// class Migration {
//   static late Database _db;

//   start() async {
//     io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, "main.db");
//     _db = await openDatabase(path, version: 1);
//     migrate(_db, 1);
//   }

//   void migrate(Database db, int version) async {
//     await db.execute(
//         "CREATE TABLE IF NOT EXISTS User(id INTEGER PRIMARY KEY, company TEXT, token TEXT, name TEXT, email TEXT, avatar TEXT, firstAccess TEXT, finishRegistration TEXT)");
//     await db.execute(
//         "CREATE TABLE IF NOT EXISTS channels(id INTEGER PRIMARY KEY, description TEXT, created_at TEXT, is_reception TEXT, last_message TEXT)");
//     await db.execute(
//         "CREATE TABLE IF NOT EXISTS channel_members(channel_id TEXT, member_id TEXT, avatar TEXT)");
//     await db.execute(
//         "CREATE TABLE IF NOT EXISTS messages(id INTEGER PRIMARY KEY, channel_id TEXT, author_id TEXT, content TEXT, created_at TEXT)");
//     await db.execute(
//         "CREATE TABLE IF NOT EXISTS bucket(id INTEGER PRIMARY KEY, channel_id TEXT, author_id TEXT, content TEXT, created_at TEXT)");
//   }

//   void seed() {
//     seedChannels();
//   }

//   void seedChannels() async {
//     await _db.execute(
//         "insert into channels values (1, 'PORTARIA 1', '2019-01-01 00:00:00', true)");
//     await _db.execute(
//         "insert into channels values (2, 'CONVERSA 1', '2019-01-01 00:00:00', false)");
//     await _db.execute(
//         "insert into channels values (3, 'CONVERSA 1', '2019-01-01 00:00:00', false)");
//     await _db.execute(
//         "insert into channels values (4, 'CONVERSA 1', '2019-01-01 00:00:00', false)");
//     seedMessages();
//   }

//   void seedMessages() async {
//     await _db.execute(
//         "insert into messages values (1, 'PORTARIA 1', '2019-01-01 00:00:00', true)");
//     await _db.execute(
//         "insert into channels values (2, 'CONVERSA 1', '2019-01-01 00:00:00', false)");
//     await _db.execute(
//         "insert into channels values (3, 'CONVERSA 1', '2019-01-01 00:00:00', false)");
//     await _db.execute(
//         "insert into channels values (4, 'CONVERSA 1', '2019-01-01 00:00:00', false)");
//   }

//   Migration() {
//     start();
//   }
// }
