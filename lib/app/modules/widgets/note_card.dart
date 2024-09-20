import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../data/repository/repo.dart';
import '../../routes/app_pages.dart';

class NoteCard extends StatelessWidget {
  final int index;
  void Function()? onTap;
  NoteCard({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              label: 'Delete',
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              onPressed: (context) {
                bankNotes.removeAt(index);
              },
              backgroundColor: Get.theme.colorScheme.errorContainer,
              foregroundColor: Get.theme.colorScheme.onErrorContainer,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Get.theme.colorScheme.secondaryContainer.withOpacity(0.5),
          ),
          child: ListTile(
            title: Text(bankNotes[index].title,
                style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                )),
            subtitle: Text(
              bankNotes[index].description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Get.textTheme.bodySmall,
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
