import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key,});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late bool isDarkMode;
  late final VoidCallback onToggleTheme;


  @override
  Widget build(BuildContext context) {
    late double h = MediaQuery.of(context).size.height;
    late double w = MediaQuery.of(context).size.width;

    bool isSwitched = false;
    return SafeArea(
      child: Scaffold(
        body:Center(
            child: Container(
                width: w*1,
                height: h*1,
                clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
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
                            borderRadius: BorderRadius.circular(
                              20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
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
                                      child: Icon(Icons.edit_outlined,color: Colors.white,),
                                      decoration: BoxDecoration(
                                        color: Color(0xff2170E4),
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                          border: Border.all(
                                            width: w*0.009,
                                            color: Colors.white
                                          ),boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius:2,
                                                offset: Offset(1, 4))
                                          ]
                                      ),
                                                            ),
                                    ),]
                                ),
                              ),
                              SizedBox(height: h*0.03),

                              Text('Janan',style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: w*0.09,
                                color: Color(0xff0B1C30)
                              ),), Text("jana@gmail.com",
                                style: TextStyle(
                                  color: Color(0xff727785),
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
                            color: Color(0xffEFF4FF),
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
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffD8E2FF),),

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
                                        color: Color(0xff0B1C30),
                                        fontSize: w*0.04
                                      ),),
                                      Text('Switch between light and dark',
                                      style: TextStyle(color: Color(0xff727785)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: w*0.03,),
                              Switch(
                                  value: isSwitched,
                                onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                },
                              ),
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
