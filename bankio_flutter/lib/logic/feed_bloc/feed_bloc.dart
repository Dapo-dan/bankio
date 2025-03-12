import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final Map<int, bool> _followStatus =
      {}; // Default is unfollowed for all posts

  FeedBloc() : super(FeedInitial()) {
    on<FeedEvent>((event, emit) {});

    on<ToggleFollowEvent>((event, emit) {
      _followStatus[event.postId] = !(_followStatus[event.postId] ?? false);
      emit(FeedUpdated(Map.from(_followStatus)));
    });
  }
}
