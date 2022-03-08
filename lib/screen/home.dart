import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/model/familyguy.dart';
import 'package:http/http.dart' as http;
import 'package:movies/screen/episode.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FamilyGuy? _familyGuy;
  String url =
      'https://api.tvmaze.com/singlesearch/shows?q=family+guy&embed=episodes';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchEpisode();
  }

  fetchEpisode() async {
    var response = await http.get(Uri.parse(url));
    var decodeRes = jsonDecode(response.body);
    print(decodeRes);
    _familyGuy = FamilyGuy.fromJson(decodeRes);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {},
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text('Family Guy'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }

  Widget Body() {
    return _familyGuy == null
        ? Center(
      child: CircularProgressIndicator(),
    )
        : Container(
      child: myCard(),
    );
  }

  Widget myCard() {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage('${_familyGuy?.image!.original}'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '${_familyGuy!.name}',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Runtime: ${_familyGuy!.runtime.toString()} minutes',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '${_familyGuy!.summary}',
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  =>
                      EpisodePage(
                        episodes: _familyGuy!.eEmbedded!.episodes,
                        myImage: _familyGuy!.image,
                      )
                  )
                  );
                },
                style: ButtonStyle(),
                child: Text('All Episodes'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
