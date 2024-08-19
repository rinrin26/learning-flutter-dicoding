import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:job_finder/UI/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCFD2E4),
      body: LayoutBuilder(
        builder:  (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(children: [
              _buildHeader(context),
              const SizedBox(height: 30),
              buildFormLogin(context),
              const SizedBox(height: 50),
             
              SizedBox(
                 width:
                  constraints.maxWidth > 600 ? 375 : constraints.maxWidth * 0.9,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5A6081),
                    side: const BorderSide(color: Colors.transparent, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child:  Text(
                    'Login',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                  ),
                ),
              ),
            
               const SizedBox(
                height: 30,
              ),
              const Text(
                 '------------------------ or ---------------------------',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              otherSignIn(),
               const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0,top: 20,bottom: 50),
                child: _textbuttom(context),
              ),
            
            ]),
          );
        }
      ),
    );
  }

  Row otherSignIn() => const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/google.png'),
            ),
          ),
      Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/LinkedIn.png'),
            ),
          ),
    ],
  );

   Row _textbuttom(BuildContext context) => Row(
        children: [

          const Text(
            'Dont have an account?',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          const SizedBox(width: 18),
          InkWell(
            onTap: () =>{},
            child: const Text(
              'Sign Up',
              style: TextStyle(fontSize: 18, color: Colors.blueAccent),
            ),
          ),
        ],
      );

  Padding buildFormLogin(BuildContext context) => Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Username',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_box)),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              Text(
                'Password',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password)),
              ),
            ],
          )),
        ),
      ));

  Padding _buildHeader(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/Logo.png'),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'Finding your dream job is more easire and faster with JobFInder',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      );
}
