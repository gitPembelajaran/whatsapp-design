import 'package:flutter/material.dart';

// 1. Model Data Sederhana (Pengenalan OOP Dasar)
class Message {
  final String text;
  final bool isMe; // Untuk membedakan pengirim (kanan) dan teman (kiri)

  Message({required this.text, required this.isMe});
}

class DetailChat extends StatefulWidget {
  const DetailChat({super.key});

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  // 2. Controller untuk mengelola input teks
  final TextEditingController _chatController = TextEditingController();

  // 3. State untuk menyimpan daftar pesan
  final List<Message> _messages = [
    Message(text: "Hi!", isMe: false),
    Message(text: "Hi juga! Bagaimana belajar flutter?", isMe: true),
    Message(text: "Mudah, cuman widget2 aja nih", isMe: false),
  ];


  // 4. Fungsi untuk mengirim pesan menggunakan setState
  void _sendMessage() {
    // Mencegah input kosong masuk ke dalam daftar
    if (_chatController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(Message(text: _chatController.text, isMe: true));
    });

    _chatController.clear(); // Mengosongkan TextField setelah dikirim
  }

  @override
  void dispose() {
    // Praktik baik: membersihkan controller dari memori
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(child: Icon(Icons.person)),
            ),
            Text("TemanQ"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => debugPrint("Video call!"),
            icon: const Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () => debugPrint("Telepon!"),
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () => debugPrint("Membuka Menu Lain"),
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            // 5. Menggunakan ListView.builder untuk merender list secara dinamis
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Align(
                  alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: msg.isMe ? Colors.green[100] : Colors.green[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(msg.text),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _chatController,
                    decoration: const InputDecoration(
                      hintText: 'Tulis pesan...',
                      border: OutlineInputBorder(),
                    ),
                    // Menambahkan fungsi kirim lewat tombol enter di keyboard (opsional)
                    onSubmitted: (value) => _sendMessage(),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}