import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:meals_app/components/custom_header.dart';
import 'package:meals_app/components/custom_text_input.dart';
import 'package:meals_app/constants.dart';
import 'package:meals_app/cubits/image_cubit/image_cubit.dart';
import 'package:meals_app/cubits/tags_cubit/tags_cubit.dart';

class ShareMealPage extends StatelessWidget {
  const ShareMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CustomHeader(
              text: 'S H A R E',
              myIcon: Icons.share,
            ),
            const SizedBox(
              height: 50,
            ),
            const CustomTextInput(
              maxlines: 1,
              text: "What's the name of your dish?",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<TagsCubit, TagsState>(
              builder: (context, state) {
                Map myTags = BlocProvider.of<TagsCubit>(context).mealTagsMap;
                return SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (String key in myTags.keys)
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<TagsCubit>(context)
                                .selectTag(tag: key);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDEDED),
                              borderRadius: BorderRadius.circular(32),
                              border: myTags[key] ? Border.all() : null,
                            ),
                            child: Text(
                              key,
                              style: TextStyle(
                                fontWeight: myTags[key]
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Add Photo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<ImageCubit, ImageState>(
              builder: (context, state) {
                XFile? myImage = BlocProvider.of<ImageCubit>(context).imageFile;
                return Container(
                  clipBehavior: Clip.antiAlias,
                  height: 200,
                  decoration: BoxDecoration(
                    color: kmainColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<ImageCubit>(context).uploadImage();
                    },
                    child: myImage == null
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_upload_outlined,
                                size: 30,
                              ),
                              Text(
                                'Upload a Photo',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          )
                        : Image.file(
                            File(myImage.path),
                            fit: BoxFit.cover,
                          ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextInput(
              maxlines: 10,
              text: 'Describe your dish',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextInput(
              maxlines: 10,
              text: 'Write down the steps to make this dish',
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Dialogs.materialDialog(
                      msg: 'Your meal has been successfully added',
                      title: "Success",
                      color: Colors.white,
                      context: context,
                      actions: [
                        IconsButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: 'Confirm',
                          iconData: Icons.check,
                          color: Colors.black,
                          textStyle: const TextStyle(color: Colors.white),
                          iconColor: Colors.green,
                        ),
                      ]);
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: const Text(
                  'Share',
                  style: TextStyle(
                    fontSize: 20,
                    color: kmainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
