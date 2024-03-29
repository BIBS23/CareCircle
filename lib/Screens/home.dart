import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hackxite/Screens/admin_profile.dart';
import 'package:hackxite/controller/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;
  AuthController auth = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CareCircle'),
        centerTitle: true,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Text('Recent Story'),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Image.network(
                              'https://imgs.search.brave.com/QfLcnmEnFLKNUf5Xu-VKPOCmYtVDQxddeUXP9rKw5XQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3cy4xMjNyZi5j/b20vaW1hZ2VzL2Jp/YWxhc2lld2ljei9i/aWFsYXNpZXdpY3ox/NTA2L2JpYWxhc2ll/d2ljejE1MDYwMDc4/Mi80ODE2Nzc2MS1o/YXBweS1wZW9wbGUt/YmVpbmctaW4tcmVs/YXRpb25zaGlwLWlu/LW9sZC1hZ2UuanBn',
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withOpacity(0.4)
                                      ],
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topLeft),
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 0,
                              bottom: 10,
                              left: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'UserName',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                  CircleAvatar(
                                    minRadius: 15,
                                    backgroundImage: NetworkImage(
                                        'https://imgs.search.brave.com/QfLcnmEnFLKNUf5Xu-VKPOCmYtVDQxddeUXP9rKw5XQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3cy4xMjNyZi5j/b20vaW1hZ2VzL2Jp/YWxhc2lld2ljei9i/aWFsYXNpZXdpY3ox/NTA2L2JpYWxhc2ll/d2ljejE1MDYwMDc4/Mi80ODE2Nzc2MS1o/YXBweS1wZW9wbGUt/YmVpbmctaW4tcmVs/YXRpb25zaGlwLWlu/LW9sZC1hZ2UuanBn'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return Card(
                      clipBehavior: Clip.hardEdge,
                      elevation: 5,
                      child: Padding(
                        padding:  EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OldAgeHomeDetailsScreen(uid: documentSnapshot['uid'],),
                                  ),
                                );
                              },
                              child:  Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                       documentSnapshot['profImg']),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(documentSnapshot['name']),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                documentSnapshot['postImg'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(documentSnapshot['description'],textAlign: TextAlign.justify,),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
