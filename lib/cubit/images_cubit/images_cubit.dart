import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks/models/images_model.dart';
import 'package:tasks/services/images_request.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImagesInitial());

  ImagesModel imagesModel=ImagesModel();

  Future<void>images({required num id}) async {

    emit(ImagesLoading());
    var responce=await getimages(id:id);
    if(responce!=null){
     imagesModel=responce;
     emit(ImagesSuccess(imagesModel: imagesModel));
     print('success');
      }
    else{
      emit(ImagesFailure());
    }
  }
}
