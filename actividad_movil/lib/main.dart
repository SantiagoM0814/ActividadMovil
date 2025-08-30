import 'package:flutter/material.dart';
import 'package:actividad_movil/class/languages.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.burgerking.com.co/');

void main() {
  runApp(const AppBarApp());
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppBarExample extends StatefulWidget {
  const AppBarExample({super.key});

  @override
  State<AppBarExample> createState() => _AppBarExampleState();
}

class _AppBarExampleState extends State<AppBarExample> {

  int _selectedIndex = 0;

  Future<void> _launchURL() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );


  late List<Widget> _widgetOptions;

@override
void initState() {
  super.initState();
  _widgetOptions = <Widget>[
    const Text('Index 0: Home', style: optionStyle),
    Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(width: 8),
          const Image(image: AssetImage('img/js.png')),
          const ListTile(
            leading: Icon(Icons.code, color: Colors.yellow),
            title: Text('JavaScript'),
            subtitle: Text(
              "Lenguaje de programación muy usado en el desarrollo web. "
              "Funciona tanto en frontend como en backend con Node.js.",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(width: 8),
              TextButton(
                onPressed: _launchURL, // ✅ ahora funciona
                child: const Text('Aprender más'),
              ),
              const SizedBox(width: 8),
            ],
          )
        ],
      ),
    ),
    const Text('Index 2: School', style: optionStyle),
  ];
}


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            tooltip: 'Show add alert',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar add alert')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Got to the next page',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Next page')),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _selectedIndex == 0
      ? ListView.builder(
          itemCount: MusicList.musicList().length,
          itemBuilder: (context, index) {
            var musicList = MusicList.musicList()[index];
            return InkWell(
              onTap: () {
                var snackBar = SnackBar(
                  content: Text("Title ${musicList.title}"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    padding(
                      Text(
                        musicList.title,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      height: 150.0,
                      width: 500.0,
                      color: Colors.black,
                      child: Image.network(
                        musicList.coverImg,
                        height: 150.0,
                        width: 170.0,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        padding(
                          Text(
                            musicList.single,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        ),
                        padding(
                          Text(
                            musicList.name,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                    padding(
                      Text(
                        musicList.descriptions,
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        padding(
                          Text(
                            musicList.author,
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ),
                        padding(
                          Text(
                            musicList.durations,
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
      : _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // quita el padding del ListView
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
                image: DecorationImage(
                  image: AssetImage('assets/img/logo.png'),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
              ),
              child: Text('Menu'),
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Lenguajes'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Card'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget padding(Widget widget) {
  return Padding(padding: const EdgeInsets.all(0.7), child: widget);
}
