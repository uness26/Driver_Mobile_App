import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../services/auth_service.dart';
import '../widgets/custom_buttomBar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  Widget textfield({@required hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).user;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  const Text(
            'Profile',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.indigo,
        ),
        body: ListView(
          children: [
            Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 470,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: ListView(
                    children: [
                      const Text(
                        'Matricule : ',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black,
                        ),
                      ),
                      textfield(
                        hintText: ' ${user.matricule}',
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Nom et Prénom :',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black,
                        ),
                      ),
                      textfield(
                        hintText: ' ${user.nom} ${user.prenom}',
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Email : ',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black,
                        ),
                      ),
                      textfield(
                        hintText: ' ${user.email}',
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Télephone : ',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black,
                        ),
                      ),
                      textfield(
                        hintText: ' ${user.tel}',
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'CIN : ',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black,
                        ),
                      ),
                      textfield(
                        hintText: ' ${user.CIN}',
                      ),
                    ],
                  ),
                ),
                CustomPaint(
                  painter: HeaderCurvedContainer(),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                Positioned(
                  top: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/profile.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.indigo;
    Path path = Path()
      ..relativeLineTo(0, 50)
      ..quadraticBezierTo(size.width / 2, 200, size.width, 50)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/*Container(
height: 55,
width: double.infinity,
child: RaisedButton(
onPressed: () {},
color: Colors.black54,
child: Center(
child: Text(
"Update",
style: TextStyle(
fontSize: 23,
color: Colors.white,
),
),
),
),
)*/
