import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_router.dart';
import 'service_assets.dart';
import 'service_data.dart';
import 'service_widgets.dart';

/// Figma "Services" — list of providers with Message / Book Now.
class ServiceProvidersScreen extends StatelessWidget {
  const ServiceProvidersScreen({super.key, this.category = 'Services'});

  final String category;

  @override
  Widget build(BuildContext context) {
    final providers = ServiceData.providersFor(category);
    return ServiceScaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            ServicePageHeader(title: category.isEmpty ? 'Services' : category),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  16,
                  4,
                  16,
                  24 + MediaQuery.paddingOf(context).bottom,
                ),
                itemCount: providers.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, i) => ProviderCard(
                  provider: providers[i],
                  onBook: () => context.push(
                    AppRouter.serviceSchedule,
                    extra: providers[i],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProviderCard extends StatelessWidget {
  const ProviderCard({super.key, required this.provider, required this.onBook});

  final ServiceProvider provider;
  final VoidCallback onBook;

  @override
  Widget build(BuildContext context) {
    final blueSmall = servicePoppins(size: 12, color: ServiceColors.primary);
    return ServiceCard(
      radius: 20,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                provider.avatar,
                width: 80,
                height: 80,
                errorBuilder: (_, __, ___) =>
                    const CircleAvatar(radius: 40, child: Icon(Icons.person)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      provider.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: servicePoppins(size: 15),
                    ),
                    const SizedBox(height: 4),
                    Text('₹ ${provider.pricePerDay}/day', style: blueSmall),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const ServiceIcon(
                          ServiceAssets.phone,
                          size: 15,
                          fallback: Icons.phone,
                        ),
                        const SizedBox(width: 6),
                        Text(provider.phone, style: blueSmall),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const ServiceIcon(
                          ServiceAssets.starSmall,
                          size: 16,
                          fallback: Icons.star,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${provider.rating} (${provider.reviews} reviews)',
                          style: servicePoppins(
                            size: 12,
                            color: ServiceColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: ServiceColors.tagYellow,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  provider.tag,
                  style: servicePoppins(size: 13, weight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _OutlineAction(
                  onTap: () => ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text('Chat with ${provider.name} coming soon'),
                      ),
                    ),
                ),
              ),
              const SizedBox(width: 28),
              Expanded(
                child: Material(
                  color: ServiceColors.primary,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: onBook,
                    child: SizedBox(
                      height: 54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Book Now',
                            style: servicePoppins(
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OutlineAction extends StatelessWidget {
  const _OutlineAction({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ServiceColors.border),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ServiceIcon(
                ServiceAssets.chat,
                size: 24,
                fallback: Icons.chat_bubble_outline,
              ),
              const SizedBox(width: 12),
              Text('Message', style: servicePoppins(size: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
