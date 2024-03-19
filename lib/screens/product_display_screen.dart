import 'package:flutter/material.dart';
import 'package:project2/data/data.dart' as data;
import 'package:project2/screens/product_detail_screen.dart' as product_detail;
import 'package:project2/utils/colors.dart';
import 'package:project2/widgets/product_display_list_view.dart';
import 'package:project2/widgets/top_container.dart';

class ProductDisplayScreen extends StatefulWidget {
  ProductDisplayScreen({Key? key}) : super(key: key);

  @override
  State<ProductDisplayScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedValue = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // Function to handle tapping on a product
  void _onProductTapped(data.Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            product_detail.ProductDetailScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Column(
        children: [
          TopContainer(
            title: "KK-Fashions",
            searchBarTitle: "Search Product",
          ),
          // Tab bar and tab views
          TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: kBackgroundColor,
            indicatorSize: TabBarIndicatorSize.label,
            onTap: (value) {
              setState(() {
                selectedValue = value;
              });
              tabController.animateTo(value);
            },
            tabs: [
              _buildTab("Trending", selectedValue == 0),
              _buildTab("Clothing", selectedValue == 1),
              _buildTab("Shoes", selectedValue == 2),
            ],
          ),
          // Tab view
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                // Product display widget for trending
                ProductDisplayWidget(onProductTapped: _onProductTapped),
                // Product display widget for clothing
                ProductDisplayWidget(onProductTapped: _onProductTapped),
                // Product display widget for shoes
                ProductDisplayWidget(onProductTapped: _onProductTapped),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Helper function to build tab
  Widget _buildTab(String title, bool isSelected) {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isSelected ? kBackgroundColor : kGreyColor.withOpacity(0.8),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(0, 1),
                )
              ]
            : null,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    );
  }
}
