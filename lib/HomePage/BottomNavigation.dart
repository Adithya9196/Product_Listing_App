// import 'package:flutter/material.dart';
//
// class BottomNavigation extends StatefulWidget {
//   @override
//   _CustomBottomNavState createState() => _CustomBottomNavState();
// }
//
// class _CustomBottomNavState extends State<BottomNavigation>
//     with TickerProviderStateMixin {
//   int _selectedIndex = 0;
//
//   final List<IconData> _icons = [
//     Icons.home_outlined,
//     Icons.favorite_border,
//     Icons.person_outline,
//   ];
//
//   final List<String> _labels = [
//     "Home",
//     "Favorites",
//     "Profile",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         margin: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(30),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 10,
//               spreadRadius: 1,
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(_icons.length, (index) {
//             bool isSelected = _selectedIndex == index;
//
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 300),
//                 curve: Curves.easeInOut,
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                 decoration: isSelected
//                     ? BoxDecoration(
//                   color: Colors.deepPurpleAccent,
//                   borderRadius: BorderRadius.circular(30),
//                 )
//                     : BoxDecoration(),
//                 child: Row(
//                   children: [
//                     Icon(
//                       _icons[index],
//                       color: isSelected ? Colors.white : Colors.grey,
//                     ),
//                     AnimatedSize(
//                       duration: Duration(milliseconds: 300),
//                       curve: Curves.easeInOut,
//                       child: AnimatedOpacity(
//                         opacity: isSelected ? 1.0 : 0.0,
//                         duration: Duration(milliseconds: 300),
//                         child: Padding(
//                           padding: EdgeInsets.only(left: isSelected ? 6 : 0),
//                           child: Text(
//                             isSelected ? _labels[index] : "",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final ValueChanged<int> onTabSelected; // callback

  BottomNavigation({required this.onTabSelected});

  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<BottomNavigation>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.favorite_border,
    Icons.person_outline,
  ];

  final List<String> _labels = [
    "Home",
    "Favorites",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (index) {
          bool isSelected = _selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onTabSelected(index); // notify parent
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: isSelected
                  ? BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(30),
              )
                  : BoxDecoration(),
              child: Row(
                children: [
                  Icon(
                    _icons[index],
                    color: isSelected ? Colors.white : Colors.grey,
                  ),
                  AnimatedSize(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: AnimatedOpacity(
                      opacity: isSelected ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 300),
                      child: Padding(
                        padding: EdgeInsets.only(left: isSelected ? 6 : 0),
                        child: Text(
                          isSelected ? _labels[index] : "",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
