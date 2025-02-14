part of 'feed_bloc.dart';

sealed class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class ToggleFollowEvent extends FeedEvent {
  final int postId; // To track which post is toggled
  const ToggleFollowEvent(this.postId);
}
