import 'package:crypto_app/src/core/presentation/custom/glass.dart';
import 'package:crypto_app/src/core/util/assets/app_assets.dart';
import 'package:crypto_app/src/core/util/extension/build_context_ext.dart';
import 'package:crypto_app/src/core/util/theme/app_theme.dart';
import 'package:crypto_app/src/feature/tab_bar/presentation/components/tab_bar_item.dart';
import 'package:flutter/material.dart';

const double _height = 72.0;
/// внутренний отступ слева и справа
const double _horizontalInset = 4.0;
const double _tabBarItemCount = 2;

class FloatingTabBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTap;

  const FloatingTabBar({
    super.key,
    required this.currentIndex,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const .symmetric(horizontal: 16),
      child: SizedBox(
        height: _height,
        child: LayoutBuilder(
          builder: (context, constraints) {

            final totalWidth = constraints.maxWidth;
            final contentWidth = totalWidth - _horizontalInset * 2;

            /// 5 элементов (home, objects, plus, reviews, tasks)
            final slotWidth = contentWidth / _tabBarItemCount;

            /// смещение индекса из-за кнопки plus
            int visualIndex = currentIndex;
            if (currentIndex >= 2) {
              visualIndex += 1;
            }

            final indicatorWidth = slotWidth * 1;

            final indicatorLeft = _horizontalInset
                + slotWidth * visualIndex
                + (slotWidth - indicatorWidth) / 2;

            return Glass(
              border: _height,
              child: Stack(
                fit: .passthrough,
                alignment: .center,
                children: [

                  /// Индикатор
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutQuad,
                    left: indicatorLeft,
                    child: Container(
                      width: indicatorWidth,
                      height: _height - _horizontalInset * 2,
                      decoration: BoxDecoration(
                        color: context.theme.tabBarIndicatorColor,
                        borderRadius: .circular(_height),
                      ),
                    ),
                  ),

                  /// Контент
                  Padding(
                    padding: const .symmetric(horizontal: _horizontalInset),
                    child: Row(
                      children: [
                        Expanded(
                          child: TabBarItem(
                            iconPath: assets.icons.coinsCrypto,
                            label: context.l10n.crypto,
                            index: 0,
                            currentIndex: currentIndex,
                            onTap: onItemTap,
                          ),
                        ),
                        Expanded(
                          child: TabBarItem(
                            iconPath: assets.icons.portfolio,
                            label: context.l10n.portfolio,
                            index: 1,
                            currentIndex: currentIndex,
                            onTap: onItemTap,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}