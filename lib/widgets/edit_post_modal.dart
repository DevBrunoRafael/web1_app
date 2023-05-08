import 'package:flutter/material.dart';
import 'package:web1_app/constants/colors.dart';

import '../models/post.dart';

class EditPostModal extends StatefulWidget {

  Post post;
  Function funcUpdate;
  Function funcRefresh;

  EditPostModal({ 

    Key? key,
    required this.post,
    required this.funcUpdate,
    required this.funcRefresh

  }) : super(key: key);

  @override
  _EditPostModalState createState() => _EditPostModalState();
}

class _EditPostModalState extends State<EditPostModal> {

  late TextEditingController _titleController;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(
      text: widget.post.title
    );
    _textController = TextEditingController(
      text: widget.post.text
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: cardLogin,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              'Editar post',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),
            TextField(
              controller: _titleController,
              cursorColor: textInput,
              style: const TextStyle(color: textInput),
              decoration: InputDecoration(
                filled: true,
                fillColor: backInput,
                hintText: "Informe o tìtulo",
                hintStyle: const TextStyle(color: placeholderInput),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),

              ),
            ),
            
            const SizedBox(height: 20),
            TextField(
              controller: _textController,
              cursorColor: textInput,
              style: const TextStyle(color: textInput),
              decoration: InputDecoration(
                filled: true,
                fillColor: backInput,
                hintText: "Informe o texto",
                hintStyle: const TextStyle(color: placeholderInput),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5),
                ),

              ),
              maxLines: 5,
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white
                  ),
                  child: const Text('Cancelar'),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backButton, 
                    shadowColor: Colors.black, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () async {

                    await widget.funcUpdate(
                      widget.post.id,
                      _titleController.text,
                      _textController.text,
                    );

                    widget.funcRefresh();

                    if(!mounted) return;
                    Navigator.pop(context);

                  },
                  child: const Text('Salvar'),
                ),

              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
