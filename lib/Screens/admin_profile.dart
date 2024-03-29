import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hackxite/controller/add_to_chat.dart';

class OldAgeHomeDetailsScreen extends StatefulWidget {
  final String uid;
  const OldAgeHomeDetailsScreen({super.key, required this.uid});

  @override
  State<OldAgeHomeDetailsScreen> createState() =>
      _OldAgeHomeDetailsScreenState();
}

class _OldAgeHomeDetailsScreenState extends State<OldAgeHomeDetailsScreen> {

  Future<DocumentSnapshot> getOldAgeHomeDetails() async {
    print('this is widget uid ${widget.uid}');
    // Specify your document ID and collection path
    return FirebaseFirestore.instance.collection('users').doc(widget.uid).get();
  }

  

  String? name;

  @override
  Widget build(BuildContext context) {
    AddChat addChat = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        scrolledUnderElevation: 0,
      ),
      body: FutureBuilder(
        future: getOldAgeHomeDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
                child: Text("Error fetching data: ${snapshot.error}"));
          }
          if (!snapshot.hasData) {
            return Center(child: Text("No data available"));
          }

          var data = snapshot.data!.data() as Map<String, dynamic>;

          return Container(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    minRadius: 50,
                    backgroundImage: NetworkImage(data['profImg']),
                  ),
                  SizedBox(height: 30),
                  Text(
                    data['description'],
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {},
                        child: Text('Message'),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          print('data is this ${data['users']}');
                          print(data);
                          addChat.addToChat(
                             data['userMail'],
                              FirebaseAuth.instance.currentUser!.uid,
                              data['useruid'].toString());
                        },
                        child: Text('Add to chat'),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {},
                        child: Text('Email'),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://imgs.search.brave.com/QfLcnmEnFLKNUf5Xu-VKPOCmYtVDQxddeUXP9rKw5XQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3cy4xMjNyZi5j/b20vaW1hZ2VzL2Jp/YWxhc2lld2ljei9i/aWFsYXNpZXdpY3ox/NTA2L2JpYWxhc2ll/d2ljejE1MDYwMDc4/Mi80ODE2Nzc2MS1o/YXBweS1wZW9wbGUt/YmVpbmctaW4tcmVs/YXRpb25zaGlwLWlu/LW9sZC1hZ2UuanBn'),
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
