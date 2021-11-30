

// ignore_for_file: import_of_legacy_library_into_null_safe



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart' show Feather, Ionicons;
import 'package:task_6_1/pages/signup_page.dart';
import 'package:task_6_1/server/hive_db.dart';
import 'package:task_6_1/widgets/rounded_button.dart';
import 'package:task_6_1/widgets/textfields.dart';
import 'package:toast/toast.dart';

  class Sign_In_page extends StatefulWidget {
    final String id = "sing_In_page";
    const Sign_In_page({ Key? key }) : super(key: key);
  
    @override
    _Sign_In_pageState createState() => _Sign_In_pageState();
  }
  
  class _Sign_In_pageState extends State<Sign_In_page> {

    double user_image_size = 0.0;
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    String db_name = "hive1";
    String db_email_key = "email";
    String db_pass_key = "password";


    @override
    Widget build(BuildContext context) {
      user_image_size = MediaQuery.of(context).size.width / 6;
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          color: Color.fromARGB(255,26,29,55),

          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // @user image container
                    SizedBox(
                      height: (MediaQuery.of(context).size.height / 4) + 20,
                      width: double.infinity,                
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: user_image_size,
                          width: user_image_size + 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular((user_image_size / 5) + 5),
                            image: DecorationImage(
                              image: AssetImage('assets/images/bill_gates.png'),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // @Welcome back text
                    Text("Welcome Back!", style: TextStyle(
                      color: Color.fromARGB(255,246,247,248),
                      fontSize: 30.0,   
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5
                    ),),
                    SizedBox(height: 5.0),
                    // @Sign in to ....
                    Text("Sign in to continue", style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,   
                      letterSpacing: 0.8
                    ),),
                     SizedBox(height: 64.0),
                    // @text fields 
                    // if you enter false Transform.rotate run
                    TextFieldBuilder( "User Name", controller1, Feather.user, false),
                     SizedBox(height: 28.0),
                    TextFieldBuilder( "Password", controller2, Ionicons.ios_key, true),
                     SizedBox(height: 25.0),
                     // @forgot .... text
                    Text("Forgot Password?", 
                    style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w700, letterSpacing: 1.2),), 
                     SizedBox(height: 50.0),
                     // @round button
                     RoundedButton(
                       user_image_size + 4, 
                       Padding(
                         padding: const EdgeInsets.all(1.0),
                         child: MaterialButton(
                           height: double.infinity,
                           onPressed:_save_info,
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
                           Text("Don't have an account?", 
                           style: TextStyle(color: Colors.white54, fontWeight: FontWeight.w700, fontSize: 15.0, letterSpacing: 1.3),),
                           SizedBox(width: 5.0),
                           InkWell(
                             onTap: (){
                               Navigator.pushNamed(context, Sign_Up_page().id);
                             },
                             child: Text("SIGN UP",
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
    void showToast(String text){
      Toast.show(
        text, 
        context,
        gravity: Toast.BOTTOM,
        duration: 2        
        );
    }
    void _save_info(){
       if (controller1.text.isNotEmpty && controller2.text.isNotEmpty){
          Hive_db().setObject_Save(db_email_key, controller1.text.trim(), db_name);
          Hive_db().setObject_Save(db_pass_key, controller2.text.trim(), db_name);}
                             
          String username = Hive_db().loadStore(db_email_key, db_name);
          String password = Hive_db().loadStore(db_pass_key, db_name);

          print(username);
          print(password);
          showToast("User name: $username \n Password: $password");
    }
   
  }