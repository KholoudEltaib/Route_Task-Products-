/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:rout_task_products/features/product/data/datasources/product_remote_datasource.dart';
import 'package:rout_task_products/features/product/data/repositories/product_repository_impl.dart';
import 'package:rout_task_products/features/product/presentation/providers/product_provider.dart';
import 'package:rout_task_products/features/product/presentation/screens/product_screen.dart';

*/

// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as di;
import 'package:rout_task_products/features/product/presentation/blocs/product_bloc.dart';
import 'package:rout_task_products/features/product/presentation/blocs/product_event.dart';
import 'package:rout_task_products/features/product/presentation/screens/product_screen.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (_) => di.sl<ProductBloc>()..add(LoadProducts()),
        ),
      ],
      child: MaterialApp(
        title: 'Product List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductScreen(),
      ),
    );
  }
}


/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provide the http client
        Provider<http.Client>(create: (_) => http.Client()),

        // Provide the remote data source
        Provider<ProductRemoteDataSource>(
          create: (context) => ProductRemoteDataSourceImpl(
            client: context.read<http.Client>(),
          ),
        ),

        // Provide the repository
        Provider<ProductRepository>(
          create: (context) => ProductRepositoryImpl(
            remoteDataSource: context.read<ProductRemoteDataSource>(),
          ),
        ),

        // Provide the provider and load products
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(
            repository: context.read<ProductRepository>(),
          )..loadProducts(),
        ),
      ],
      child: MaterialApp(
        title: 'Product List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductScreen(),
      ),
    );
  }
}
*/