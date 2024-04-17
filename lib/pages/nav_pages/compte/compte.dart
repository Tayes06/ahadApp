import 'package:ahad/pages/nav_pages/compte/forward_but.dart';
import 'package:ahad/pages/nav_pages/compte/help.dart';
import 'package:ahad/pages/nav_pages/compte/language.dart';
import 'package:ahad/pages/nav_pages/compte/privacy.dart';
import 'package:ahad/pages/nav_pages/compte/reglement_interieur.dart';
import 'package:ahad/pages/nav_pages/compte/show_notification.dart';
import 'package:ahad/pages/nav_pages/compte/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MonCompte extends StatefulWidget {
  //final Function(bool value) onTap;
  //final Color iconColor;
  //final IconData icon;
  //final bool value;
  const MonCompte({
    super.key,
  });

  @override
  State<MonCompte> createState() => _MonCompteState();
}

class _MonCompteState extends State<MonCompte> {
  bool isActive = false;
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(
          color: Colors.white, // Couleur des icones de l'AppBar
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Paramètres",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 5, 95, 2),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Compte",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: const [
                    Image(
                      image: AssetImage("assets/profile_picture.png"),
                      height: 70,
                      width: 70,
                    ),
                    /* Image.asset(
                      "assets/profile_picture.png",
                      height: 70,
                      width: 70,
                    ),*/
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TAYO TATE Desmond",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "A rejoint depuis sept 2023",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    ForwardButton(
                      destination: EditProfilePage(
                        userId: '',
                      ),
                    ),
                    /*Icon(
                      Icons.arrow_right_sharp,
                      size: 55,
                      color: primaryColor,
                    )*/
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Réglages",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: const [
                    SizedBox(
                      height: 50,
                      width: 50,

                      /*decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red.shade200),*/
                      child: Icon(
                        Ionicons.earth,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Langue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Français",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ForwardButton(
                      destination: ChangeLanguage(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: const [
                    SizedBox(
                      height: 50,
                      width: 50,

                      /*decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red.shade200),*/
                      child: Icon(
                        Ionicons.notifications,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 20,
                    ),
                    ForwardButton(
                      destination: ShowNotifications(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: const [
                    SizedBox(
                      height: 50,
                      width: 50,

                      /*decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red.shade200),*/
                      child: Icon(
                        Ionicons.earth,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Confidentialité",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 20,
                    ),
                    ForwardButton(
                      destination: Privacy(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: const [
                    SizedBox(
                      height: 50,
                      width: 50,

                      /*decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red.shade200),*/
                      child: Icon(
                        Ionicons.nuclear_sharp,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Règlement intérieur",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 20,
                    ),
                    ForwardButton(
                      destination: ReglementInterieur(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: const [
                    SizedBox(
                      height: 50,
                      width: 50,

                      /*decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red.shade200),*/
                      child: Icon(
                        Ionicons.help,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Aide",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 20,
                    ),
                    ForwardButton(destination: HelpPage()),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Bouton mode sombre
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,

                      /*decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red.shade200),*/
                      child: Icon(
                        Ionicons.invert_mode,
                        color: Color.fromARGB(213, 163, 127, 7),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Mode sombre",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Off",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Transform.scale(
                      scale: 0.7,
                      child: CupertinoSwitch(
                        value: isActive,
                        onChanged: (bool val) {},
                      ),
                    ),
                    //CupertinoSwitch(value: value, onChanged: onTap);
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,

                      /*decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red.shade200),*/
                      child: Icon(
                        Ionicons.log_out,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        // Fonction appelée lorsque le bouton est pressé
                        print('Bouton pressé !');
                      },
                      child: Text(
                        "Déconnexion",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(
                              255, 209, 15, 15), // Couleur du texte du bouton
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
