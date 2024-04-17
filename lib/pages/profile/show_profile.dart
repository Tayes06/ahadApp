import 'package:ahad/pages/administration/models/user_model.dart';
import 'package:ahad/pages/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ShowUserProfile extends StatefulWidget {
  final String userId;
  const ShowUserProfile({Key? key, required this.userId}) : super(key: key);

  @override
  State<ShowUserProfile> createState() => _ShowUserProfileState();
}

class _ShowUserProfileState extends State<ShowUserProfile> {
  late Future<UserData> _userDataFuture;

  @override
  void initState() {
    super.initState();
    _userDataFuture = getUserData(widget.userId);
  }

  Future<UserData> getUserData(String userId) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('utilisateurs')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        String nom = userData['nom'];
        String prenom = userData['prenom'];
        String email = userData['email'];
        String numCNI = userData['numCNI'];
        String telephone = userData['telephone'];
        String adresse = userData['adresse'];
        String password = userData['password'];
        String avatar = userData['avatar'];
        String titre = userData['titre'];
        String id = userData['id'];
        // Récupérez d'autres champs si nécessaire

        return UserData(
          nom: nom,
          email: email,
          id: id,
          prenom: prenom,
          numCNI: numCNI,
          telephone: telephone,
          adresse: adresse,
          password: password,
          avatar: avatar,
          titre: titre,
        );
      } else {
        throw Exception('Aucun utilisateur trouvé avec l\'ID $userId');
      }
    } catch (error) {
      throw Exception(
          'Erreur lors de la récupération des données utilisateur: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fixedSize: const Size(60, 50),
                elevation: 5,
              ),
              icon: const Icon(
                Ionicons.checkmark,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<UserData>(
        future: _userDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Erreur de chargement: ${snapshot.error}",
              ),
            );
          } else {
            UserData userData = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    EditItem(
                      title: "Photo",
                      widget: Column(
                        children: [
                          Image.asset(
                            "assets/profile_picture.png",
                            height: 200,
                            width: 200,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: secondaryColor,
                            ),
                            child: const Text("Depuis Sept 2023"),
                          ),
                        ],
                      ),
                    ),
                    EditItem(
                      widget: Text(
                        '${userData.titre}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      title: "Titre:",
                    ),
                    EditItem(
                      widget: Text(
                        '${userData.numCNI}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      title: "CNI N°:",
                    ),
                    EditItem(
                      widget: Text(
                        '${userData.nom}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      title: "Nom:",
                    ),
                    EditItem(
                      widget: Text(
                        '${userData.prenom}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      title: "Prénom:",
                    ),
                    EditItem(
                      widget: Text(
                        '${userData.telephone}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      title: "Téléphone:",
                    ),
                    EditItem(
                      widget: Text(
                        '${userData.email}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      title: "Email:",
                    ),
                    EditItem(
                      widget: Text(
                        '${userData.adresse}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      title: "Adresse:",
                    ),
                    EditItem(
                      widget: Text(
                        '${userData.id}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      title: "ID:",
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class EditItem extends StatelessWidget {
  final Widget widget;
  final String title;
  const EditItem({
    Key? key,
    required this.widget,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 2,
          child: widget,
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
