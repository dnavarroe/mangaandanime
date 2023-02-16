

import 'package:flutter/material.dart';

class PAndP extends StatelessWidget {
  const PAndP({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, index) => _PeAndPe()),
    );
  }
}

class _PeAndPe extends StatelessWidget {
  const _PeAndPe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 190,
      width: 130,
      child:  Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'), 
              image: AssetImage('assets/no-image.jpg'),
              height: 160,
              fit: BoxFit.cover,),
          ),
          SizedBox(height: 5,),
          const Text('Personaje and Actor', maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}