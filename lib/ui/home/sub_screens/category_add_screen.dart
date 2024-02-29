import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market/bloc/category/category_bloc.dart';
import 'package:market/data/models/category/category_model_fields.dart';
import 'package:market/data/models/status.dart';
import 'package:market/ui/home/home_screen.dart';
import 'package:market/ui/home/sub_screens/admin_drawer.dart';
import 'package:market/ui/widgets/global_button.dart';
import 'package:market/ui/widgets/global_textfield.dart';
import 'package:market/ui/widgets/image_container.dart';
import 'package:market/utils/extensions/extensions.dart';

class CategoryAddScreen extends StatefulWidget {
  const CategoryAddScreen({super.key});

  @override
  State<CategoryAddScreen> createState() => _CategoryAddScreenState();
}

class _CategoryAddScreenState extends State<CategoryAddScreen> {
  String path = "";
  ImagePicker picker = ImagePicker();
  XFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AdminDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Text(
          'Kategoriya qo\'shish',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF223263),
          ),
        ),
        elevation: 1,
      ),
      body: BlocConsumer<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    16.ph,
                    Text(
                      "Kategoriya nomi",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF223263),
                      ),
                    ),
                    12.ph,
                    GlobalTextField(
                      hintText: 'Kategoriya nomi',
                      onChanged: (v) {
                        context.read<CategoryBloc>().add(
                              UpdateCurrentCategory(
                                value: v,
                                fieldKeys: CategoryFieldKeys.categoryName,
                              ),
                            );
                      },
                    ),
                    24.ph,
                    Text(
                      "Kategoriya haqida",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF223263),
                      ),
                    ),
                    12.ph,
                    GlobalTextField(
                      hintText: 'Kategoriya haqida',
                      onChanged: (v) => context.read<CategoryBloc>().add(
                            UpdateCurrentCategory(
                              value: v,
                              fieldKeys: CategoryFieldKeys.description,
                            ),
                          ),
                    ),
                    24.ph,
                    Text(
                      "Kategoriya rasmi",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF223263),
                      ),
                    ),
                    12.ph,
                    ImageContainer(
                      path: path,
                      onTap: () {
                        showBottomSheetDialog();
                      },
                    ),
                    24.ph,
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GlobalButton(
                  text: 'Qo\'shish',
                  onTap: () {
                    if (path.isNotEmpty) {
                      context.read<CategoryBloc>().add(
                            UploadImage(xFile: file!),
                          );
                      context.read<CategoryBloc>().add(
                            UpdateCurrentCategory(
                              value: state.imageURL,
                              fieldKeys: CategoryFieldKeys.imageUrl,
                            ),
                          );
                      if (state.canAdd().isEmpty) {
                        context.read<CategoryBloc>().add(AddCategory());
                      }
                    } else {
                      Fluttertoast.showToast(msg: state.canAdd());
                    }
                  },
                ),
              ),
              16.ph,
            ],
          );
        },
        listener: (context, state) {
          debugPrint('listener');
          if (state.status == FormStatus.loading) {
            const Center(child: CircularProgressIndicator());
          }
          if (state.status == FormStatus.success) {
            if (context.mounted) {
              Fluttertoast.showToast(msg: 'Kategoriya qo\'shildi');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }
          }
        },
      ),
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo_outlined),
                title: const Text("Galareyadan tanlash"),
              ),
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text("Cameradan tanlash"),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      maxHeight: 512,
      maxWidth: 512,
      source: ImageSource.gallery,
    );
    if (xFile != null && context.mounted) {
      path = xFile.path;
      file = xFile;
      setState(() {});
    }
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      maxHeight: 512,
      maxWidth: 512,
      source: ImageSource.camera,
    );
    if (xFile != null && context.mounted) {
      path = xFile.path;
      file = xFile;
      setState(() {});
    }
  }
}
