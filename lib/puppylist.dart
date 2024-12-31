import 'package:flutter/material.dart';

class puppyImage extends StatefulWidget {
  const puppyImage({super.key});

  @override
  State<puppyImage> createState() => _puppyImageState();
}

class _puppyImageState extends State<puppyImage> {
  List<String> imagesPuppy = [
    "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
    "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg",
    "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
    "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg",
    "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
    "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg",
    "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
    "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg",
    "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
    "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg",
    "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
    "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg",
    "https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg",
    "https://images.pexels.com/photos/2664417/pexels-photo-2664417.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: imagesPuppy.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Container(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    imagesPuppy[index],
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text("Puppy image"),
              ),
            );
          }),
    );
  }
}
