// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:product_listing_app/Slider/Logic/slider_bloc.dart';
//
// class BannerSlider extends StatefulWidget {
//   BannerSlider({super.key});
//
//   @override
//   State<BannerSlider> createState() => _BannerSliderState();
// }
//
// class _BannerSliderState extends State<BannerSlider> {
//
//   // final CarouselController _carouselController = CarouselController();
//   //
//   // int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SliderBloc, SliderState>(
//       builder: (context, state) {
//         if (state is SliderLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is SliderLoaded) {
//           return CarouselSlider.builder(
//             itemCount: state.sliderlist.length,
//             itemBuilder: (context, index, realIndex) {
//               final banner = state.sliderlist[index];
//               return ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.network(
//                   banner.image,
//                   fit: BoxFit.fitWidth,
//                   width: double.infinity,
//                   loadingBuilder: (context, child, progress) {
//                     if (progress == null) return child;
//                     return const Center(child: CircularProgressIndicator());
//                   },
//                   errorBuilder: (context, error, stackTrace) =>
//                   const Icon(Icons.error, size: 50, color: Colors.red),
//                 ),
//               );
//             },
//             //carouselController: _carouselController,
//             options: CarouselOptions(
//               height: 180,
//               autoPlay: true,
//               enlargeCenterPage: true,
//               // onPageChanged: (index, reason) {
//               //   setState(() {
//               //     _currentIndex = index;
//               //   });
//               // },
//               viewportFraction: 0.9,
//               autoPlayInterval: const Duration(seconds: 3),
//             ),
//           );
//         } else if (state is SliderError) {
//           return Center(child: Text("Error: ${state.sliderError}"));
//         }
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:product_listing_app/Slider/Logic/slider_bloc.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _currentIndex = 0; // track current index

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderBloc, SliderState>(
      builder: (context, state) {
        if (state is SliderLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SliderLoaded) {
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: state.sliderlist.length,
                itemBuilder: (context, index, realIndex) {
                  final banner = state.sliderlist[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      banner.image,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error, size: 50, color: Colors.red),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: state.sliderlist.asMap().entries.map((entry) {
                  return Container(
                    width: _currentIndex == entry.key ? 16 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 4),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_currentIndex == entry.key ? 4 : 50),
                  color: _currentIndex == entry.key
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        } else if (state is SliderError) {
          return Center(child: Text("Error: ${state.sliderError}"));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
