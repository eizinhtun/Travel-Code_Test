// @dart=2.9
import 'package:flutter/material.dart';
import 'package:travel/register.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/welcome/welcome.png'),
          Positioned(
            top: MediaQuery.of(context).size.height / 4 + 20,
            child: Image.asset('assets/images/clouds/clouds.png'),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, top: 16, right: 20, bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Welcome to Ready to Travel",
                          style: TextStyle(
                            fontFamily: 'Chivo-Bold',
                            fontSize: 36.0,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                            "Sign up with Facebook for the most fulfilling trip planning experience with us!"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff1763d6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Log in with Facebook",
                              ),
                            ),
                          ),
                          Icon(
                            Icons.facebook,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff1763d6),
                      ),
                      child: const Text(
                        "Log in with email address",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const Register(),
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        gradient: LinearGradient(
                            stops: [0.0, 1.0],
                            colors: [Color(0xff05b9c8), Color(0xff32729c)]),
                      ),
                      child: const Center(
                        child: Text(
                          "Create a new account",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
