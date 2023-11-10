import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/data/models/category/category_model.dart';
import 'package:market/data/models/universal_data.dart';

class CategoryService {
  Future<UniversalData> addCategory(
      {required CategoryModel categoryModel}) async {
    try {
      String company = StorageRepository.getString('company');
      DocumentReference newCategory = await FirebaseFirestore.instance
          .collection("${company}categories")
          .add(categoryModel.toJson());

      await FirebaseFirestore.instance
          .collection("${company}categories")
          .doc(newCategory.id)
          .update({
        "categoryId": newCategory.id,
      });

      return UniversalData(data: "Category added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateCategory(
      {required CategoryModel categoryModel}) async {
    try {
      String company = StorageRepository.getString('company');
      await FirebaseFirestore.instance
          .collection("${company}categories")
          .doc(categoryModel.categoryId)
          .update(categoryModel.toJson());

      return UniversalData(data: "Category updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteCategory({required String categoryId}) async {
    try {
      String company = StorageRepository.getString('company');
      await FirebaseFirestore.instance
          .collection("${company}categories")
          .doc(categoryId)
          .delete();

      return UniversalData(data: "Category deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getCategories() async {
    try {
      String company = StorageRepository.getString('company');
      final querySnapshot = await FirebaseFirestore.instance
          .collection('${company}categories')
          .get();

      List<CategoryModel> categories = querySnapshot.docs
          .map((doc) => CategoryModel.fromJson(doc.data()))
          .toList();

      return UniversalData(data: categories);
    } on FirebaseException catch (e) {
      return UniversalData(error: e.toString());
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }
}
