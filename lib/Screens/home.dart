import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hackxite/Screens/oldage_home_details_page.dart';
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
        title: Text('CareCircle'),
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
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
                            Positioned(
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.hardEdge,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OldAgeHomeDetailsScreen(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://imgs.search.brave.com/QfLcnmEnFLKNUf5Xu-VKPOCmYtVDQxddeUXP9rKw5XQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3cy4xMjNyZi5j/b20vaW1hZ2VzL2Jp/YWxhc2lld2ljei9i/aWFsYXNpZXdpY3ox/NTA2L2JpYWxhc2ll/d2ljejE1MDYwMDc4/Mi80ODE2Nzc2MS1o/YXBweS1wZW9wbGUt/YmVpbmctaW4tcmVs/YXRpb25zaGlwLWlu/LW9sZC1hZ2UuanBn'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('user Name'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://imgs.search.brave.com/QfLcnmEnFLKNUf5Xu-VKPOCmYtVDQxddeUXP9rKw5XQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3cy4xMjNyZi5j/b20vaW1hZ2VzL2Jp/YWxhc2lld2ljei9i/aWFsYXNpZXdpY3ox/NTA2L2JpYWxhc2ll/d2ljejE1MDYwMDc4/Mi80ODE2Nzc2MS1o/YXBweS1wZW9wbGUt/YmVpbmctaW4tcmVs/YXRpb25zaGlwLWlu/LW9sZC1hZ2UuanBn',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in. A diam sollicitudin tempor id eu nisl. Sagittis vitae et leo duis ut diam quam nulla porttitor. In mollis nunc sed id semper risus in hendrerit. Nisi quis eleifend quam adipiscing vitae proin. Aliquam sem et tortor consequat id porta. Nibh venenatis cras sed felis eget velit aliquet sagittis id. Morbi enim nunc faucibus a pellentesque sit amet. Est lorem ipsum dolor sit amet consectetur adipiscing elit. Eu consequat ac felis donec. Morbi tristique senectus et netus et malesuada.'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
