import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:task_6_1/pages/signin_page.dart';
import 'package:task_6_1/server/hive_db.dart';
import 'package:task_6_1/widgets/rounded_button.dart';
import 'package:task_6_1/widgets/textfields.dart';

  class Sign_Up_page extends StatefulWidget {
    final String id = "sing_Up_page";
    const Sign_Up_page({ Key? key }) : super(key: key);
  
    @override
    _Sign_Up_pageState createState() => _Sign_Up_pageState();
  }
  
  class _Sign_Up_pageState extends State<Sign_Up_page> {

    double user_image_size = 0.0;
    
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();
    List<String> loadKeys = ['userName', 'email', 'phone', "password"];
    String db_name = "hive2";
    
    
    @override
    Widget build(BuildContext context) {
      user_image_size = MediaQuery.of(context).size.width / 6;
      return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            color: Color.fromARGB(255,26,29,55),

            child: Stack(
              children: [
                Column(
                  children: [
                    // @ create account text
                    SizedBox(
                      height: (MediaQuery.of(context).size.height / 4) + 20,           
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Create", style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 1.2),),
                          Text("Account", style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 1.2),),
                        ],
                      )
                    ),
                    SizedBox(height: 65.0),

                    // @ main textfield board
                    TextFieldBuilder( "User Name", controller1, Feather.user, false),
                    SizedBox(height: 28.0),
                    TextFieldBuilder( "E-Mail", controller2, Icons.mail_outline, false),
                    SizedBox(height: 28.0),
                    TextFieldBuilder( "Phone Number", controller3, CupertinoIcons.phone, false, true),
                    SizedBox(height: 28.0),
                    TextFieldBuilder( "password", controller4, Ionicons.ios_key, true),
                    SizedBox(height: 50.0),
                    // round blue button
                    RoundedButton(
                             user_image_size + 4, 
                             Padding(
                               padding: const EdgeInsets.all(1.0),
                               child: MaterialButton(
                                 height: double.infinity,
                                 onPressed: _save_info,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular((user_image_size + 4)/2)
                                 ),
                                child: Icon(CupertinoIcons.arrow_right, size: 40, color: Colors.white, )
                               ),
                             )
                           ),             
                  ],
                ),
                // @Don't have an account...
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisSize: MainAxisSize.max,
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("Alread have an account?", 
                             style: TextStyle(color: Colors.white54, fontWeight: FontWeight.w700, fontSize: 15.0, letterSpacing: 1.3),),
                             SizedBox(width: 5.0),
                             InkWell(
                               onTap: (){
                                 Navigator.pushReplacementNamed(context, Sign_In_page().id);
                               },
                               child: Text("SIGN IN",
                               style: TextStyle(color: Colors.blue[600], fontWeight: FontWeight.w800, fontSize: 14.0, letterSpacing: 0.8),),
                             ),
                           ],
                         ),
                         SizedBox(height: 42.0)
            
                       ],
                     ),
                   )
              ],
            ),
            
          ),
        ),
      );
    }
    void _save_info(){
      if(controller1.text.isNotEmpty && controller2.text.isNotEmpty &&
         controller3.text.isNotEmpty && controller4.text.isNotEmpty){
           Hive_db().setObject_Save(loadKeys[0], controller1.text.trim(), db_name);
           Hive_db().setObject_Save(loadKeys[1], controller2.text.trim(), db_name);
           Hive_db().setObject_Save(loadKeys[2], controller3.text.trim(), db_name);
           Hive_db().setObject_Save(loadKeys[3], controller4.text.trim(), db_name);
         }
          print(Hive_db().loadStore(loadKeys[0], db_name));
          print(Hive_db().loadStore(loadKeys[1], db_name));
          print(Hive_db().loadStore(loadKeys[2], db_name));
          print(Hive_db().loadStore(loadKeys[3
          ], db_name));
    }
  }