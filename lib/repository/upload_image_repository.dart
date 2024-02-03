import 'dart:convert';

import 'package:fitness_app/helpers/show_dialogs.dart';
import 'package:fitness_app/services/api_service.dart';
import "package:http/http.dart" as http;
import 'package:image_picker/image_picker.dart';

class UploadImageRepository{
  static Future<String> uploadImageToCloudinary(XFile file) async{
    final url = Uri.parse(cloudinaryUrl);
    final headers = {'Authorization': 'Basic ${base64Encode('$apiKey:$apiSecret'.codeUnits)}'};
    final request = http.MultipartRequest('POST', url);
    request.fields["upload_preset"] = "rlgd3bbe";
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final jsonData = json.decode(responseBody);

      // Extract the public URL of the uploaded file from the Cloudinary response
      final publicUrl = jsonData['secure_url'];
      return publicUrl;
    } catch (e) {
      showToast("There was an error uploading the image");
      return ''; // Handle error as needed
    }
  }
}