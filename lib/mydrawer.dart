import 'package:flutter/material.dart';
import 'package:nan_player/playlist.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "HOME",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Divider(),
            ListMenu(title: "PROJETS_NaN",url: "https://nansearch.herokuapp.com/",),
          ],
        ),
      ),
    );
  }
}

class ListMenu extends StatelessWidget {
  ListMenu({this.title,this.url});
  final String title;
  final String url;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.video_library),
      title: Text(
        title,
        style: TextStyle(fontSize: 18.0),
      ),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            new Playlist(url:url, title: title),
      )),
    );
  }
}
