import 'package:flutter/material.dart';

import 'package:pet_appointment_app/widgets/custom_clip.dart';
import 'package:pet_appointment_app/widgets/custom_textfeild.dart';

import 'training_contant_page.dart';

class TrainingDetailsPage extends StatefulWidget {
  //const TrainingDetailsPage({super.key});

  @override
  State<TrainingDetailsPage> createState() => _TrainingDetailsPageState();
}

class _TrainingDetailsPageState extends State<TrainingDetailsPage> {
  @override
  Widget build(BuildContext context) {
    List titleDetails = [
      {'image': 'assets/images/dog__.png', 'title': 'Trust'},
      {'image': 'assets/images/name_button.png', 'title': 'Name'},
    ];

    List basicDetails = [
      {'image': 'assets/images/small_dog.png', 'title': 'Sit'},
      {'image': 'assets/images/rgjx_y9yc_160715 1.png', 'title': 'Paw'},
      {'image': 'assets/images/47399 1.png', 'title': 'Down'},
      {'image': 'assets/images/dog_man 1.png', 'title': 'Stay'},
    ];

    List basic = [
      {
        'title': 'Trust',
        'hading':
            'A Dog should trust its owner. It shouldn’t be afraid of being touched and allow various manipulations, including help during learning of commands, ears cleaning, paws washing, nails trimming, etc.',
        'imgUrl': 'assets/images/dog__.png',
        'step': [
          {
            'stepNo': '1',
            'step':
                'Offer your dog a treat, holding it in one hand. With another hand, slightly and pleasantly pet the dog’s back. If a dog reacts calmly to your touches, reward it with a piece of a treat after each tactile stimulus'
          },
          {
            'stepNo': '2',
            'step':
                'If your dog reacts calmly to touches on the back, try touching its sides, neck, and belly. Continue rewarding your dog for a calm reaction.'
          },
          {
            'stepNo': '3',
            'step':
                "Pet the tail; touch your dog's face and paws. Reward it for a calm reaction"
          },
        ]
      },
      {
        'title': "Dog's Name",
        'hading':
            "It's important to teach a dog its name. A dog's name is more than just the word. It helps the dog focus on its owner.",
        'imgUrl': 'assets/images/name_button.png',
        'step': [
          {
            'stepNo': '1',
            'step':
                "Take a treat in your hand and sit in front of the dog. It will pay attention to the treat and start watching it. Move the hand with the treat closer to your face and say the dog's name. Keep it for several seconds to make sure your pet is watching you and give it the treat. Repeat it several times."
          },
          {
            'stepNo': '2',
            'step':
                "When the dog succeeds in focusing on you, repeat step 1 without taking the treat to your face. The dog should forget about the treat and look at you. Make eye contact for several seconds and then give the treat to the dog."
          },
          {
            'stepNo': '3',
            'step':
                "When the dog masters the art of ignoring the treat and focusing on you, make the task a bigger challenge. Say the dog's name while walking it and praise the pet for paying attention to you."
          },
        ]
      },
    ];
    List eseemsial = [
      {
        'title': 'Sit',
        'hading':
            "A Dog should trust its owner. It shouldn’t be afraid of being touched and allow various manipulations, including help during learning of commands, ears cleaning, paws washing, nails trimming, etc.",
        'imgUrl': 'assets/images/small_dog.png',
        'step': [
          {
            'stepNo': '1',
            'step': 'Step up to your dog. Hold a treat in your hand.'
          },
          {
            'stepNo': '2',
            'step':
                "Say 'Sit' and put your hand up. Then put it down behind the dog's head in such a way that your dog wants to sit."
          },
          {'stepNo': '3', 'step': "As soon as the dog sits, give it a treat."},
        ]
      },
      {
        'title': "Paw",
        'hading':
            'Learning the command "Paw" is good for the general development of the dog and will come in handy in daily life. For example, when grooming claws and washing paws. Note that if the dog has learned to give the right paw, this does not mean that it will also give the left one. You have to teach it to give each paw separately by entering different commands (for example, "Give paw" for the right and "Give another" for the left). ',
        'imgUrl': 'assets/images/rgjx_y9yc_160715 1.png',
        'step': [
          {
            'stepNo': '1',
            'step':
                "Sit in front of the dog. Clench the treat in your fist and bring it to the dog's chin. The pet will want to open your hand with its paw to get a treat. When the dog touches your hand with its paw, say 'Give paw' and open your fist. Let your pet eat the treat and praise it. Repeat this several times."
          },
          {
            'stepNo': '2',
            'step':
                "Say 'Sit' and put your hand up. Then put it down behind the dog's head in such a way that your dog wants to sit."
          },
          {
            'stepNo': '3',
            'step':
                "Once you've mastered the previous steps, practice them without the treat. Say 'Give paw' and immediately bring your hand to the dog. When it performs the command, don't wait for the dog to remove its paw; say 'Good dog' and give it a treat from the other hand."
          },
          {
            'stepNo': '4',
            'step':
                "You can transform the 'Paw' trick into a 'High five.' Say 'High five' and reach out with your palm towards the dog so that it can reach it. As soon as the dog touches your palm with its paw, praise it and give it a treat."
          }
        ]
      },
      {
        'title': 'Down',
        'hading':
            "'It is not an easy command, as the dog must take a passive posture. But if you are patient and work it out properly, you will see how useful it is in many situations. Let's take an example. The dog has crossed the road, and you need it to stay on the other side until the car passes. Give the command 'Down'. This command will work better than others because it is more difficult for a dog to break out of a prone position than when it stands or sits.",
        'imgUrl': 'assets/images/47399 1.png',
        'step': [
          {
            'stepNo': '1',
            'step':
                "Sit in front of the dog. Clench the treat in your fist, bring it up to the dog's nose, and when it gets interested in it, begin to lower your hand down slowly. When the dog lies down, reward it. Repeat 3-5 times and take a break"
          },
          {
            'stepNo': '2',
            'step':
                'You can start pronouncing the command when the dog has mastered the previous step. Say "Lie down" or "Down" and lower your hand with a treat down. As soon as the dog lies down, say "Good dog" and give it the treat. Repeat several times.'
          },
          {
            'stepNo': '3',
            'step':
                "Practice the exercise without a treat in your hand. Do not forget to praise the dog and give it a treat after each successful command completion."
          },
        ]
      },
      {
        'title': "Stay",
        'hading':
            "Stay's important to teach a dog its name. A dog's name is more than just the word. It helps the dog focus on its owner.",
        'imgUrl': 'assets/images/dog_man 1.png',
        'step': [
          {
            'stepNo': '1',
            'step':
                "Sit between your dog and the place. Hold a treat in your hand."
          },
          {
            'stepNo': '2',
            'step':
                "Say 'Stay!' and extend a straight hand with the treat to your dog. After this, move your hand to the 'place' smoothly and fix it there."
          },
          {
            'stepNo': '3',
            'step':
                "As soon as the dog reaches the designated place, give the treat to your dog."
          },
        ]
      },
    ];

    final screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Retrive information about the device's orientation
    final Orientation orientation = MediaQuery.of(context).orientation;
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListTile(
              leading: Image.asset('assets/images/dog_pet.png'),
              title: Text(
                'Essential',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              height: screenHeight * 0.25,

              //color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: titleDetails.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainingContantPage(
                                title: basic[index]['title'],
                                hading: basic[index]['hading'],
                                imgUrl: basic[index]['imgUrl'],
                                step: basic[index]['step'],
                              ),
                            ));
                      },
                      child: Container(
                        width: screenWidth / 3,
                        height: screenHeight / 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Color(0xFFFFEADE),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                                titleDetails[index]['image'].toString()),
                            Text(
                              titleDetails[index]['title'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ListTile(
              leading: Image.asset('assets/images/dog_pet.png'),
              title: Text(
                'Basic',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              height: screenHeight / 2.2,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: basicDetails.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 10.0, // spacing between items
                  mainAxisSpacing: 10.0, // spacing between rows
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainingContantPage(
                                title: eseemsial[index]['title'],
                                hading: eseemsial[index]['hading'],
                                imgUrl: eseemsial[index]['imgUrl'],
                                step: eseemsial[index]['step'],
                              ),
                            ));
                      },
                      child: Container(
                        width: screenWidth / 10,
                        height: screenHeight / 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Color(0xFFFFEADE),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                                image: AssetImage(
                                    basicDetails[index]['image'].toString())),
                            Text(
                              basicDetails[index]['title'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
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
