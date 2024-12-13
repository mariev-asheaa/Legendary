import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks/models/detailes_model.dart';
import 'package:tasks/services/detailes_request.dart';

part 'detailes_state.dart';

class DetailesCubit extends Cubit<DetailesState> {
  DetailesCubit() : super(DetailesInitial());

  DetailesModel detailesModel=DetailesModel();

  Future<void>detailes({required num id})async{

    emit(DetailesLoading());
    var responce=await getdetailes(id: id);
    if(responce!=null){
      detailesModel=responce;
      emit(DetailesSucces(detailesModel: detailesModel));
    }
    else{
      emit(DetailesFailure());
    }
  }
}
