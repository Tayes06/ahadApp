import 'package:ahad/pages/constants.dart';
import 'package:ahad/services/methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class FormAjoutMembre extends StatefulWidget {
  const FormAjoutMembre({super.key});

  @override
  State<FormAjoutMembre> createState() => _FormAjoutMembreState();
}

class _FormAjoutMembreState extends State<FormAjoutMembre> {
  final users = FirebaseFirestore.instance.collection('utilisateurs').doc();
  //final _formKey = GlobalKey<FormState>();
  String nom = "";
  String prenom = "";
  String email = "";
  String telephone = "";
  String adresse = "";
  String password = "";
  String numCNI = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: const [
                Text(
                  "Inscrire un nouveau membre",
                  style: TextStyle(color: Colors.white),
                ), // Titre de l'AppBar
              ],
            ),
            backgroundColor: primaryColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              //key: _formKey,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      nom = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Nom", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      prenom = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Prénom", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Email", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      numCNI = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Numéro CNI", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      telephone = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Téléphone", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      adresse = value;
                    },
                    decoration: InputDecoration(
                        labelText: "Adresse", border: OutlineInputBorder()),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    String newpassword = randomAlphaNumeric(6);
                    final json = {
                      'id': users.id,
                      'nom': nom,
                      'prenom': prenom,
                      'email': email,
                      'telephone': telephone,
                      'numCNI': numCNI,
                      'adresse': adresse,
                      'password': newpassword,
                      'avatar': ' ',
                      'titre': ' ',
                    };
                    await users.set(json).then((value) => print('User added'));
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: json['email']!, password: json['password']!);
                    sendMail(
                        json['email']!,
                        'Cher $prenom, \nUn responsable vient de vous inscrire sur la plateforme numerique de l\'association AHAD.\n\nVotre mote de passe de connexion: $newpassword.\n\nVous avez la possibilité de le modifier une fois connecté',
                        'Authentification-AHAD');
                  },
                  child: Text("Inscrire"),
                ),
              ],
            ),
          )),
    );
  }
}

class FormHeaderWidget {}
