import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/productBloc.dart';

class Productsview extends StatefulWidget {
  const Productsview({super.key});

  @override
  _ProductsviewState createState() => _ProductsviewState();
}

class _ProductsviewState extends State<Productsview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Price: \$${product.price}'),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: Text('Press the button to load products.'));
          }
        },
      )
    );

  }
}
