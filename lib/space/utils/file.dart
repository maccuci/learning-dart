import 'dart:io';

class FileUtils {
  static void readFile({ required String path }) {
    File file =File(path);

    if(file.existsSync()) {
      String content = file.readAsStringSync();
      print("File content: \n$content");
    }
  }

  static void writeFile({ required String path, required String content }) {
    File file = File(content);
    file.writeAsStringSync(content);

    print("Content was writed!");
  }
}