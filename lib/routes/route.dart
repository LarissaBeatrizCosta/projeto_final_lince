// ignore_for_file: avoid_classes_with_only_static_members, João ajudou

import 'package:flutter/material.dart';
import '../views/customers_view.dart';
import '../views/home_view.dart';
import '../views/managers_view.dart';
import '../views/register_customer_view.dart';
import '../views/register_manager_view.dart';
import '../views/register_rent_view.dart';
import '../views/register_vehicles.dart';
import '../views/rents_view.dart';
import '../views/settings_view.dart';
import '../views/vehicles_view.dart';

/// Gerenciamento de rotas
class Routes {
  ///Crias as rotas
  static Route<dynamic> createRoutes(RouteSettings route) {
    switch (route.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());

      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsView());

      case '/register_customer':
        return MaterialPageRoute(builder: (_) => RegisterCustomerView());

      case '/customers':
        return MaterialPageRoute(builder: (_) => const CustomersView());

      case '/register_manager':
        return MaterialPageRoute(builder: (_) => RegisterManagerView());

      case '/managers':
        return MaterialPageRoute(builder: (_) => const ManagersView());

      case '/register_vehicles':
        return MaterialPageRoute(builder: (_) => RegisterVehicleView());

      case '/vehicles':
        return MaterialPageRoute(builder: (_) => const VehiclesView());

      case '/register_rents':
        return MaterialPageRoute(builder: (_) => RegisterRentView());

      case '/rents':
        return MaterialPageRoute(builder: (_) => const RentsView());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Text('Pagina não encontrada!'),
          ),
        );
    }
  }
}
