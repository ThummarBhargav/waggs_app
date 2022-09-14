import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waggs_app/app/constant/Container.dart';
import 'package:waggs_app/app/routes/app_pages.dart';

import '../../../../main.dart';
import '../../../constant/ConstantUrl.dart';
import '../../../constant/text_field.dart';
import '../controllers/my_account_controller.dart';

class MyAccountView extends GetView<MyAccountController> {
  const MyAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.HOME);
        return await true;
      },
      child: Scaffold(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'My Profile',
                    style: GoogleFonts.lato(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Divider(
                indent: 15,
                color: Colors.grey.shade500,
                endIndent: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NAME",
                      style:
                          TextStyle(fontSize: 15, color: Colors.grey.shade500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "${box.read(ArgumentConstant.name)}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        getcon(
                            height: 30,
                            width: 120,
                            color: Colors.grey.shade300,
                            alignment: Alignment.center,
                            text: Text(
                              "Change Name",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500),
                            ))
                      ],
                    ),
                    Divider(color: Colors.black, height: 5, endIndent: 120),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "EMAIL",
                      style:
                          TextStyle(fontSize: 15, color: Colors.grey.shade500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "${box.read(ArgumentConstant.email)}",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.check,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "PHONE",
                      style:
                          TextStyle(fontSize: 15, color: Colors.grey.shade500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "${box.read(ArgumentConstant.phone)}",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.check,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "ADDRESS",
                      style:
                          TextStyle(fontSize: 15, color: Colors.grey.shade500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              "${box.read(ArgumentConstant.address)}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "PASSWORD",
                      style:
                          TextStyle(fontSize: 15, color: Colors.grey.shade500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "*********",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.sendOtp();
                          },
                          child: getcon(
                              height: 30,
                              width: 150,
                              color: Colors.orange,
                              alignment: Alignment.center,
                              text: Text(
                                "Change Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 5,
                      endIndent: 150,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
