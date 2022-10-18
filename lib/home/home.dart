import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:itunesapp/api/api_fetch.dart';
import 'package:itunesapp/items/items.dart';
import 'package:itunesapp/models/itunes_models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30),
              Center(
                  child: Text(
                'Itunes Store',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
              )),
              FutureBuilder<List<Results>>(
                  future: ApiFetch().getApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    return SizedBox(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(ItemsList(
                                    artistName: snapshot.data![index].artistName
                                        .toString(),
                                    artworkUrl100: snapshot
                                        .data![index].artworkUrl100
                                        .toString(),
                                    collectionPrice: snapshot
                                        .data![index].collectionPrice
                                        .toString(),
                                    country: snapshot.data![index].country
                                        .toString(),
                                    description: snapshot
                                        .data![index].description
                                        .toString(),
                                    primaryGenreName: snapshot
                                        .data![index].primaryGenreName
                                        .toString()));
                              },
                              child: Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot
                                        .data![index].artworkUrl100
                                        .toString()),
                                  ),
                                  title: Text(snapshot.data![index].artistName
                                      .toString()),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data![index].collectionPrice
                                          .toString()),
                                      Text(snapshot.data![index].country
                                          .toString()),
                                      Text(snapshot.data![index].description
                                          .toString()),
                                      Text(snapshot
                                          .data![index].primaryGenreName
                                          .toString()),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
