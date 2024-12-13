import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks/models/popular_model.dart';

import '../../services/search.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

   PopularModel popularModel=PopularModel();

  Future<void> getSearchedpopular({required String query}) async {
    emit(SearchLoading());
    var responce = (await fetchSearchedNames(query:query))!;

    if(responce!=null){
      popularModel=responce;
      emit(SearchSuccess(popularModel));
    }else{
      emit(SearchFauilre('There was an error'));
    }
  }
}
