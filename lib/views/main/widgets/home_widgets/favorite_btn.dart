import 'package:flutter/material.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_icon_button.dart';

class FavoriteBtn extends StatelessWidget {
  const FavoriteBtn({
    super.key,
    required this.isFavorite,
    required this.onFavoriteChange,
  });
  final bool isFavorite;
  final void Function(bool value) onFavoriteChange;

  @override
  Widget build(BuildContext context) {
    var fav = isFavorite;
    return StatefulBuilder(
      builder: (_, setState) {
        return CustomIconButton(
          onPressed: () {
            setState(() {
              fav = !fav;
            });
            onFavoriteChange(fav);
          },
          tooltip: '',
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: fav ? const Color(0xFFFF6079) : Colors.grey,
            // alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
          ),
          iconData: fav ? Icons.favorite : Icons.favorite_border_outlined,
          iconSize: 20,
          allowOnlineOnly: false,
          allowRegisterOnly: false,
        );
      },
    );
  }
}
