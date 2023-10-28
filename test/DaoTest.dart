import 'package:flutter_learn/t2_mooc_bilibili/util/LogUtil.dart';
import 'package:logging/logging.dart';
final logger = Logger('my_logger');

main() {
 // UserAccountDao.login("tom", "123456");
 // var token= HiCache.get("token");
 Logger.root.level = Level.ALL;
 Logger.root.onRecord.listen((record) {
  print(' level:${record.level.name}:\t时间[ ${record.time}];\tmsg: ${record.message}');
  if (record.error != null) {
   print('Error: ${record.error}');
  }
 });

 logger.finest('This is a finest level message.');
 logger.finer('This is a finer level message.');
 logger.fine('This is a fine level message.');
 logger.config('This is a config level message.');
 logger.info('This is an info level message.');
 logger.warning('This is a warning level message.');
 logger.severe('This is a severe level message.');
 logger.shout('This is a shout level message.');


 var test = "testContent";
 print("test：$test");
 LogUtil.printLog("test：$test", StackTrace.current);
}
