import 'package:flutter/material.dart';
import 'package:flutter_learn/t3_jd_shop/routers/router.dart';

main() => runApp(const JdShop());

class JdShop extends StatefulWidget {
  const JdShop({Key? key}) : super(key: key);

  @override
  _JdShopState createState() => _JdShopState();
}

class _JdShopState extends State<JdShop> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
    );
  }
}