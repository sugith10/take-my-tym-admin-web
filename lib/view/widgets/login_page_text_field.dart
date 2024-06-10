import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPageTextField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool show;
  const LoginPageTextField({
    this.show = false,
    required this.controller,
    required this.hint,
    required this.icon,
    super.key,
  });

  @override
  State<LoginPageTextField> createState() => _LoginPageTextFieldState();
}

class _LoginPageTextFieldState extends State<LoginPageTextField> {
  late bool _show;
  @override
  void initState() {
    super.initState();
    _show = widget.show;
  }

  void _showPassword() {
    setState(() {
      _show = !_show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.hint,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.labelSmall),
        SizedBox(height: 10.h),
        TextField(
          obscureText: _show,
          controller: widget.controller,
          style: Theme.of(context).textTheme.labelLarge,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: Theme.of(context).textTheme.labelLarge,
            prefixIcon: Icon(
              widget.icon,
              weight: 10,
            ),
            suffixIcon: widget.show
                ? Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: IconButton(
                      onPressed: () {
                        _showPassword();
                      },
                      icon: Icon(
                        _show
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                      ),
                    ),
                  )
                : null,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            filled: true,
            fillColor:
                const Color.fromARGB(255, 238, 238, 238).withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
