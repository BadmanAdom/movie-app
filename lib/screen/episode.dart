import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/model/familyguy.dart';

class EpisodePage extends StatelessWidget {
  List<Episodes>? episodes;
  MyImage? myImage;
  BuildContext? context;

  // showSummary(String summary) {
  //   showDialog(
  //       // context: context,
  //       builder: (context) => Center(
  //           child: Container(
  //             padding: EdgeInsets.all(12),
  //             child: Card(
  //               child: Text(summary),
  //             ),
  //           )));
  // }

  EpisodePage({ this.episodes, this.myImage, this.context});

  @override
  Widget build(BuildContext context) {
    context = context;
    Widget myBody() {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.0),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            // showSummary();
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  child: Image.network(
                    '${episodes![index].image!.original}',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${episodes![index].name}',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(7)),
                      child: Text(
                          '${episodes![index].season} - ${episodes![index].number}'),
                    ))
              ],
            ),
            color: Colors.green,
          ),
        ),
        itemCount: episodes?.length,
      );
    }

    return Scaffold(
      body: myBody(),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Hero(
              tag: 'g1',
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                '${myImage!.medium}',
              )),
            ),
            SizedBox(
              width: 10,
            ),
            Text('All Episodes')
          ],
        ),
      ),
    );
  }


}
