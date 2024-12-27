import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/productBloc.dart';

class MyTest2 extends StatelessWidget {
  const MyTest2({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(FetchProducts());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            final products = state.products;

            if (products.isEmpty) {
              return const Center(child: Text('No products available'));
            }

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.shopping_bag),
                    title: Text(product.name),
                    subtitle: Text(
                      'Price: \$${product.price.toStringAsFixed(2)}',
                    ),
                  ),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
