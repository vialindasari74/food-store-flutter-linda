import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/bloc/profile/profile_bloc.dart';
import 'package:flutter_foodstore/core/constants/app_config.dart';
import 'package:flutter_foodstore/core/utils/error_handler.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formProfileKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();
  File? _image;
  final picker = ImagePicker();
  Map<String, String> _errorMessages = {};
  String? _avatarUrl;

  Future getImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            _buildSnackbar('No Image Selected', Colors.red),
          );
        }
      });
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          _buildSnackbar('No Image Selected', Colors.red),
        );
      });
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildProfileSection();
  }

  Widget _buildProfileSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.maybeWhen(
            loadedProfile: (customer) {
              _fullNameController.text = customer.name.toString();
              _emailController.text = customer.email.toString();
              _avatarUrl = customer.image;
            },
            updatedProfile: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                _buildSnackbar(message, Colors.green),
              );
              context.read<ProfileBloc>().add(const ProfileEvent.loadProfile());
            },
            failure: (errors) {
              setState(() {
                _errorMessages = ErrorHandler.parseErrors(errors);
              });
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                _buildSnackbar(message, Colors.red),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            orElse: () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formProfileKey,
                child: Column(
                  children: [
                    _buildAvatar(),
                    const SizedBox(height: 20),
                    _textFieldFullName(),
                    const SizedBox(height: 15),
                    _textFieldEmail(),
                    const SizedBox(height: 15),
                    _textFieldPassword(),
                    const SizedBox(height: 15),
                    _textFieldConfirmPassword(),
                    const SizedBox(height: 30),
                    _buttonUpdate(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAvatar() {
    return GestureDetector(
      onTap: getImage,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: _image != null
            ? FileImage(_image!)
            : (_avatarUrl != null
                ? NetworkImage(AppConfig.STORAGE_AVATAR + _avatarUrl!)
                : const AssetImage('assets/images/default_avatar.png'))
                    as ImageProvider,
        child: const Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: Icon(Icons.camera_alt, size: 18),
          ),
        ),
      ),
    );
  }

  Widget _textFieldFullName() {
    return TextFormField(
      controller: _fullNameController,
      decoration: const InputDecoration(
        labelText: 'Full Name',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        prefixIcon: Icon(Icons.person),
      ),
    );
  }

  Widget _textFieldEmail() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        errorText: _errorMessages['email'],
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }

  Widget _textFieldPassword() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        prefixIcon: Icon(Icons.lock_outline),
      ),
    );
  }

  Widget _buttonUpdate() {
    return FilledButton(
      onPressed: () {
        if (_formProfileKey.currentState!.validate()) {
          context.read<ProfileBloc>().add(ProfileEvent.updateProfile(
                name: _fullNameController.text,
                email: _emailController.text,
                image: _image,
                password: _passwordController.text.isNotEmpty ? _passwordController.text : null,
                passwordConfirmation: _confirmPasswordController.text.isNotEmpty ? _confirmPasswordController.text : null,
              ));
        }
      },
      child: const Text('Update Profile'),
    );
  }

  SnackBar _buildSnackbar(String message, Color color) {
    return SnackBar(content: Text(message), backgroundColor: color);
  }
}
