import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:itunesapp/api/api_fetch.dart';
import 'package:itunesapp/models/itunes_models.dart';

class ItemsList extends StatelessWidget {
  String artistName;
  String artworkUrl100;
  String description;
  String collectionPrice;
  String country;
  String primaryGenreName;
  ItemsList(
      {super.key,
      required this.artistName,
      required this.artworkUrl100,
      required this.collectionPrice,
      required this.country,
      required this.description,
      required this.primaryGenreName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(artworkUrl100),
                  ),
                  title: Text(artistName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(collectionPrice),
                      const SizedBox(height: 10),
                      Text(country),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      Text(primaryGenreName),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
