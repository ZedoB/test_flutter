import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/success.dart';
import 'firebase_options.dart';
import 'firebase_sevice.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseService _auth = FirebaseService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('SignUp'),
            const SizedBox(height: 30,),
            const Text('Enter your email'),
            TextFormField(
              controller: _emailController,
            ),
            const SizedBox(height: 15,),
            const Text('Enter your Password'),
            TextFormField(
              controller: _passwordController,
            ),
            const SizedBox(height: 15,),
            ElevatedButton(onPressed: () async{
              await FirebaseService().signUp(
                email: _emailController.text,
                password: _passwordController.text
              );
              Navigator.push(context,MaterialPageRoute(
                  builder: (context)=>const Success()));
            }, child: const Text('submit'))
          ],
        ),
      )
    );
  }

  // void _sign() async{
  //   String email = _emailController.text;
  //   String password = _passwordController.text;
  //   User? user = await _auth.signUp(email,password);
  //   if(user!=null){
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context)=>const Success()));
  //   }
  //   else{
  //     print('error2');
  //   }
  // }

}
