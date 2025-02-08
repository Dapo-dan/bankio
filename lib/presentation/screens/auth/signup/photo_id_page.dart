import 'package:bankio/logic/auth/signup/signup_bloc.dart';
import 'package:bankio/presentation/screens/auth/signup/fill_profile_page.dart';
import 'package:bankio/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoIdPage extends StatelessWidget {
  const PhotoIdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).iconTheme.color),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Photo ID Card",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Please point the camera at the ID card.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.camera_alt,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    title: "TRY AGAIN",
                    onTap: () {
                      // Reset photo capture
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppButton(
                    title: "CONTINUE",
                    onTap: () {
                      context
                          .read<SignupBloc>()
                          .add(PhotoCaptured("photo_path_here"));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FillProfilePage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
