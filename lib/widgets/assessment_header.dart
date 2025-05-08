import 'package:flutter/material.dart';

class AssessmentHeader extends StatefulWidget {
  final bool isDarkMode;
  final Function() onThemeToggle;

  const AssessmentHeader({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  State<AssessmentHeader> createState() => _AssessmentHeaderState();
}

class _AssessmentHeaderState extends State<AssessmentHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 450),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (widget.isDarkMode) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(0),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 16),
        decoration: BoxDecoration(
          color: widget.isDarkMode
              ? Theme.of(context).appBarTheme.backgroundColor
              : const Color.fromRGBO(59, 79, 212, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'More To Life',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Wellness Assessment',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Find More about Life',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (widget.isDarkMode) {
                      _animationController.reverse();
                    } else {
                      _animationController.forward();
                    }
                    widget.onThemeToggle();
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? Colors.grey[800]
                          : Colors.blue[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Transform.rotate(
                              angle: _rotationAnimation.value * 2 * 3.14159,
                              child: Opacity(
                                opacity: _opacityAnimation.value,
                                child: Icon(
                                  Icons.wb_sunny,
                                  color: widget.isDarkMode
                                      ? Colors.grey[600]
                                      : Colors.orange,
                                  size: 24,
                                ),
                              ),
                            ),
                            Transform.rotate(
                              angle: (1 - _rotationAnimation.value) * 2 * 3.14159,
                              child: Opacity(
                                opacity: 1 - _opacityAnimation.value,
                                child: Icon(
                                  Icons.nightlight_round,
                                  color: widget.isDarkMode
                                      ? Colors.blue[200]
                                      : Colors.transparent,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 21),
                const Text(
                  '4.8',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}