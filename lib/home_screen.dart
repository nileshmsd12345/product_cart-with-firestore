import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);

  final Color logoGreen = Color(0xff25bcbb);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  late Map<String, dynamic> productToAdd;
  CollectionReference collectionReference= FirebaseFirestore.instance.collection("products");

  addProduct(){
    productToAdd={
      "name": nameController.text,
      "brand": brandController.text,
      "price": priceController.text,
      "imageUrl": imageUrlController.text,
    };
    collectionReference.add(productToAdd).whenComplete(() => print("product added"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10,),
            _buildTextField(nameController, 'name'),
            SizedBox(height: 10,),
            _buildTextField(brandController, 'brand'),
            SizedBox(height: 10,),
            _buildTextField(priceController, 'price'),
            SizedBox(height: 10,),
            _buildTextField(imageUrlController, 'image Url'),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(onPressed: (){
                 addProduct();
              }, child: Text("Add product to Database"), color: logoGreen,),
            ),

          ],
        ),
      ),
    );
  }

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none),
      ),
    );
  }
}
