import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppbarName extends StatelessWidget implements PreferredSizeWidget {
  const AppbarName({
    required this.showBadge,
    required this.name,
    super.key,
  });

  final String name;
  final bool showBadge;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(name),
      actions: [
        const SizedBox(width: 10),
        showBadge
            ? GestureDetector(
                onTap: () {
                  context.go(context.namedLocation('cart'));
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(color: const Color(0xffFFFFFF), borderRadius: BorderRadius.circular(50)),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icon/bag.svg',
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ),
              )
            : GestureDetector(
                onTap: () {
                  context.go(context.namedLocation('home'));
                },
                child: Container(
                  width: 80,
                  height: 35,
                  decoration: BoxDecoration(color: const Color(0xffF2F2F2), borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icon/three_dots.svg',
                        width: 15,
                      ),
                      const VerticalDivider(color: Colors.black, indent: 10, endIndent: 10, thickness: 1),
                      SvgPicture.asset(
                        'assets/icon/circle_x.svg',
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
        const SizedBox(width: 20),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
