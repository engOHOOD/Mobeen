import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobeen/core/constants/app_colors.dart';

class AddLocationBottomSheet extends HookWidget {
  const AddLocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedLocation = useState<LatLng?>(null);
    final nameController = useTextEditingController();
    final addressController = useTextEditingController();
    final hajjCodeController = useTextEditingController();
    final hajjNationalityController = useTextEditingController();

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 70,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Gap(24),
              Center(
                child: Text(
                  "إضافة موقع جديد",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              Gap(28),
              Text(
                "اسم الموقع",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              Gap(10),
              TextField(
                controller: nameController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "أدخل اسم الموقع",
                  hintStyle: TextStyle(color: AppColors.textHint),
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Gap(20),
              Text(
                "العنوان الوطني",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              Gap(10),
              TextField(
                controller: addressController,
                textAlign: TextAlign.right,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "أدخل العنوان الوطني",
                  hintStyle: TextStyle(color: AppColors.textHint),
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Gap(20),
              Text(
                "كود الحج",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              Gap(10),

              TextField(
                controller: hajjCodeController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "أدخل كود الحج",
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              Gap(20),

              Text(
                "جنسية الحج",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              Gap(10),

              TextField(
                controller: hajjNationalityController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "أدخل الجنسية",
                  filled: true,
                  fillColor: AppColors.surface,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Gap(24),
              Text(
                "اختر الموقع من الخريطة",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              Gap(12),
              Container(
                height: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow.withAlpha(20),
                      blurRadius: 10,
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(24.7136, 46.6753),
                    zoom: 14,
                  ),
                  onTap: (LatLng position) {
                    selectedLocation.value = position;
                  },
                  markers: selectedLocation.value != null
                      ? {
                          Marker(
                            markerId: MarkerId("selected_location"),
                            position: selectedLocation.value!,
                          ),
                        }
                      : {},
                ),
              ),
              Gap(16),
              if (selectedLocation.value != null)
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "الإحداثيات المحددة",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Gap(8),
                      Text(
                        "Lat: ${selectedLocation.value!.latitude}",
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        "Lng: ${selectedLocation.value!.longitude}",
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              Gap(30),
              SizedBox(
                height: 58,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text(
                    "حفظ الموقع",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.surface,
                    ),
                  ),
                ),
              ),
              Gap(30),
            ],
          ),
        );
      },
    );
  }
}
