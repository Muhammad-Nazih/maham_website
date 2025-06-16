import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maham_website/core/utils/dio_helper.dart';
import 'package:maham_website/widgets/master_layout.dart';

class Contact extends StatefulWidget {
  final String language;
  const Contact({super.key, required this.language});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  // 👇 كنترولرز للنصوص
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    // 🧹 نحرر الذاكرة
    nameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> sendContactForm() async {
    try {
      await DioHelper.postData(
        url: 'posts', // ← استبدله بـ 'contact' لما يبقى عندك API حقيقي
        data: {
          'first_name': nameController.text,
          'last_name': lastNameController.text,
          'email': emailController.text,
          'phone': phoneController.text,
          'subject': subjectController.text,
          'message': messageController.text,
        },
      );

      // ✅ رسالة نجاح
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.language == 'ar'
              ? 'تم الإرسال بنجاح'
              : 'Message sent successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // ✅ مسح البيانات بعد الإرسال الناجح
      nameController.clear();
      lastNameController.clear();
      emailController.clear();
      phoneController.clear();
      subjectController.clear();
      messageController.clear();
    } catch (e) {
      // ❌ رسالة خطأ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.language == 'ar'
              ? 'فشل في الإرسال، حاول مرة أخرى'
              : 'Failed to send. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/home_page_bGround.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1000),
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                margin: const EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'contact_us'.tr(),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                    controller: nameController,
                                    label: 'name'.tr(),
                                    hint: 'name_hint'.tr(),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildTextField(
                                    controller: lastNameController,
                                    label: 'last_name'.tr(),
                                    hint: 'last_name_hint'.tr(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField(
                                    controller: emailController,
                                    label: 'email'.tr(),
                                    hint: 'email_hint'.tr(),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildTextField(
                                    controller: phoneController,
                                    label: 'phone'.tr(),
                                    hint: 'phone_hint'.tr(),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildTextField(
                              controller: subjectController,
                              label: 'subject'.tr(),
                              hint: 'subject_hint'.tr(),
                            ),
                            const SizedBox(height: 16),
                            _buildTextField(
                              controller: messageController,
                              label: 'message'.tr(),
                              hint: 'message_hint'.tr(),
                              maxLines: 5,
                            ),
                            const SizedBox(height: 24),
                            Center(
                              child: SizedBox(
                                width: 200.0,
                                child: ElevatedButton(
                                  onPressed: sendContactForm,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepOrange,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  child: Text(
                                    'send'.tr(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white.withOpacity(0.9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
      ],
    );
  }
}
