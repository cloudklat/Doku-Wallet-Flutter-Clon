import 'package:flutter/material.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              details.exception.toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  };
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Navigation Bar',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white70,
          foregroundColor: Colors.grey,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                color: Colors.black12,
                height: 4.0,
              )),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                "assets/icon/icon_launcher.png",
                scale: 4,
              ),
              Image.asset(
                "assets/icon/icon_qris.png",
                scale: 4,
              ),
              IconButton(
                  icon: const Icon(Icons.notifications_none_rounded),
                  iconSize: 30.0,
                  onPressed: () => {print("Click on settings button")}),
            ],
          ),
        ),
        body: const [
          Center(
            child: Text(
              'Learn 📗',
            ),
          ),
          Center(
            child: Text(
              'Relearn 👨‍🏫',
            ),
          ),
          Center(
            child: Text(
              'Unlearn 🐛',
            ),
          ),
          Center(
            child: Text(
              'Unlearn 🐛',
            ),
          ),
          Center(
            child: Text(
              'Unlearn 🐛',
            ),
          ),
        ][selectedPageIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedPageIndex = index;
            });
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home_rounded,
                color: Colors.redAccent,
              ),
              icon: Icon(Icons.home_outlined),
              label: 'Beranda',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.percent_rounded,
                color: Colors.redAccent,
              ),
              icon: Icon(Icons.percent_rounded),
              label: 'Promo',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.qr_code_scanner_rounded,
                color: Colors.redAccent,
              ),
              icon: Icon(Icons.qr_code_scanner_rounded),
              label: 'Bayar',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.wallet_rounded,
                color: Colors.redAccent,
              ),
              icon: Icon(Icons.wallet_outlined),
              label: 'Wallet',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.person_rounded,
                color: Colors.redAccent,
              ),
              icon: Icon(Icons.person_outlined),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'Futura',
//         primarySwatch: Colors.green,
//       ),
//       home: DefaultTabController(
//         length: 4,
//         child: Home(),
//       ),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   Home({Key? key}) : super(key: key);

//   final TextEditingController _searchText = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _appBar(),
//       body: Center(
//         child: TabBarView(
//           children: [
//             _tabBarViewItem(Icons.home, 'My Own Appbar'),
//             _tabBarViewItem(Icons.group, 'Group'),
//             _tabBarViewItem(Icons.notifications, 'Notifications'),
//             _tabBarViewItem(Icons.menu, 'Menu'),
//           ],
//         ),
//       ),
//     );
//   }

//   PreferredSize _appBar() {
//     return PreferredSize(
//       preferredSize: const Size.fromHeight(150),
//       child: Container(
//         margin: const EdgeInsets.only(top: 5),
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: _boxDecoration(),
//         child: SafeArea(
//           child: Column(
//             children: [
//               _topBar(),
//               const SizedBox(height: 5),
//               _searchBox(),
//               _tabBar(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   BoxDecoration _boxDecoration() {
//     return BoxDecoration(
//       borderRadius: const BorderRadius.vertical(
//         bottom: Radius.circular(20),
//       ),
//       gradient: LinearGradient(
//         colors: [Colors.white, Colors.teal.shade300],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomLeft,
//       ),
//     );
//   }

//   Widget _topBar() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Image.asset("assets/img/icon_launcher.png", height: 30),
//         Image.asset("assets/img/icon_launcher.png", height: 30),
//         const Icon(
//           Icons.notifications_none_rounded,
//           size: 30,
//         ),
//       ],
//     );
//   }

//   Widget _searchBox() {
//     return SizedBox(
//       height: 35,
//       child: TextFormField(
//         textAlign: TextAlign.start,
//         controller: _searchText,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: Colors.white,
//           prefixIcon: const Icon(Icons.search),
//           suffixIcon: InkWell(
//             child: const Icon(Icons.close),
//             onTap: () {
//               _searchText.clear();
//             },
//           ),
//           hintText: 'Search...',
//           contentPadding: const EdgeInsets.all(0),
//           border: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _tabBar() {
//     return TabBar(
//       labelPadding: const EdgeInsets.all(0),
//       labelColor: Colors.black,
//       indicatorColor: Colors.black,
//       unselectedLabelColor: Colors.teal.shade800,
//       tabs: const [
//         Tab(
//           iconMargin: EdgeInsets.all(0),
//           icon: Icon(Icons.home),
//           text: 'Home',
//         ),
//         Tab(
//           iconMargin: EdgeInsets.all(0),
//           icon: Icon(Icons.group),
//           text: 'Group',
//         ),
//         Tab(
//           iconMargin: EdgeInsets.all(0),
//           icon: Icon(Icons.notifications),
//           text: 'Notifications',
//         ),
//         Tab(
//           iconMargin: EdgeInsets.all(0),
//           icon: Icon(Icons.menu),
//           text: 'Menu',
//         ),
//       ],
//     );
//   }

//   Widget _tabBarViewItem(IconData icon, String name) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           icon,
//           size: 100,
//         ),
//         Text(
//           name,
//           style: const TextStyle(fontSize: 40),
//         ),
//       ],
//     );
//   }
// }


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
