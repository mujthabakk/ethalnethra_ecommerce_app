import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../models/product_model.dart';
import '../../core/providers/cart_provider.dart';
import '../../core/providers/favourites_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Dummy images for slider
    final List<String> productImages = [
      widget.product.imagePath,
      widget.product.imagePath, // In a real app these would be different
      widget.product.imagePath,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.darkBackground,
            size: 22,
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.ios_share,
              color: AppColors.darkBackground,
              size: 24,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image Slider Container
                Container(
                  height: 371.4,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2F3F2),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          viewportFraction: 1.0,
                          enlargeCenterPage: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentImageIndex = index;
                            });
                          },
                        ),
                        items: productImages.map((imagePath) {
                          return Hero(
                            tag: 'product_${widget.product.id}',
                            child: Image.asset(
                              imagePath,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 30),
                      // Interactive Indicator dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: productImages.asMap().entries.map((entry) {
                          return Container(
                            width: _currentImageIndex == entry.key ? 15 : 4,
                            height: 4,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            decoration: BoxDecoration(
                              color: _currentImageIndex == entry.key
                                  ? AppColors.primary
                                  : AppColors.borderGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.name,
                              style: AppTextStyles.productDetailTitle,
                            ),
                          ),
                          Consumer<FavouritesProvider>(
                            builder: (context, favProvider, child) {
                              final isFavorite = favProvider.isFavourite(
                                widget.product.id,
                              );
                              return IconButton(
                                onPressed: () {
                                  favProvider.toggleFavourite(widget.product);
                                },
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite
                                      ? Colors.red
                                      : const Color(0xFF7C7C7C),
                                  size: 28,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '1kg, Price',
                        style: AppTextStyles.productDetailSubtitle,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          _buildQuantityButton(Icons.remove, () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          }, color: const Color(0xFF7C7C7C)),
                          const SizedBox(width: 20),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFE2E2E2),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          _buildQuantityButton(Icons.add, () {
                            setState(() {
                              quantity++;
                            });
                          }, color: AppColors.primary),
                          const Spacer(),
                          Text(
                            '₹${(widget.product.price * quantity).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBackground,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const _CustomDivider(),
                      _buildExpansionTile(
                        'Product Detail',
                        widget.product.longDescription,
                      ),
                      const _CustomDivider(),
                      _buildListTile(
                        'Nutrations',
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEBEBEB),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            '100gr',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7C7C7C),
                            ),
                          ),
                        ),
                      ),
                      const _CustomDivider(),
                      _buildListTile(
                        'Review',
                        trailing: Row(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: Color(0xFFF3603F),
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: widget.product.isPreOrder ? 200 : 120),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Add To Instant Basket & Add To Pre-order Basket
          Positioned(
            bottom: 30,
            left: 25,
            right: 25,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 67,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CartProvider>().addItemToInstant(
                        widget.product,
                        quantity: quantity,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${widget.product.name} added to instant basket!',
                          ),
                          duration: const Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Add To Instant Basket',
                      style: AppTextStyles.productDetailButton,
                    ),
                  ),
                ),
                if (widget.product.isPreOrder) ...[
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 67,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CartProvider>().addItemToPreOrder(
                          widget.product,
                          quantity: quantity,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${widget.product.name} added to pre-order basket!',
                            ),
                            duration: const Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.preOrderOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Add To Pre-order Basket',
                        style: AppTextStyles.productDetailButton,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(
    IconData icon,
    VoidCallback onPressed, {
    required Color color,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Icon(icon, color: color, size: 28),
    );
  }

  Widget _buildExpansionTile(String title, String content) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(title, style: AppTextStyles.productDetailSectionHeader),
        tilePadding: EdgeInsets.zero,
        iconColor: AppColors.darkBackground,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(content, style: AppTextStyles.productDetailDescription),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, {Widget? trailing}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            Text(title, style: AppTextStyles.productDetailSectionHeader),
            const Spacer(),
            if (trailing != null) ...[trailing, const SizedBox(width: 15)],
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.darkBackground,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: const Color(0xFFE2E2E2).withOpacity(0.7),
    );
  }
}
