import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/index.dart';

import 'package:portfolio/common/utils/index.dart';
import 'package:portfolio/common/styles/index.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 100,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        // const SizedBox(height: AppSpacing.standardSpacing),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Me',
                style: AppStyles.whiteHeadLineLargeSemiBold(),
              ),
              const SizedBox(height: AppSpacing.largeSpacing),
              TextButton.icon(
                onPressed: () => Services.sendEmail(),
                icon: Icon(Icons.send_sharp, color: AppColors.darkYellow),
                label: Text('pavanasonawane@gmail.com', style: AppStyles.whiteText()),
              ),
              const SizedBox(height: AppSpacing.defaultSpacing),
              TextButton.icon(
                onPressed: () => Services.makePhoneCall('918830182149'),
                icon: Icon(Icons.call, color: AppColors.darkYellow),
                label: Text('+91 8830182149', style: AppStyles.whiteText()),
              ),
              const SizedBox(height: AppSpacing.defaultSpacing),
              TextButton.icon(
                onPressed: () => Services.makePhoneCall('918830182149'),
                icon: Icon(Icons.location_on_outlined, color: AppColors.darkYellow),
                label: Text('Pune, Maharashtra, India', style: AppStyles.whiteText()),
              ),
              const SizedBox(height: AppSpacing.extraSpacing),
              Wrap(
                spacing: AppSpacing.defaultSpacing,
                children: [
                  getIconImageContainer(AppImageAssets.instagram, URLProvider.instagramUrl, isSocialIcon: true),
                  getIconImageContainer(AppImageAssets.whatsapp, URLProvider.whatsappUrl, isSocialIcon: true),
                  getIconImageContainer(AppImageAssets.snapchat, URLProvider.snapchatUrl, isSocialIcon: true),
                  getIconImageContainer(AppImageAssets.facebook, URLProvider.facebookUrl, isSocialIcon: true),
                ],
              ),
              const SizedBox(height: AppSpacing.extraSpacing),
              ElevatedButton(
                onPressed: () {
                  // FileServices.downloadFile();
                },
                child: Text(
                  'Download CV',
                  style: AppStyles.whiteText(),
                ),
              ),
              const SizedBox(height: AppSpacing.largeSpacing * 2),
            ],
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.standardSpacing),
              AppTextField(
                controller: _nameController,
                labelText: 'Name',
                hintText: 'Enter your name',
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value?.trim().isEmpty == true) {
                    return 'Your full name is required';
                  }
                  if (value!.isInValidName() == true) {
                    return 'Please enter valid name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.largeSpacing),
              AppTextField(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value?.trim().isEmpty == true) {
                    return 'Email is required';
                  }
                  if (value!.isInValidEmail() == true) {
                    return 'Please enter valid Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.largeSpacing),
              AppTextField(
                controller: _messageController,
                labelText: 'Message',
                hintText: 'Enter message',
                keyboardType: TextInputType.text,
                maxLines: 5,
                validator: (value) {
                  if (value?.trim().isEmpty == true) {
                    return 'Message is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.extraSpacing),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final response = await Services.sendEmailFromContactUsForm(
                      _nameController.text,
                      _emailController.text,
                      _messageController.text,
                    );
                    if (response.statusCode == 200) {
                      _nameController.clear();
                      _emailController.clear();
                      _messageController.clear();
                      AppToast.showSnackBar(context, "Message Sent Successfully", AppColors.green);
                    } else {
                      AppToast.showSnackBar(context, response.body, AppColors.red);
                    }

                    setState(() {});
                    _formKey.currentState!.reset();
                  }
                },
                child: Text(
                  'Submit',
                  style: AppStyles.whiteText(),
                ),
              ),
            ],
          ),
        ),
        // const SizedBox.shrink(),
      ],
    );
  }

  Widget getIconImageContainer(String imageLink, String url, {bool isSocialIcon = false}) {
    return GestureDetector(
      onTap: () => Services.launchURL(url),
      child: MouseRegion(
        onEnter: (event) => setState(() {}),
        onExit: (event) => setState(() {}),
        cursor: SystemMouseCursors.click,
        child: Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(AppPadding.smallPadding),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: !isSocialIcon ? AppColors.darkGrey.withOpacity(0.7) : null,
          ),
          child: Image.asset(imageLink),
        ),
      ),
    );
  }
}
