import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_session_management/homepage.dart';
import 'package:provider_session_management/dataclass.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfefcff),
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Consumer<DataClass>(builder: (context, data, child) {
                        return Text(
                          '${data.x}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        );
                      }),
                      const Text(
                        "-- Total",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (Provider.of<DataClass>(context, listen: false).x <=
                            0) {
                          Get.snackbar("Item", "Can not decrease more",
                              backgroundColor: Colors.black,
                              colorText: Colors.white,
                              titleText: Text(
                                "Item",
                                style: TextStyle(
                                    fontSize: 40, color: Colors.white),
                              ),
                              messageText: Text(
                                "Can not reduce more",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ));
                        } else {
                          Provider.of<DataClass>(context, listen: false)
                              .decrementX();
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        child: const Icon(Icons.remove),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1, color: const Color(0xFF716f72))),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => HomePage(),
                                transition: Transition.downToUp,
                                duration: Duration(seconds: 1));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(Icons.skip_previous,
                                  color: Color(0xFFfefeff)),
                              Text(
                                "Prev Page",
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xFFfefeff)),
                              ),
                            ],
                          ),
                        ),
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
