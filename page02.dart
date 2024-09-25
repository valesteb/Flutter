import 'package:flutter/material.dart';
import 'package:portafolio/pages/profile.dart';

class Page02 extends StatefulWidget {
  @override
  State<Page02> createState() => _Page02State();
}

class _Page02State extends State<Page02> {

  int _currentPage = 0;
  List<Widget> _paginas = [
    PageHome(),
    PaginaProfile(),
  ];
  List<Options> _options = [
    Options("Account"),
    Options("Settings"),
    Options("Subscriptions"),
    Options("Preferences"),
    Options("Make a gift"),
    Options("About"),
  ];
  @override
  Widget build(BuildContext context){
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Página 2"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.trip_origin_sharp),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(),
                    body: ListView.builder(
                        itemCount: _options.length,
                        itemBuilder: (context, index){
                      return Text(_options[index].option,);
                    }
                    )
                  );
                },
              ));
            },
          ),
        ],
      ) ,
      body: _paginas[_currentPage],


      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _currentPage = index;
          });
        },
        currentIndex: _currentPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "HOME"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "PROFILE")
        ],
      ),
    ),
    );
  }
}

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://e1.pxfuel.com/desktop-wallpaper/551/84/desktop-wallpaper-universe-for-mobile-space-for-mobile.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
        child: Text("Home", style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
        ),
       ),
      ),
    );
  }
}
class Options {
  String option = "";


  Options(option1){
    this.option = option1;


  }
}
