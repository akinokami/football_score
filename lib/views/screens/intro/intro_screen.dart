import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: primaryColor
          ),
          child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                Text("What sport do you interested ?",style: TextStyle(color: whiteColor,fontSize: 30),),
                SizedBox(height: 20,),
                Text("You can choose more than one",style: TextStyle(color: greyColor,fontSize: 20),),
                SizedBox(height: 20,),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.5,
                        crossAxisCount: 2
                    ),
                    itemBuilder: (context,index){
                      return Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("Sport $index",style: TextStyle(color: whiteColor,fontSize: 20),),
                        ),
                      );
                    }
                ),
                SizedBox(height: 20,),

              ],
            ),
          )
        )
    );
  }
}
