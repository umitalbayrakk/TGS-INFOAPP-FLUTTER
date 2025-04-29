import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tgs_info_app_flutter/presentation/viewmodel/shift_card_viewmodel.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class ShiftCardWidgets extends StatelessWidget {
  final ShiftViewModel viewModel;
  const ShiftCardWidgets({super.key, required this.viewModel});

  void _showShiftDetails(BuildContext context, String team, String shift, DateTime date) {
    showModalBottomSheet(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vardiya Detayları - Ekip $team',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.borderColor),
              ),
              const SizedBox(height: 10),
              _buildDetailRow('Vardiya:', shift),
              _buildDetailRow('Saat:', viewModel.getShiftTime(shift)),
              _buildDetailRow('Tarih:', viewModel.getFormattedDate(date)),
              const SizedBox(height: 16),
              Text(
                'Ekip Üyeleri:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.borderColor),
              ),
              const SizedBox(height: 8),
              ...viewModel
                  .getTeamMembers(team)
                  .map(
                    (member) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Icon(Icons.person, size: 20, color: AppColors.borderColor),
                          const SizedBox(width: 8),
                          Text(
                            member,
                            style: TextStyle(fontSize: 14, color: AppColors.borderColor, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Kapat", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.borderColor)),
          const SizedBox(width: 8),
          Text(value, style: TextStyle(fontSize: 14, color: AppColors.borderColor)),
        ],
      ),
    );
  }

  // Row --
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(icon, size: 12, color: AppColors.borderColor),
          const SizedBox(width: 2),
          Text('$label ', style: TextStyle(color: AppColors.borderColor, fontWeight: FontWeight.bold, fontSize: 13)),
          Text(
            value,
            style: TextStyle(color: AppColors.borderColor, fontWeight: FontWeight.bold, fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () => _showShiftDetails(context, activeTeam, currentShift, now),
            child: Container(
              height: 135,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                color: AppColors.customCardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FeatherIcons.users, size: 15),
                      const SizedBox(width: 5),
                      Text(
                        'Ekip: $activeTeam',
                        style: TextStyle(color: AppColors.borderColor, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  _buildInfoRow(FeatherIcons.clipboard, 'Vardiya:', currentShift),
                  SizedBox(width: 5),
                  _buildInfoRow(FeatherIcons.clock, 'Saat:', viewModel.getShiftTime(currentShift)),
                  SizedBox(width: 5),
                  _buildInfoRow(FeatherIcons.calendar, 'Tarih:', viewModel.getFormattedDate(now)),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
