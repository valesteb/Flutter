import 'package:flutter/material.dart';
import 'package:portafolio/pages/page02.dart';

class PaginaProfile extends StatefulWidget {
  const PaginaProfile({super.key});

  @override
  State<PaginaProfile> createState() => _PaginaProfileState();
}

class _PaginaProfileState extends State<PaginaProfile> {
  @override
  Widget build(BuildContext context)
    return  Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://e1.pxfuel.com/desktop-wallpaper/551/84/desktop-wallpaper-universe-for-mobile-space-for-mobile.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
              Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(),
                  ),
                  Text("Profile", style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
        ),
      );

  }
}