import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:the_app_flutter/models/main_list_item.dart';
import 'package:the_app_flutter/pages/echo_box.dart';
import 'package:the_app_flutter/pages/login_screen_page.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'The App'),
      routes: <String, WidgetBuilder>{
        '/echoBox': (BuildContext context) => EchoBoxPage(),
        '/loginScreen': (BuildContext context) => LoginScreenPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final List<MainListItem> mainListItem = [
    new MainListItem(
        'Echo Box', 'Write something and save to local memory', '/echoBox'),
    new MainListItem(
        'Login Screen', 'A fake login screen for testing', '/loginScreen')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Scrollbar(
          child: ListView.builder(
            restorationId: 'list_demo_list_view',
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: mainListItem.length,
            itemBuilder: (context, index) {
              return ListTile(
                  key: Key('$index'),
                  leading: ExcludeSemantics(
                    child: CircleAvatar(child: Text('${index + 1}')),
                  ),
                  title: Text(mainListItem[index].title),
                  subtitle: Text(mainListItem[index].subTitle),
                  onTap: () {
                    Navigator.of(context).pushNamed(mainListItem[index].path);
                  });
            },
          ),
        ));
  }
}
