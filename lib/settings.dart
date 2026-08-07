import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key,});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late final VoidCallback onToggleTheme;
  bool isSwitched = true;


  @override
  Widget build(BuildContext context) {
    late double h = MediaQuery.of(context).size.height;
    late double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body:Center(
            child: Container(
                width: w*1,
                height: h*1,
                clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color:isSwitched? Colors.white: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 4,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Stack(
                  children: [
              SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0058BE),
                    ),
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: const NetworkImage(
                      'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=100&auto=format&fit=crop&q=80',
                    ),
                  ),
                ],
              ),
                   SizedBox(height: h*0.05),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          height: h*0.4,
                          width: w*1,
                          decoration: BoxDecoration(
                            border: Border.all(color: isSwitched? Colors.white: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                              color:isSwitched? Colors.white: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                color: isSwitched? Colors.grey:Colors.black,
                                blurRadius:2,
                                offset: Offset(1, 4))
                            ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor:Color(0xff0058BE),
                          backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=100&auto=format&fit=crop&q=80',
                                ),
                                radius: 60,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top:75,
                                      left: 80,
                                      right: 0,
                                      child: Container(
                                      height: h*0.05,
                                      width: w*0.04,
                                      decoration: BoxDecoration(
                                        color: Color(0xff2170E4),
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                          border: Border.all(
                                            width: w*0.009,
                                            color:isSwitched? Colors.white: Colors.black,
                                          ),boxShadow: [
                                            BoxShadow(

                                            )]
                                      ),
                                      child: Icon(Icons.edit_outlined,color: Colors.white,),
                                      ),
                                    ),]
                                ),
                              ),
                              SizedBox(height: h*0.03),

                              Text('Janan',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: w*0.09,
                                color:isSwitched? Colors.black: Colors.white,
                              ),), Text("jana@gmail.com",
                                style: TextStyle(
                                  color:isSwitched? Colors.black: Colors.white,
                                ),
                              ),
                              SizedBox(height: h*0.03),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w*0.04,
                                    vertical: h*0.008,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xff2170E4),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('Edit Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                                ),),
                              ),

                            ],

                          ),

                        ),
                      ),
                      SizedBox(height: h*0.04),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: h*0.08,
                          width: w*1,
                          decoration: BoxDecoration(
                            border: Border.all(color: isSwitched? Color(0xffEFF4FF): Colors.white),
                            color:isSwitched? Color(0xffEFF4FF) : Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: h*0.055,
                                  width: w*0.11,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: isSwitched? Colors.white: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                      color:isSwitched?  Color(0xffD8E2FF): Colors.black,
                                      ),
                                  child: Center(
                                    child: Image.asset('assets/images/Icon.png'),
                                  ),),
                              ),
                              SizedBox(width: w*0.02,),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Theme',style: TextStyle(
                                          color:isSwitched? Colors.black: Colors.white,
                                        fontSize: w*0.04
                                      ),),
                                      Text('Switch between light and dark',
                                      style: TextStyle(
                                        color:isSwitched? Colors.black: Colors.white,
                                      ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: w*0.03,),
                              IconButton(
                                icon: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  transitionBuilder: (child, animation) => RotationTransition(
                                    turns: animation,
                                    child: ScaleTransition(scale: animation, child: child),
                                  ),
                                  child: isSwitched
                                      ? const Icon(Icons.nightlight_round, key: ValueKey('dark'), color: Colors.amber)
                                      : const Icon(Icons.wb_sunny_rounded, key: ValueKey('light'), color: Colors.orange),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isSwitched = !isSwitched;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: h*0.06),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: h*0.07,
                          width: w*1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Color(0xFFFFDAD6),
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.output,color:Color(0xFFBA1A1A),),
                              SizedBox(width: w*0.02,),
                              Text("Logout",style: TextStyle(
                                color: Color(0xFFBA1A1A),
                                fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        ),
                      ),

                    ],

                  ),
                ]
              )
              )
                  ])
            )
        )




      ),
    );
  }
}
