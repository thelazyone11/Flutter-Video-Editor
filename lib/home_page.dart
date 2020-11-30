import 'dart:io';

import 'package:example/trimmer_view.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_trimmer/video_trimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final Trimmer _trimmer = Trimmer();
  final ImagePicker imagePicker = ImagePicker();

  void _showDilog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Video Editor Flutter"),
            content: Text(
              "Video Editor Flutter Application. This App let you trim and save the video from gallery and camera. For more information contact divyaratnabhanse@gmail.com\n\n"
              "Bugs:\n\n"
              "1. Slider in video editor screen not working properly for some videos picked from gallery",
              style: TextStyle(fontSize: 12),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("Okay")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromRGBO(105, 105, 105, 1),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Friend",
                    style: TextStyle(
                      fontSize: 38,
                      fontFamily: "RobotoMonoBold",
                    ),
                  ),
                  Text(
                    "Lets create something new!",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () async {
                          PickedFile file = await imagePicker.getVideo(
                            source: ImageSource.gallery,
                          );
                          if (file != null) {
                            await _trimmer.loadVideo(
                                videoFile: File(file.path));
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return TrimmerView(_trimmer);
                            }));
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 80,
                            //padding: EdgeInsets.symmetric(horizontal: 10),
                            width:
                                (MediaQuery.of(context).size.width * 0.5) - 20,
                            color: Colors.pinkAccent,
                            child: Center(child: Text("Gallery")),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          PickedFile file = await imagePicker.getVideo(
                            source: ImageSource.camera,
                          );
                          if (file != null) {
                            await _trimmer.loadVideo(
                                videoFile: File(file.path));
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return TrimmerView(_trimmer);
                            }));
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 80,
                            width:
                                (MediaQuery.of(context).size.width * 0.5) - 20,
                            //padding: EdgeInsets.symmetric(horizontal: 10),
                            color: Colors.pink,
                            child: Center(child: Text("Camera")),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () async {
                            const url =
                                'https://github.com/thelazyone11/Flutter-Video-Editor';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Container(
                            height: 80,
                            //padding: EdgeInsets.symmetric(horizontal: 10),
                            width:
                                (MediaQuery.of(context).size.width * 0.5) - 20,
                            color: Colors.deepOrange[300],
                            child: Center(child: Text("Github")),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () => _showDilog(context),
                          child: Container(
                            height: 80,
                            width:
                                (MediaQuery.of(context).size.width * 0.5) - 20,
                            //padding: EdgeInsets.symmetric(horizontal: 10),
                            color: Colors.deepOrange,
                            child: Center(child: Text("Project Detail")),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Text("© Divyaratna Bhanse"),
      ],
    ));
  }
}

// RaisedButton(
//             child: Text("LOAD VIDEO"),
//             onPressed: () async {
//               PickedFile file = await imagePicker.getVideo(
//                 source: ImageSource.gallery,
//               );
//               if (file != null) {
//                 await _trimmer.loadVideo(videoFile: File(file.path));
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                   return TrimmerView(_trimmer);
//                 }));
//               }
//             },
//           ),
