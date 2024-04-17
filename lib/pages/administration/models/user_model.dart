import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;

  User({required this.id});
}

class UserData {
  final String nom;
  final String prenom;
  final String email;
  final String numCNI;
  final String telephone;
  final String adresse;
  final String password;
  final String avatar; // Chemin de l'image de l'avatar
  final String titre;
  final String id;

  UserData({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.numCNI,
    required this.telephone,
    required this.adresse,
    required this.password,
    required this.avatar,
    required this.titre,
  });

  // Méthode pour convertir les données de Firestore en un objet User
  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      nom: map['nom'] ?? '',
      prenom: map['prenom'] ?? '',
      email: map['email'] ?? '',
      numCNI: map['numCNI'] ?? '',
      telephone: map['telephone'] ?? '',
      adresse: map['adresse'] ?? '',
      password: map['password'] ?? '',
      avatar: map['avatar'] ?? '',
      titre: map['titre'] ?? '',
      id: map['id'] ?? '',
    );
  }
}

// Récupération des utilisateurs depuis Firestore
Future<List<UserData>> getUsersFromFirestore() async {
  List<UserData> users = [];

  // Récupération de la collection 'utilisateurs' depuis Firestore
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('utilisateurs').get();

  // Parcours des documents récupérés et création des objets User
  for (var doc in querySnapshot.docs) {
    if (doc.exists) {
      users.add(UserData.fromMap(doc.data() as Map<String, dynamic>));
    }
  }

  return users;
}

// données d'un utilisateur en fonction de son id
Future<String?> getUserName(String userId) async {
  try {
    // Référence du document de l'utilisateur dans la collection "utilisateurs"
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('utilisateurs')
        .doc(userId)
        .get();

    // Vérifie si le document existe
    if (userSnapshot.exists) {
      // Récupère les données de l'utilisateur
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;
      // Récupère le nom de l'utilisateur à partir des données
      String? nom = userData['nom'];
      String? prenom = userData['prenom'];
      String? email = userData['nom'];
      String? numCNI = userData['numCNI'];
      String? telephone = userData['telephone'];
      String? adresse = userData['adresse'];
      String? password = userData['password'];
      String? avatar = userData['avatar'];
      String? titre = userData['titre'];
      String? id = userData['id'];
    } else {
      print('Aucun utilisateur trouvé avec l\'ID $userId');
      return null;
    }
  } catch (error) {
    print('Erreur lors de la récupération du nom de l\'utilisateur: $error');
    return null;
  }
  return null;
}
