import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppBarUser extends StatelessWidget implements PreferredSizeWidget {
  final String avatar;
  final String username;

  const AppBarUser({super.key, required this.avatar, required this.username});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          ClipPath(
            clipper: const ShapeBorderClipper(shape: CircleBorder()),
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: 35,
              height: 35,
              child: CachedNetworkImage(
                imageUrl: (Uri.tryParse(avatar)!.hasAbsolutePath == true) ? avatar : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text('Xin Chào ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, fontFamily: 'Oswald', color: Color(0xff656565))),
          Text(username, style: const TextStyle(fontFamily: 'Oswald', fontSize: 15, color: Color(0xff656565))),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(color: const Color(0xffFFF5EB), borderRadius: BorderRadius.circular(50)),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icon/heart.svg',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            context.go(context.namedLocation('cart'));
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(color: const Color(0xffFFF5EB), borderRadius: BorderRadius.circular(50)),
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
        ),
        const SizedBox(width: 20),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
