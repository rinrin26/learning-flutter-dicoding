import 'package:flutter/material.dart';
import 'package:job_finder/UI/home_screen.dart';
import 'package:job_finder/UI/login_screen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF868EBB),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
               final isLargeScreen = constraints.maxWidth > 800;
          return SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(top: isLargeScreen ? 100 : 300),
              child: Center(
                child: Column(
                  children: [
                    Image.asset('assets/images/Logo.png'),
                    const SizedBox(height: 40,),
                    Text(
                      'Explore your dream job',
                        style: Theme.of(context).textTheme.headlineLarge,
                    ),
                      SizedBox(
                      height: isLargeScreen ? 200 : 270,
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                    
                    }, child: const Text('go to home', style: TextStyle(color: Colors.black),))
                    
              
                ],),
              ),
            ),
          );
        }
      ),

    );
  }
  
}