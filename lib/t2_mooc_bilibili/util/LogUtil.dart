void printLog(Object message, StackTrace current) {
  MYCustomTrace programInfo = MYCustomTrace(current);
  print(
      "file: [${programInfo.fileName}:${programInfo.lineNumber}], msg: [$message]");
}

class LogUtil {
// 可以在utils定义log.dart
  static void printLog(Object message, StackTrace current) {
    MYCustomTrace programInfo = MYCustomTrace(current);
    print(
        "file: [${programInfo.fileName}:${programInfo.lineNumber}], msg: [$message]");
  }
}

class MYCustomTrace {
  final StackTrace _trace;
  String fileName = "";
  int lineNumber = 0;
  int columnNumber = 0;

  MYCustomTrace(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    var traceString = this._trace.toString().split("\n")[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfInfos = fileInfo.split(":");
    this.fileName = listOfInfos[0];
    this.lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(")", "");
    this.columnNumber = int.parse(columnStr);
  }
}
