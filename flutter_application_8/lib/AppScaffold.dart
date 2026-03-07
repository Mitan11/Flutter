import 'package:flutter/material.dart';
import 'package:flutter_application_8/MyHomePage.dart';

class AppScaffold extends StatefulWidget {
  // final Widget mychild;
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  bool isDark = false;

  int activeIndex = 0;
  List<Widget> screens = [
    MyHomePage(),
    Column(
      children: [
        TextField(decoration: InputDecoration(border: OutlineInputBorder())),
        ElevatedButton(onPressed: () {}, child: Text("Search")),
      ],
    ),
    Text("Messages"),
    Text("User Account"),
  ];
  
  changeScreen(index) {
    setState(() {
      activeIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mar5"),

        // Switch is a widget that allows the user to toggle between two states, on and off. It is commonly used for settings or preferences in an application.
        actions: [
          Switch(
            value: isDark,
            onChanged: (val) {
              setState(() {
                isDark = val;
              });
            },
            activeTrackColor: Colors.greenAccent,
            inactiveTrackColor: Colors.deepPurple,
            activeThumbColor: Colors.deepPurple,
            inactiveThumbColor: Colors.green,
          )
        ],
        //

      ),

      // Drawer is a panel that slides in from the side of the screen, typically used for navigation or displaying additional options. It is commonly accessed by tapping on a menu icon or swiping from the edge of the screen.
      drawer: Drawer(
        child: ListView(
          children: [
            // UserAccountsDrawerHeader is a widget that provides a pre-designed header for a drawer, typically used to display user information such as name, email, and profile picture. It is commonly used in applications that require user authentication or personalization.
            UserAccountsDrawerHeader(
              accountName: Text("Harshita"),
              accountEmail: Text("harshita@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.tealAccent,
                child: Text("H"),
              ),
            ),
            
            // DrawerHeader is a widget that provides a header for a drawer, typically used to display a title or other information at the top of the drawer. It is commonly used in applications that require navigation or additional options in a side panel.
            // DrawerHeader(child:Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Mar 5" , style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            //     IconButton(onPressed: (){
            //       // Navigator.pop(context);
            //       Navigator.of(context).pop();
            //     },icon: Icon(Icons.close),)
            //   ],
            // )),

            // listTile is a widget that represents a single row in a list, typically used for displaying information or providing navigation options. It is commonly used in applications that require a scrollable list of items or options.
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                changeScreen(0);
              },
            ),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) {
                      return Text("About Page");
                    },
                  ),
                );
              },
            ),
            ListTile(title: Text("Products"), leading: Icon(Icons.list)),
            ListTile(title: Text("Contact"), leading: Icon(Icons.email)),
          ],
        ),
      ),

      // BottomNavigationBar is a widget that provides a navigation bar at the bottom of the screen, typically used for navigating between different sections or pages of an application. It is commonly used in applications that require multiple screens or views, allowing users to easily switch between them.
      body: screens[activeIndex],

      // bottomNavigationBar is a property of the Scaffold widget in Flutter that allows you to add a navigation bar at the bottom of the screen. It is commonly used to provide quick access to different sections or pages of an application, allowing users to easily navigate between them. The bottomNavigationBar typically contains icons or labels representing different destinations, and it can be customized with various styles and behaviors to suit the needs of the application.
      bottomNavigationBar: NavigationBar(
        selectedIndex: activeIndex,
        onDestinationSelected: (value) {
          setState(() {
            activeIndex = value;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.search), label: "Search"),
          NavigationDestination(icon: Icon(Icons.person), label: "Account"),
          NavigationDestination(icon: Icon(Icons.message), label: "Messages"),
        ],
      ),
      
    );
  }
}
