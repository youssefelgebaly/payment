import 'package:flutter/material.dart';
import 'package:payment/view/screen/transctions_screen.dart';
import 'package:payment/view/widgets/user_avater.dart';

import '../../model/user.dart';
class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserAvater(user: UserList.users.first, radius: 25),
            ),
            SizedBox(width: 16),
            Text('Payment', style: TextStyle(
                fontSize: 20,
                color: Colors.black
            ),),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/3.7,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(28)
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/3.8,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(28)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                  "Hello, ${UserList.users.first.name}",
                                  style: TextStyle(color: Colors.white, fontSize: 14),
                                ),
                                const Text(
                                  "Balance",
                                  style: TextStyle(color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),

                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              r'''$8554.00''',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  transitionDuration:
                                  const Duration(milliseconds: 800),
                                reverseTransitionDuration: const Duration(milliseconds: 800),
                                opaque: false,
                                pageBuilder: (context, animation, _) {
                                  return const TransactionsPage();
                                },
                            ),
                            );
                          },
                          child:Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Transaction', style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black
                                ),),
                                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,),
                              ],
                            ),

                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: const [

            ],
          )
        ],
      )
    );
  }
}
