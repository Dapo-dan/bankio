import 'package:bankio/logic/feed_bloc/feed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Feeds', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          ],
        ),
        body: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            final followStatus = state is FeedUpdated ? state.followStatus : {};

            // Sample posts data
            final posts = [
              {'id': 1, 'title': 'Binance Expands Account Statement Function'},
              {'id': 2, 'title': 'Binance Marketplace: Super App for Crypto'},
            ];

            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                final isFollowing = followStatus[post['id']] ?? false;

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.aljazeera.com%2Feconomy%2F2025%2F2%2F11%2Fin-change-in-crypto-enforcement-sec-and-binance-seek-pause-in-lawsuit&psig=AOvVaw15054QT98zRj4Jqq2eV9kp&ust=1739637668201000&source=images&cd=vfe&opi=89978449&ved=0CBYQjRxqFwoTCOCshrzNw4sDFQAAAAAdAAAAABAE'),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Zepennlin',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<FeedBloc>().add(
                                      ToggleFollowEvent(post['id'] as int),
                                    );
                              },
                              style: ElevatedButton.styleFrom(
                                  // primary: isFollowing ? Colors.green : Colors.blue,
                                  ),
                              child: Text(
                                isFollowing ? 'Following' : 'Follow',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${post['title']!}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.favorite_border),
                                SizedBox(width: 10),
                                Icon(Icons.comment),
                                SizedBox(width: 10),
                                Icon(Icons.share),
                              ],
                            ),
                            Icon(Icons.more_vert),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
