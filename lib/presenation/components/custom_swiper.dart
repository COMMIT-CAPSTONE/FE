import 'dart:async';
import 'package:flutter/material.dart';

class CustomSwiper extends StatefulWidget {
  final List<Widget> items;
  final double height;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final void Function(int index)? onTap;

  const CustomSwiper({
    super.key,
    required this.items,
    required this.height,
    required this.autoPlay,
    required this.autoPlayInterval,
    required this.onTap,
  });

  @override
  State<CustomSwiper> createState() => _CustomSwiperState();
}

class _CustomSwiperState extends State<CustomSwiper> {
  late final PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    if (widget.autoPlay) {
      _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (timer) {
        int nextPage = _currentIndex + 1;
        if (nextPage >= widget.items.length) nextPage = 0;

        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoPlayTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height + 30,
      child: Stack(
        children: [
          SizedBox(
            height: widget.height,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.items.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    widget.onTap?.call(index);
                  },
                  child: widget.items[index],
                );
              },
            ),
          ),
          Positioned(
            bottom: 40,
            right: 25,
            child: Text(
              '${_currentIndex + 1} / ${widget.items.length}',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
