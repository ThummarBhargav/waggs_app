import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/text_field.dart';
import '../controllers/my_account_controller.dart';

class MyAccountView extends GetView<MyAccountController> {
  const MyAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        // title: const Text('MyAccountView'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'My Profile',
                  style: GoogleFonts.lato(fontSize: 22,fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Divider(
              indent: 15,
              color: Colors.grey.shade500,
              endIndent: 15,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15),
                  child: TextFormField(
                        decoration:InputDecoration(
                          hintText:"You phone number here...",
                          border:InputBorder.none,
                          fillColor:Colors.white,
                      ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("NAME",style: TextStyle(fontSize: 15,color: Colors.grey.shade500),),
                      Text("NAME",style: TextStyle(fontSize: 15,color: Colors.grey.shade500),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("NAME",style: TextStyle(fontSize: 15,color: Colors.grey.shade500),),
                      Text("NAME",style: TextStyle(fontSize: 15,color: Colors.grey.shade500),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("NAME",style: TextStyle(fontSize: 15,color: Colors.grey.shade500),),
                      Text("NAME",style: TextStyle(fontSize: 15,color: Colors.grey.shade500),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("NAME",style: TextStyle(fontSize: 15,color: Colors.grey.shade500),),
                      Text("NAME",style: TextStyle(fontSize: 15,color: Colors.grey.shade500),),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
