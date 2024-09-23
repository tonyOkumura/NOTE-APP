import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:note_app/app/data/note_service.dart';
import 'package:note_app/app/modules/home/controllers/home_controller.dart';

class NoteCard extends StatelessWidget {
  final int index;
  final void Function()? onTap;
  const NoteCard({
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
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              onPressed: (context) {
                Get.find<HomeController>().bankNotes.removeAt(index);
                Get.find<NoteService>().deleteNote(index);
              },
              backgroundColor: Get.theme.colorScheme.errorContainer,
              foregroundColor: Get.theme.colorScheme.onErrorContainer,
              icon: Icons.delete,
            ),
          ],
        ),
        child: _buildNoteCard(),
      ),
    );
  }

  Container _buildNoteCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Get.theme.colorScheme.secondaryContainer.withOpacity(0.5),
      ),
      child: ListTile(
        title: Text(Get.find<HomeController>().bankNotes[index].title,
            style: TextStyle(
              color: Get.theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            )),
        subtitle: Text(
          Get.find<HomeController>().bankNotes[index].description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Get.textTheme.bodySmall,
        ),
        onTap: onTap,
      ),
    );
  }
}
