
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:screen_protector/screen_protector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {  


  void _preventRecording() async{
    if(Platform.isAndroid){
      await ScreenProtector.protectDataLeakageOn();
    }
    else if(Platform.isIOS){
      await ScreenProtector.preventScreenshotOn();
    }
  }

  void _allowRecording() async{
    if(Platform.isAndroid){
      await ScreenProtector.protectDataLeakageOff();
    }
    else if(Platform.isIOS){
      await ScreenProtector.preventScreenshotOff();
    }
  }


  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _preventRecording();
  }

  @override
  void dispose() {
  
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _allowRecording();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/person.png"),
                ),

                Column(
                  children: [
                    Text("Posts"),
                    Text("10")
                  ],
                ),
                Column(
                  children: [
                    Text("Followers"),
                    Text("50")
                  ],
                ),
                Column(
                  children: [
                    Text("Followeing"),
                    Text("70")
                  ],
                ),
              ],
            ),
        
            const Align(
              alignment: Alignment.topLeft,
              child: Text("Faisal Abdelnaser")),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                                
                        
                      ),
                      onPressed: (){}, 
                      child: const Text("Follow", style: TextStyle(color: Colors.white),)),
                  ),
              
                  const SizedBox(width: 20,),
                  
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))
                        
                      ),
                      onPressed: (){}, 
                      child: const Text("Message", style: TextStyle(color: Colors.black),)),
                    ),
                ],
              ),
            ),

            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  ),
                  children: List.generate(4, 
                  (_){
                    return Image.asset("assets/person.png");
                  }
                  ),
                  ),
            ),

          ],
        ),
      ),
    );
  }
}