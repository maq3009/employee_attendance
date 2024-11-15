import 'package:employee_attendance/screens/register_screen.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;   
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
          Container(
            height: screenHeight /3,
            width: screenWidth,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'Healthcare.png',
                  height: 80,
                  width: 80,
                ),
                const SizedBox(height: 20,),
                const Text("Hogar Estancias de la Paz 2",
                  style: TextStyle(fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
                  ),
                const Center(
                  child: Text("Horarios",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30, 
                    )
                )),
              ],
            )
          ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                  TextField(
                    decoration: const InputDecoration(
                      label: Text ("Employee Email ID"),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()     
                    ),
                    controller: _emailController,
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    decoration: const InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder()
                    ),
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 30,),

                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {

                      }, style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ), child: const Text("Login", style: TextStyle(
                        fontSize: 20),
                      ),),),
                    const SizedBox(height: 20,
                    ),

                    TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                    }, child: const Text("Are you a new Employee? Register here"))                                 
          ])
          )
        ],
      ));
}}