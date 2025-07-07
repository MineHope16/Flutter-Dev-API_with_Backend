import 'package:flutter/material.dart';
import 'package:flutter_api/model/product_data_model.dart';
import 'package:flutter_api/screens/edit_screen.dart';
import 'package:flutter_api/utils/api/api_endpoints.dart';
import 'package:flutter_api/utils/api/api_manager.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UPDATE PRODUCTS")),
      body: FutureBuilder(
        future: ApiManager.get(ApiEndpoints.getProduct()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final List<ProductDataModel>? pdata = snapshot.data;

            return ListView.builder(
              itemCount: pdata!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.storage),
                  title: Text(pdata[index].name),
                  subtitle: Text(pdata[index].desc),
                  trailing: SizedBox(
                    width: 100,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditScreen(product: pdata[index]),
                          ),
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
