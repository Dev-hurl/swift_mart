import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_mart/core/theme/app_colors.dart';

class SmartSearchBar extends StatefulWidget {
  const SmartSearchBar({super.key});

  @override
  State<SmartSearchBar> createState() => _SmartSearchBarState();
}

class _SmartSearchBarState extends State<SmartSearchBar> {
  
  final List<String> _allProducts = [
    'iPhone 15 Pro',
    'MacBook Air M3',
    'iPad Pro',
    'Sony WH-1000XM5 Headphones',
    'Logitech MX Master 3S Mouse',
    'Anker USB-C Charger',
    'Samsung Galaxy S24 Ultra',
  ];

  final SearchController _searchController = SearchController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen: false,
      searchController: _searchController,
      // The builder controls what the search bar looks like on your main screen
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          onTap: () {
            controller.openView(); // Opens the suggestion overlay panel
          },
          onChanged: (_) {
            controller.openView(); // Ensures it stays open when typing begins
          },
          leading: HugeIcon(
            icon: HugeIcons.strokeRoundedSearch02,
            color: AppColors.textSecondary,
          ),
          hintText: 'Search items on Swift Mart...',
          elevation: WidgetStatePropertyAll<double>(0.0),
          backgroundColor: WidgetStatePropertyAll<Color>(Colors.grey.shade100),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12.0,
              ), // Inherit your global layout tokens
            ),
          ),
        );
      },
      // The viewBuilder updates the suggestions overlay dynamically as the user types
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        final String input = controller.text.trim().toLowerCase();

        // 1. If the user hasn't typed anything yet, show recent searches or trending items
        if (input.isEmpty) {
          return [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Trending Searches',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('MacBook Air M3'),
              onTap: () => _selectItem('MacBook Air M3'),
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('iPhone 15 Pro'),
              onTap: () => _selectItem('iPhone 15 Pro'),
            ),
          ];
        }

        // 2. Filter available items dynamically based on the current search input string
        final filteredProducts = _allProducts.where((product) {
          return product.toLowerCase().contains(input);
        }).toList();

        // 3. Handle empty state if no matching items are located
        if (filteredProducts.isEmpty) {
          return [
            ListTile(
              title: Text(
                'No items found matching your query.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ];
        }

        // 4. Return the filtered list of available items as matching suggestions
        return filteredProducts.map((String product) {
          return ListTile(
            leading: Icon(
              Icons.history_toggle_off,
            ), // Swap to generic search/product icon
            title: Text(product),
            trailing: Icon(
              Icons.north_west,
              size: 16,
              color: Colors.grey,
            ), // Standard search completion arrow
            onTap: () => _selectItem(product),
          );
        }).toList();
      },
    );
  }

  void _selectItem(String product) {
    setState(() {
      _searchController.text = product;
      _searchController.closeView(
        product,
      ); // Closes suggestion box and updates input value
    });
  }
}
