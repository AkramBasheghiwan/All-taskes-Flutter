import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        fontFamily: 'Segoe UI', // يمكنك تغيير الخط هنا
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // مفتاح النموذج للتحقق
  final _formKey = GlobalKey<FormState>();

  // وحدات التحكم بالنصوص
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // حالة ظهور كلمة المرور
  bool _isObscure = true;

  // -----------------------------------------------------------
  // دالة التحقق من البريد الإلكتروني (صارمة جداً)
  // -----------------------------------------------------------
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    // تعبير نمطي صارم للبريد الإلكتروني
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (!emailRegex.hasMatch(value)) {
      return 'صيغة البريد الإلكتروني غير صحيحة (example@mail.com)';
    }
    return null;
  }

  // -----------------------------------------------------------
  // دالة التحقق من كلمة المرور (صارمة جداً)
  // -----------------------------------------------------------
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 8) {
      return 'يجب أن تكون 8 خانات على الأقل';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'يجب أن تحتوي على حرف كبير واحد (A-Z)';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'يجب أن تحتوي على حرف صغير واحد (a-z)';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'يجب أن تحتوي على رقم واحد على الأقل';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'يجب أن تحتوي على رمز خاص (!@#...)';
    }
    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // إذا كان التحقق ناجحاً
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم التحقق بنجاح! جاري تسجيل الدخول...'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      // إذا فشل التحقق
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى تصحيح الأخطاء أعلاه'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // لون خلفية هادئ
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // الشعار أو العنوان
                const Icon(
                  Icons.lock_outline_rounded,
                  size: 80,
                  color: Colors.indigo,
                ),
                const SizedBox(height: 20),
                const Text(
                  'مرحباً بك مجدداً',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Text(
                  'سجل دخولك للمتابعة',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 40),

                // --------------------------
                // حقل البريد الإلكتروني
                // --------------------------
                CustomTextField(
                  controller: _emailController,
                  labelText: 'البريد الإلكتروني',
                  hintText: 'user@example.com',
                  prefixIcon: Icons.email_outlined,
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                // --------------------------
                // حقل كلمة المرور
                // --------------------------
                CustomTextField(
                  controller: _passwordController,
                  labelText: 'كلمة المرور',
                  hintText: '********',
                  prefixIcon: Icons.lock_outline,
                  validator: _validatePassword,
                  obscureText: _isObscure,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 10),

                // زر نسيت كلمة المرور
                Align(
                  alignment:
                      Alignment.centerLeft, // لليسار لأن التطبيق قد يكون عربي
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    shadowColor: Colors.indigo.withOpacity(0.4),
                  ),
                  child: const Text(
                    'تسجيل الدخول',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3), // تغيير موضع الظل
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Icon(prefixIcon, color: Colors.indigoAccent),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none, // إخفاء الحدود الافتراضية
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.indigo, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          fillColor: Colors.white,
          filled: true,
          labelStyle: TextStyle(color: Colors.grey[600]),
          hintStyle: TextStyle(color: Colors.grey[400]),
        ),
      ),
    );
  }
}
