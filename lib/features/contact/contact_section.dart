import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';
import '../../core/widgets/glass_container.dart';
import '../../core/widgets/section_header.dart';
import '../hero/hero_section.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;
  bool _submittedSuccess = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          _isSubmitting = false;
          _submittedSuccess = true;
        });
        _nameController.clear();
        _emailController.clear();
        _subjectController.clear();
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 64,
        vertical: 80,
      ),
      child: MaxWidthContainer(
        maxWidth: 1100,
        child: Column(
          children: [
            const SectionHeader(
              categoryTag: 'Get In Touch',
              title: "Let's Connect & Build Together",
              subtitle: 'Open for full-time Flutter Developer roles, mobile engineering contracts, and architectural consultations',
            ),
            const SizedBox(height: 48),

            isMobile
                ? Column(
                    children: [
                      _buildContactInfo(context),
                      const SizedBox(height: 32),
                      _buildContactForm(context),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: _buildContactInfo(context).animate().fadeIn(duration: 800.ms).slideX(begin: -0.12, end: 0),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        flex: 7,
                        child: _buildContactForm(context).animate().fadeIn(duration: 800.ms, delay: 200.ms).slideX(begin: 0.12, end: 0),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(32),
      borderRadius: BorderRadius.circular(24),
      borderColor: AppColors.borderDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Details',
            style: AppTextStyles.cardTitle.copyWith(fontSize: 22),
          ),
          const SizedBox(height: 12),
          Text(
            'Feel free to reach out directly through email or connect via social profiles.',
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: 32),

          // Email Info Row
          _buildInfoRow(
            icon: Icons.email,
            title: 'Direct Email',
            value: AppConstants.emailAddress,
            onTap: () => UrlHelper.openEmail(AppConstants.emailAddress),
          ),
          const SizedBox(height: 20),

          // Role Info Row
          _buildInfoRow(
            icon: Icons.work_outline,
            title: 'Current Role',
            value: '${AppConstants.currentRole} at ${AppConstants.currentCompany}',
          ),
          const SizedBox(height: 20),

          // Education Row
          _buildInfoRow(
            icon: Icons.school,
            title: 'BSc Computer Science',
            value: AppConstants.university,
          ),

          const SizedBox(height: 32),
          const Divider(color: AppColors.borderDark, height: 1),
          const SizedBox(height: 24),

          Text(
            'Social Platforms',
            style: AppTextStyles.badgeText.copyWith(color: AppColors.textMuted),
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              _buildSocialButton(
                icon: Icons.code,
                url: AppConstants.githubUrl,
                tooltip: 'GitHub',
              ),
              const SizedBox(width: 12),
              _buildSocialButton(
                icon: Icons.link,
                url: AppConstants.linkedinUrl,
                tooltip: 'LinkedIn',
              ),
              const SizedBox(width: 12),
              _buildSocialButton(
                icon: Icons.email,
                url: 'mailto:${AppConstants.emailAddress}',
                tooltip: 'Email',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.flutterCyan.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.flutterCyan, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textMuted),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String url,
    required String tooltip,
  }) {
    return IconButton(
      onPressed: () => UrlHelper.launchURL(url),
      tooltip: tooltip,
      icon: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderDark),
        ),
        child: Icon(icon, size: 20, color: AppColors.flutterCyan),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(32),
      borderRadius: BorderRadius.circular(24),
      borderColor: AppColors.borderDark,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send a Message',
              style: AppTextStyles.cardTitle.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 20),

            if (_submittedSuccess) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.accentEmerald.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.accentEmerald.withValues(alpha: 0.4)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle_outline, color: AppColors.accentEmerald, size: 20),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Thank you! Your message has been sent successfully. I will get back to you shortly.',
                        style: TextStyle(fontSize: 13, color: AppColors.accentEmerald),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Name Field
            _buildTextField(
              controller: _nameController,
              label: 'Your Name',
              hint: 'John Doe',
              validator: (v) => v == null || v.trim().isEmpty ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 16),

            // Email Field
            _buildTextField(
              controller: _emailController,
              label: 'Email Address',
              hint: 'john@example.com',
              keyboardType: TextInputType.emailAddress,
              validator: (v) => v == null || !v.contains('@') ? 'Please enter a valid email' : null,
            ),
            const SizedBox(height: 16),

            // Subject Field
            _buildTextField(
              controller: _subjectController,
              label: 'Subject',
              hint: 'Flutter Developer Role / Inquiry',
              validator: (v) => v == null || v.trim().isEmpty ? 'Please enter a subject' : null,
            ),
            const SizedBox(height: 16),

            // Message Field
            _buildTextField(
              controller: _messageController,
              label: 'Message',
              hint: 'Write your message details...',
              maxLines: 4,
              validator: (v) => v == null || v.trim().isEmpty ? 'Please enter your message' : null,
            ),
            const SizedBox(height: 24),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isSubmitting ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.flutterPrimary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 6,
                ),
                icon: _isSubmitting
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Icon(Icons.send, size: 16),
                label: Text(
                  _isSubmitting ? 'Sending Message...' : 'Send Message',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 13),
            filled: true,
            fillColor: AppColors.surfaceDark,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderDark),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderDark),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.flutterCyan, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
