import 'package:flutter/material.dart';
import 'package:widget_lanjut/detail_chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), 
      debugShowCheckedModeBanner: false
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          backgroundColor: Colors.green,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat)),
              Tab(icon: Icon(Icons.circle_outlined)),
              Tab(icon: Icon(Icons.call)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: 10,
                    right: 10,
                    top: 10,
                  ),
                  child: Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailChat()),
                        );
                      },
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("My Friend"),
                        subtitle: Text("Hi!"),
                        trailing: Text(
                          "50",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListView(
              // isi tab status
            ),
            ListView(
              // isi tab telepon
            ),
          ],
        ),
      ),
    );
  }
}
