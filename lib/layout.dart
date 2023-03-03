import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
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
            ),
          ],
        ),
      ],
    ),
  ],
);
