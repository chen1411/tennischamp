import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../data/urls.dart';
class TutorialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final title = routeArgs['title'];
    final url = lessonVideo[title];
    final id = YoutubePlayer.convertUrlToId(url);
    final controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
    ),
  );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        leading: BackButton(onPressed:  () {
          Navigator.pushNamed(context,'/',);
        }),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 250, 10, 40),
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: YoutubePlayer(
                controller: controller,
                liveUIColor: Colors.amber,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff754E46)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.fromLTRB(70, 10, 70, 10)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)))),
              child: Text('Practice', style: TextStyle(fontSize: 20, fontFamily: "Poppins")),
              onPressed:  () {
                // ReportUI.goUserTabs(context);
                Navigator.pushNamed(context,'/practice',);
              }
            ),
          ],
        )
      ),
    );
  }
  
}