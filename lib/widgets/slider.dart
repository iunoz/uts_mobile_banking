import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final String title;
  final double currentLimit;
  final ValueChanged<double> onChanged;

  const CustomSlider({
    super.key,
    required this.title,
    required this.currentLimit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          'Current Limit: Rp ${currentLimit.round()}',
          style: const TextStyle(fontSize: 14, color: Colors.teal),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFF7EBDA6),
            inactiveTrackColor: const Color.fromARGB(82, 123, 123, 123),
            thumbColor: const Color(0xFF7EBDA6),
          ),
          child: Slider(
            value: currentLimit,
            min: 10000,
            max: 1000000,
            divisions: 990,
            label: 'Rp ${currentLimit.round()}',
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
