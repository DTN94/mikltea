import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:milktea/screen/account_info_screen.dart';
import 'package:milktea/screen/cart_confirm_screen.dart';
import 'package:milktea/screen/cart_screen.dart';
import 'package:milktea/screen/index_screen.dart';
import 'package:milktea/screen/intro_screen.dart';
import 'package:milktea/screen/product_detail_screen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const IntroScreen();
      },
      routes: [
        GoRoute(
          path: 'home',
          name: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const IndexScreen();
          },
          routes: [
            GoRoute(
              path: 'product/:id',
              name: 'product',
              builder: (BuildContext context, GoRouterState state) {
                return ProductDetailScreen(
                  productId: int.parse(state.params['id']!),
                );
              },
            ),
            GoRoute(
              path: 'cart',
              name: 'cart',
              builder: (BuildContext context, GoRouterState state) {
                return const CartScreen();
              },
              routes: [
                GoRoute(
                  path: 'cart_confirm',
                  name: 'cart_confirm',
                  builder: (BuildContext context, GoRouterState state) {
                    return const CartConfirm();
                  },
                ),
              ],
            ),
            GoRoute(
              path: 'account_info',
              name: 'account_info',
              builder: (BuildContext context, GoRouterState state) {
                return const AccountInfoScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
