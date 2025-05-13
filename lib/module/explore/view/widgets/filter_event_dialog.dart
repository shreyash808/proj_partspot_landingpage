import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class FilterDialogWidget extends StatefulWidget {
  final List<String> areaList;
  final List<String> priceList;
  final List<String> themeList;
  final List<String> months;
  final List<String> selectedArea;
  final List<String> selectedPrice;
  final List<String> selectedTheme;

  const FilterDialogWidget({
    super.key,
    required this.areaList,
    required this.priceList,
    required this.themeList,
    required this.months,
    required this.selectedArea,
    required this.selectedPrice,
    required this.selectedTheme,
  });

  @override
  State<FilterDialogWidget> createState() => _FilterDialogWidgetState();
}

class _FilterDialogWidgetState extends State<FilterDialogWidget> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width * .90,
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  'Filters',
                  style: AppTextStyles.get24BoldTextStyle(),
                ),
              ),

              _buildSectionTitle('Area'),
              _buildChips(
                widget.areaList,
                widget.selectedArea,
                allowMultiple: true,
              ),

              _buildSectionTitle('Price Range'),
              _buildChips(widget.priceList, widget.selectedPrice),

              _buildSectionTitle('Select Theme'),
              _buildChips(widget.themeList, widget.selectedTheme),

              const SizedBox(height: 20),

              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xffEDEDED),
                  border: Border.all(color: const Color(0xffD1D1D1)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedOption,
                    hint: const Text('All Months-'),
                    style: AppTextStyles.get8MediumTextStyle(
                      color: const Color(0xff6F6F6F),
                    ),
                    iconSize: 20,
                    itemHeight: null,
                    dropdownColor: const Color(0xffEDEDED),
                    items:
                        widget.months.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 1),
                              child: Text(
                                value,
                                style: AppTextStyles.get8MediumTextStyle(
                                  color: const Color(0xff6F6F6F),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColor.buttonOrange,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    "Apply",
                    style: AppTextStyles.get14BoldTextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 10),
      child: Text(
        title,
        style: AppTextStyles.get14MediumTextStyle(
          color: const Color(0xff6F6F6F),
        ),
      ),
    );
  }

  Widget _buildChips(
    List<String> items,
    List<String> selectedItems, {
    bool allowMultiple = false,
  }) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children:
          items.map((item) {
            final isSelected = selectedItems.contains(item);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (allowMultiple) {
                    if (isSelected) {
                      selectedItems.remove(item);
                    } else {
                      selectedItems.add(item);
                    }
                  } else {
                    if (isSelected) {
                      selectedItems.clear();
                    } else {
                      selectedItems.clear();
                      selectedItems.add(item);
                    }
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? const Color(0xffB79DFF)
                          : const Color(0xffEDEDED),
                  border:
                      isSelected
                          ? Border.all(color: const Color(0xff8C63FF), width: 1)
                          : null,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  item,
                  style: AppTextStyles.get8RegularTextStyle(
                    color: isSelected ? Colors.white : const Color(0xff6F6F6F),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
