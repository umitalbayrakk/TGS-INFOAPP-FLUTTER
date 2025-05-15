import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';
import 'package:tgs_info_app_flutter/widgets/shiftcard/shift_card_widgets_viewmodel.dart';

class ShiftCardWidgets extends StatelessWidget {
  final ShiftViewModel viewModel;
  const ShiftCardWidgets({super.key, required this.viewModel});

  void _showShiftDetails(BuildContext context, String team, String shift, DateTime date) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shift Detayları - Ekip $team',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                _buildDetailRow(context, 'Shift:', shift, Icons.punch_clock),
                _buildDetailRow(context, 'Saat:', viewModel.getShiftTime(shift), Icons.lock_clock),
                _buildDetailRow(context, 'Tarih:', viewModel.getFormattedDate(date), Icons.calendar_month),
                const SizedBox(height: 24),
                Text(
                  'Ekip Üyeleri',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                ...viewModel
                    .getTeamMembers(team)
                    .map(
                      (member) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            Icon(Icons.person_outline, size: 22, color: Theme.of(context).iconTheme.color),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                member,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 2,
                      backgroundColor: AppColors.buttonColor,
                    ),
                    child: Text(
                      'Kapat',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, color: AppColors.whiteSpot),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Theme.of(context).iconTheme.color),
          const SizedBox(width: 12),
          Text('$label $value', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentShift = viewModel.getCurrentShift(now);
    String? activeTeam = viewModel.getActiveTeam(now);

    if (activeTeam == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: () => _showShiftDetails(context, activeTeam, currentShift, now),
        child: Container(
          height: 160,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            color: AppColors.cardColor3,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: AppColors.borderColor.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4)),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.group, size: 20, color: AppColors.borderColor),
                  const SizedBox(width: 8),
                  Text(
                    'Takım: $activeTeam',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppColors.borderColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.punch_clock, size: 20, color: AppColors.borderColor),
                  const SizedBox(width: 8),
                  Text(
                    'Shift: $currentShift',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppColors.borderColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.lock_clock, size: 20, color: AppColors.borderColor),
                  const SizedBox(width: 8),
                  Text(
                    'Saat: ${viewModel.getShiftTime(currentShift)}',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppColors.borderColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_month, size: 20, color: AppColors.borderColor),
                  const SizedBox(width: 8),
                  Text(
                    'Tarih: ${viewModel.getFormattedDate(now)}',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppColors.borderColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
