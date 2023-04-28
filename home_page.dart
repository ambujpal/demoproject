import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/image_model.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

Map? data;
Future<ImageModel> fetchData() async{
ImageModel img;
String url = 'https://testffc.nimapinfotech.com/testdata.json';
http.Response response = await http.get(Uri.parse(url));
Map<String, dynamic> jsonresponse = json.decode(response.body);
img = ImageModel.fromJson(jsonresponse);
return img;
}

@override
void initState(){
  fetchData();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: FutureBuilder<ImageModel>(
            future: fetchData(),
            builder: (context, AsyncSnapshot<ImageModel> snapshot){
              return Container(
                height: MediaQuery.of(context).size.height*0.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.data!.records.length,
                  padding: EdgeInsets.all(10),
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                            // Text("${snapshot.data!.status}"),
                              // Text('${snapshot.data!.data!.records[index].title}'),
                              Image.network('${snapshot.data!.data!.records[index].mainImageUrl}',
                              height: MediaQuery.of(context).size.height*0.45,
                              width: MediaQuery.of(context).size.width,)

                            ],
                          ),
                        ),
                      );
                    }),
              );
            },
          ),
        )
      ),
    );
  }
}
