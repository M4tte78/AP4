import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:firstapp/components/navbarwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
  import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String? _imageData;

  Future<void> pickImage() async {
    final input = html.FileUploadInputElement()..accept = 'image/*';
    input.click();

    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        setState(() {
          _imageData = reader.result as String?;
        });
      });

      reader.readAsDataUrl(file);
    });
  }

Future<void> uploadImage() async {
  if (_imageData == null) {
    print('Aucune image sélectionnée.');
    return;
  }
  print('image selectionnée : $_imageData');

  final decodedBytes = base64.decode(_imageData!.split(',').last);

  final bytes = Uint8List.fromList(decodedBytes);

  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://localhost:8080/product/upload'),
  );

  request.files.add(http.MultipartFile.fromBytes('image[]', bytes));

  try {

    final response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      print('Image téléchargée avec succès');
      final imageName = json.decode(response.body)['imageName'];
      await updateUser(imageName);
    } else {
      print('Échec du téléchargement de l\'image');
    }
  } catch (e) {
    print('Erreur lors du téléchargement de l\'image: $e');
  }
}

Future<void> updateUser(String imageName) async {
  final requestData = {
    'id_user': 1,
    'img': imageName,
  };

  try {
    final response = await http.post(
      Uri.parse('http://localhost:8080/mobileuser/update'),
      body: json.encode(requestData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Données utilisateur mises à jour avec succès');
    } else {
      print('Échec de la mise à jour des données utilisateur');
    }
  } catch (e) {
    print('Erreur lors de la mise à jour des données utilisateur: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    var _scaffoldKey;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: GoogleFonts.lemon(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 67, 246),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _imageData != null
                    ? MemoryImage(
                        Uint8List.fromList(base64.decode(_imageData!.split(',').last)))
                    : AssetImage('assets/images/astronaut.png') as ImageProvider,
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Nom d\'utilisateur'),
              trailing: const Icon(Icons.edit),
            ),
            ListTile(
              leading: const Icon(Icons.mail),
              title: const Text('Email'),
              trailing: const Icon(Icons.edit),
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Mot de passe'),
              trailing: const Icon(Icons.edit),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Préférences'),
              trailing: const Icon(Icons.edit),
            ),
            ListTile(
              leading: const Icon(Icons.cloud_upload),
              title: const Text('Télécharger une image'),
              onTap: uploadImage,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBarWidget(),
    );
  }
}
