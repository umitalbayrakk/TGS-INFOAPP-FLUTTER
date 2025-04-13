import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/corparate_agreements_viewmodel.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/appbar/custom_appbar_widgets.dart';

class CorporateAgreementsView extends StatefulWidget {
  const CorporateAgreementsView({super.key});

  @override
  State<CorporateAgreementsView> createState() => _CorporateAgreementsViewState();
}

class _CorporateAgreementsViewState extends State<CorporateAgreementsView> {
  final CorporateAgreementsViewModel viewModel = CorporateAgreementsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBarWidgets(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(delegate: SliverChildListDelegate([_buildHeaderSection(), const SizedBox(height: 24)])),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: _buildAgreementCard(agreement: viewModel.agreements[index]),
                ),
                childCount: viewModel.agreements.length,
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          "TGS olarak, Türk Hava Yolları ve iş ortaklarımızla yer hizmetleri alanında imzaladığımız modern anlaşmaları keşfedin.",
          style: TextStyle(fontSize: 16, color: Colors.grey[700], height: 1.5),
        ),
      ],
    );
  }

  Widget _buildAgreementCard({required CorporateAgreement agreement}) {
    return Card(
      color: AppColors.customCardColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          viewModel.showAgreementDetails(context, agreement);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.borderColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(agreement.icon, color: AppColors.borderColor, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          agreement.title,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.borderColor),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Geçerlilik: ${viewModel.formatDate(agreement.startDate)} - ${viewModel.formatDate(agreement.endDate)}",
                          style: TextStyle(fontSize: 12, color: AppColors.greenSpot, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(agreement.description, style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.4)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    agreement.benefits
                        .take(2)
                        .map(
                          (benefit) => Chip(
                            label: Text(benefit),
                            backgroundColor: AppColors.darkColor.withOpacity(0.1),
                            labelStyle: TextStyle(color: AppColors.borderColor, fontSize: 12),
                          ),
                        )
                        .toList(),
              ),
              if (agreement.benefits.length > 2) ...[
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "+${agreement.benefits.length - 2} daha fazla",
                    style: TextStyle(fontSize: 12, color: AppColors.borderColor, fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    viewModel.showAgreementDetails(context, agreement);
                  },
                  child: Text(
                    'Detayları Gör',
                    style: TextStyle(color: AppColors.borderColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AgreementDetailsSheet extends StatelessWidget {
  final CorporateAgreement agreement;
  final ScrollController scrollController;
  final CorporateAgreementsViewModel viewModel;

  const AgreementDetailsSheet({
    super.key,
    required this.agreement,
    required this.scrollController,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.scaffoldBackgroundColor,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(color: AppColors.borderColor, borderRadius: BorderRadius.circular(2)),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.borderColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(agreement.icon, color: AppColors.borderColor, size: 32),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      agreement.title,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.borderColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Anlaşma Detayları",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey[800]),
              ),
              const SizedBox(height: 8),
              Text(agreement.description, style: TextStyle(fontSize: 16, color: Colors.grey[600], height: 1.5)),
              const SizedBox(height: 24),
              _buildDetailRow(
                icon: Icons.calendar_today,
                label: "Geçerlilik Tarihi",
                value: "${viewModel.formatDate(agreement.startDate)} - ${viewModel.formatDate(agreement.endDate)}",
              ),
              const SizedBox(height: 16),
              Text(
                "Kazanımlar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.borderColor),
              ),
              const SizedBox(height: 8),
              ...agreement.benefits.map(
                (benefit) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FeatherIcons.checkSquare, color: AppColors.borderColor, size: 20),
                      const SizedBox(width: 8),
                      Expanded(child: Text(benefit, style: TextStyle(fontSize: 15, color: Colors.grey[700]))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({required IconData icon, required String label, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.borderColor, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.borderColor)),
              const SizedBox(height: 4),
              Text(value, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            ],
          ),
        ),
      ],
    );
  }
}
