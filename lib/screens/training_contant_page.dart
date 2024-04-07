import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_appointment_app/widgets/custom_clip.dart';
import '../widgets/custom_textfeild.dart';

class TrainingContantPage extends StatefulWidget {
  TrainingContantPage({
    required this.title,
    required this.hading,
    required this.step,
    required this.imgUrl,
  });

  String title;
  String hading;
  List step;
  String imgUrl;

  @override
  State<TrainingContantPage> createState() => _TrainingContantPageState();
}

class _TrainingContantPageState extends State<TrainingContantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 200,
        flexibleSpace: ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffBCF4DC),
            child: Center(
              child: Text(
                "Training &\nExercises",
                style: customTextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffFFEADE),
                        borderRadius: BorderRadius.circular(21)),
                    child: Text(
                      "   ${widget.title}    ",
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.hading,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage(widget.imgUrl)),
              ],
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * .5,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.step.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Step -${widget.step[index]['stepNo']}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Text(
                          widget.step[index]['step'],
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
