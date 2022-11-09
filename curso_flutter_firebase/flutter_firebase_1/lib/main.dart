import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore db = Firestore.instance;

  /***** Filtrando dados  *****/

  QuerySnapshot querySnapshot = await db.collection("usuarios")
      //.where("nome", isEqualTo: "carol")
      // .where("idade", isEqualTo: "28")
      // .where("idade", isGreaterThan: "15" )
      // .where("idade", isLessThan: "30" )
      // .orderBy("idade", descending: false)
      .where("nome", isGreaterThanOrEqualTo:  "mi" )
      .where("nome", isLessThanOrEqualTo:  "mi" + "\uf8ff" )
      .getDocuments();

  for (DocumentSnapshot item in querySnapshot.documents) {
    var dados = item.data;
    print("filtro nome: ${dados["nome"]} idade: ${dados["idade"]} ");
  }

  /***** Recuperando dados  *****/

  // db.collection("usuarios").snapshots().listen((snapshot) {
  //   for (DocumentSnapshot doc in snapshot.documents) {
  //     var dados = doc.data;
  //     print("Dados: " + dados.toString());
  //   }
  // });

  // print("Dados: " + querySnapshot.documents.toString());
  /*
  
  QuerySnapshot querySnapshot = await db.collection("usuarios").getDocuments();
  for (DocumentSnapshot doc in querySnapshot.documents) {
    var dados = doc.data;
    print("Dados: " + dados.toString());
  }
  
  */
  // DocumentSnapshot snapshot =
  //     await db.collection("usuarios").document("002").get();

  // var dados = snapshot.data;
  // print("dados nome: " + dados["nomme"] + " idade: " + dados["idade"]);

  /***** Removendo dados  *****/

  // db.collection("usuarios").document("001").delete();

  /***** Atualizar dados *****/

  // db.collection("noticias").document("jZXDoPNwPallLaTcPBmi").setData({
  //   "titulo": "Ondas de calor em São Paulo",
  //   "descricao": "Texto exemplo..."
  // });

  // DocumentReference ref = await db.collection("noticias").add({
  //   "titulo": " Criada nova moeda virtual!!",
  //   "descricao": "Texto exemplo..."
  // });

  /***** Criar dados *****/

  // db
  //     .collection("usuarios")
  //     .document("001")
  //     .setData({"nome": " Douglas", "idade": "28"});

  /***** inicializar o fireBase *****/

  // Firestore.instance
  //     .collection("usuarios")
  //     .document("pontuacao")
  //     .setData({"Mizael": "250", "Ana": "580"});

  runApp(MaterialApp(
    home: Home(),
  ));
}
