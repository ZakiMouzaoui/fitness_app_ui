import 'package:fitness_app/repository/upload_image_repository.dart';
import 'package:fitness_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../helpers/utils_functions.dart';
import '../models/image_group_model.dart';

class ProgressController extends GetxController {
  static ProgressController get instance => Get.find();

  final List<ImageGroupModel> imgGroups = [
    ImageGroupModel(DateTime(2024, 01, 4), [
      "https://freedesignfile.com/upload/2018/03/Muscle-Fitness-man-Stock-Photo-01.jpg",
      "https://66.media.tumblr.com/1b8e3b24caee0aba867caca5b444fc1d/tumblr_prg7fg80Sh1y2ky2n_og_540.jpg",
      "https://i.pinimg.com/736x/93/49/4d/93494d9bba160facab0cfb84a69c4f08.jpg",
      "https://i.pinimg.com/originals/26/97/3b/26973b05b844cacd641a6b24b889c47f.jpg"
    ]),
    ImageGroupModel(DateTime(2023, 04, 28), [
      "https://i.pinimg.com/originals/14/92/66/1492665fe20a42a3f4cc8b86f061d13c.jpg",
      "https://i.pinimg.com/originals/a7/29/a5/a729a5d7de8563e6e5dc01e87c2488ce.jpg",
      "https://th.bing.com/th/id/OIP.-HU3enGJnJEwKaWIAAkhUAAAAA?rs=1&pid=ImgDetMain"
    ]),
    //ImageGroupModel(DateTime(2022, 03, 5), []),
  ];

  TextEditingController date1Ctr = TextEditingController();
  TextEditingController date2Ctr = TextEditingController();

  final _picker = ImagePicker();

  DateTime? date1;
  DateTime? date2;

  List<ImageGroupModel> filteredImgGroups = [];

  void pickDate1(BuildContext context) async{
    showDatePicker(
      context: context,
      initialDate: date1 ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now()
    ).then((pickedDate){
      if (pickedDate != null && (date2 == null || pickedDate.isBefore(date2!))) {
        date1Ctr.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        date1 = pickedDate;
      } else {
        showSnackBar(context, "Invalid date range");
      }
    });
  }

  void pickDate2(BuildContext context) async{
    showDatePicker(
        context: context,
        initialDate: date2 ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now()
    ).then((pickedDate){
      if (pickedDate != null && (date1 == null || pickedDate.isAfter(date1!))) {
        date2Ctr.text = DateFormat('yyyy-MM-dd').format(pickedDate);
        date2= pickedDate;
      } else {
        showSnackBar(context, "Invalid date range");
      }
    });
  }

  void compareResults(BuildContext context){
    if(date1 == null || date2 == null){
      showSnackBar(context, "Please select a date first");
    }
    else{
      filteredImgGroups = imgGroups.where((group)=>group.date.isAfter(date1!) && group.date.isBefore(date2!)).toList();
      Get.toNamed(AppRoutes.comparisonResults);
    }
  }

  void pickImageFromCamera() async{
    XFile? file = await _picker.pickImage(source: ImageSource.camera);
  }

  void pickImageFromGallery() async{
    XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if(file != null){
      final url = await UploadImageRepository.uploadImageToCloudinary(file);
      imgGroups.insert(0, ImageGroupModel(DateTime.now(), [url]));
      update();
      Get.back();

    }
  }

  @override
  void dispose() {
    date1Ctr.dispose();
    date2Ctr.dispose();
    super.dispose();
  }
}
