import 'package:crypto_app/src/core/util/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabBarItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool withCount;

  static const double _itemWidth = 64;
  static const double _iconSize = 24;

  const TabBarItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    this.withCount = false,
  });

  @override
  Widget build(BuildContext context) {

    final isActive = index == currentIndex;
    final theme = Theme.of(context);

    return InkWell(
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => onTap(index),
      child: SizedBox(
        width: _itemWidth,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Stack(
              clipBehavior: .none,
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: _iconSize,
                  height: _iconSize,
                  fit: .scaleDown,
                  colorFilter: .mode(
                    isActive
                        ? theme.colorScheme.primary
                        : theme.textColor,
                    .srcIn,
                  ),
                ),
                // if (withCount)
                //   StreamBuilder<int>(
                //     stream: getIt<ReviewRepo>().reviewsCountStream,
                //     builder: (context, snapshot) {
                //       final reviewsCount = snapshot.data ?? 0;
                //       return reviewsCount > 0 ? Positioned(
                //         right: reviewsCount >= 10 ? -14 : -10,
                //         top: -10,
                //         child: Container(
                //           padding: reviewsCount >= 10 ? EdgeInsets.fromLTRB(4, 2, 4, 2) : EdgeInsets.fromLTRB(5.3, 2, 4.5, 2),
                //           decoration: BoxDecoration(
                //             color: Color(0xFFFF981F),
                //             shape: reviewsCount >= 10 ? BoxShape.rectangle : BoxShape.circle,
                //             borderRadius: reviewsCount >= 10 ? BorderRadius.circular(32) : null,
                //           ),
                //           child: Center(
                //             child: Text(
                //               reviewsCount.toString(),
                //               style: TextStyle(
                //                 fontWeight: FontWeight.w700,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ) : SizedBox.shrink();
                //     },
                //   ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: .w500,
                color: isActive
                    ? theme.colorScheme.primary
                    : theme.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}