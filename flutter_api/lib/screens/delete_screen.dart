import 'package:flutter/material.dart';
import 'package:flutter_api/model/product_data_model.dart';
import 'package:flutter_api/utils/api/api_endpoints.dart';
import 'package:flutter_api/utils/api/api_manager.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DELETE PRODUCTS")),
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
                        ApiManager.delete(
                          ApiEndpoints.deleteProduct(pdata[index].id),
                        );
                        setState(() {
                          pdata.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete),
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
