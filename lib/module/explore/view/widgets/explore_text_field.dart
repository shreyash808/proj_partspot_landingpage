import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class ExploreTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onFilterTap;

  const ExploreTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.onFilterTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        hintText: StringConsts.search,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.search, color: Colors.black, size: 20),
        ),
        suffixIcon: InkWell(
          onTap: onFilterTap,
          child: const Icon(Icons.filter_list),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 40),
      ),
    );
  }
}
