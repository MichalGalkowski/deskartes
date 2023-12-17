import 'package:deskartes/view/quadratic_function/widgets/arc_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<String> numbers = [
  '-9',
  '-8',
  '-7',
  '-6',
  '-5',
  '-4',
  '-3',
  '-2',
  '-1',
  ' ',
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10'
];

class Graph extends ConsumerWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black12),
      child: Stack(
        children: [
          // x axis points
          Padding(
            padding: EdgeInsets.only(top: width * .474),
            child: SizedBox(
              height: 20,
              width: width,
              child: ListView.builder(
                  itemCount: numbers.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Container(
                      width: width * .05,
                      decoration: const BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(color: Colors.black, width: 1.6))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 4),
                        child: Text(
                          numbers[index],
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    );
                  })),
            ),
          ),
          // y axis points
          Padding(
            padding: EdgeInsets.only(left: width * .474),
            child: SizedBox(
              height: width,
              width: 20,
              child: ListView.builder(
                  itemCount: numbers.length,
                  reverse: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: ((context, index) {
                    return Container(
                      height: width * .05,
                      width: 14,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 1.6))),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 9, top: 2),
                        child: Text(
                          numbers[index],
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    );
                  })),
            ),
          ),
          // x axis
          Container(
            width: width,
            height: width * .5,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 1.6))),
          ),

          // y axis
          Container(
            width: width * .5,
            height: width,
            decoration: const BoxDecoration(
                border:
                    Border(right: BorderSide(color: Colors.black, width: 1.6))),
          ),
          const ArcCanvas(),
        ],
      ),
    );
  }
}
