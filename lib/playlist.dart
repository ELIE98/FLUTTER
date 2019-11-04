import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nan_player/mydrawer.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Playlist extends StatefulWidget {
  Playlist({this.title, this.url});
  final String title;
  final String url;
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  Future<List> getData() async {
    final response = await http.get(widget.url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MyDrawer(),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListVideo(
                  list: snapshot.data,
                )
              : Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
}

class ListVideo extends StatelessWidget {
  List list;
  ListVideo({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => VideoPlay(url: "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}",))),
                child: Container(
                  height: 210.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            list[i]['snippet']['thumbnails']['high']['url']),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Text(
                list[i]['snippet']['title'],
                style: TextStyle(fontSize: 18.0),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Divider()
            ],
          ),
        );
      },
    );
  }
}

class VideoPlay extends StatelessWidget {
  final String url;
  VideoPlay({this.url});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebviewScaffold(
        url: url,
      ),
    );
  }
}
