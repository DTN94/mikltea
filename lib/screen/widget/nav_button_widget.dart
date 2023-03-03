import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavButton extends ConsumerWidget {
  final StateProvider bottomNavProvider;
  final int selectedNav;
  final String svgIcon;
  final String name;
  final int idx;

  const NavButton({super.key, required this.selectedNav, required this.svgIcon, required this.name, required this.bottomNavProvider, required this.idx});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 60,
      width: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(border: Border(top: BorderSide(width: 1, color: Color(selectedNav == idx ? 0xffFB9116 : 0xffEBEBF0)))),
      child: GestureDetector(
        onTap: () => ref.read(bottomNavProvider.notifier).state = idx,
        child: Column(
          children: [
            SvgPicture.asset(
              svgIcon,
              colorFilter: ColorFilter.mode(Color(selectedNav == idx ? 0xffFB9116 : 0xff808089), BlendMode.srcIn),
              height: 25,
              width: 25,
            ),
            Text(name, style: TextStyle(fontFamily: 'Oswald', fontWeight: FontWeight.w500, fontSize: 13, color: Color(selectedNav == idx ? 0xffFB9116 : 0xff808089)))
          ],
        ),
      ),
    );
  }
}
