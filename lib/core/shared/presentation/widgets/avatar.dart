import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, this.profilePath, this.dimension = 60.0});

  final String? profilePath;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    const defaultAvatar =
        'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=1480&t=st=1682361132~exp=1682361732~hmac=95db1da726ff0575cdf78f90627f491d323e5f97fca3d62446afc211c86c4f52';
    return SizedBox.square(
      dimension: dimension,
      child: Image.network(
        profilePath != null
            ? 'https://image.tmdb.org/t/p/w500/$profilePath'
            : defaultAvatar,
        fit: BoxFit.cover,
      ),
    );
  }
}
