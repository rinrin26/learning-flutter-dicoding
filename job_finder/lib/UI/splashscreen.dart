import 'package:flutter/material.dart';
import 'package:job_finder/UI/home_screen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF868EBB),
      body: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/Logo.png'),
              const SizedBox(height: 40,),
              Text(
                'Explore your dream job',
                  style: Theme.of(context).textTheme.headlineLarge,
              ),
               const SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomeScreen()));
              
              }, child: const Text('go to home', style: TextStyle(color: Colors.black),))
              
        
          ],),
        ),
      ),

    );
  }
  
}