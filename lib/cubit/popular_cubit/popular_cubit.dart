import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/popular_model.dart';
import '../../services/popular_request.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());

  PopularModel popularModel=PopularModel();

  Future<void>Persondata()async{
    emit(PopularLoading());
    var responce=(await getdata())!;
    if(responce!=null){
      popularModel=responce;
      emit(PopularSuccess(popularModel: popularModel));
    }else{
      emit(PopularFailure(errormessage: 'There was an error loading data'));
    }
  }
}
