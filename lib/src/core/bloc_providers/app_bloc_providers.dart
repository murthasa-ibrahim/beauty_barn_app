import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_superlabs/src/features/product_search/presentation/bloc/product_bloc/product_bloc.dart';

List<BlocProvider> appBlocProviders = [
  BlocProvider<ProductBloc>(create: (context) => ProductBloc()),
];
