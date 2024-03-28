import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OldAgeHomeDetailsScreen extends StatefulWidget {
  const OldAgeHomeDetailsScreen({super.key});

  @override
  State<OldAgeHomeDetailsScreen> createState() =>
      _OldAgeHomeDetailsScreenState();
}

class _OldAgeHomeDetailsScreenState extends State<OldAgeHomeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OldAge Home Name'),
        scrolledUnderElevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                minRadius: 50,
                backgroundImage: NetworkImage(
                    'https://imgs.search.brave.com/QfLcnmEnFLKNUf5Xu-VKPOCmYtVDQxddeUXP9rKw5XQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3cy4xMjNyZi5j/b20vaW1hZ2VzL2Jp/YWxhc2lld2ljei9i/aWFsYXNpZXdpY3ox/NTA2L2JpYWxhc2ll/d2ljejE1MDYwMDc4/Mi80ODE2Nzc2MS1o/YXBweS1wZW9wbGUt/YmVpbmctaW4tcmVs/YXRpb25zaGlwLWlu/LW9sZC1hZ2UuanBn'),
              ),
              SizedBox(height: 30),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in. A diam sollicitudin tempor id eu nisl. Sagittis vitae et leo duis ut diam quam nulla porttitor. In mollis nunc sed id semper risus in hendrerit',
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
                    onPressed: () {},
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
                       
                        border: Border.all(
                          color: Colors.white
                        ),
                        image: DecorationImage(image: NetworkImage('https://imgs.search.brave.com/QfLcnmEnFLKNUf5Xu-VKPOCmYtVDQxddeUXP9rKw5XQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9wcmV2/aWV3cy4xMjNyZi5j/b20vaW1hZ2VzL2Jp/YWxhc2lld2ljei9i/aWFsYXNpZXdpY3ox/NTA2L2JpYWxhc2ll/d2ljejE1MDYwMDc4/Mi80ODE2Nzc2MS1o/YXBweS1wZW9wbGUt/YmVpbmctaW4tcmVs/YXRpb25zaGlwLWlu/LW9sZC1hZ2UuanBn'
                        
                        ),
                        fit: BoxFit.cover
                        )
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
