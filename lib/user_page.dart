import 'package:flutter/material.dart';
import '../model/user_model.dart'; // Pastikan path import sesuai dengan lokasi file
import '../services/user_service.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> listUser = <UserModel>[];

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  // Perbaikan metode async untuk mendapatkan data user
  void getDataUser() async {
    try {
      List<UserModel> listUserTemp = await UserService().fetchUser();
      if (listUserTemp.isNotEmpty) {
        setState(() {
          listUser = listUserTemp;
        });
      }
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: listUser.isNotEmpty
            ? ListView.separated(
          itemCount: listUser.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          itemBuilder: (context, index) => ListTile(
            leading: ClipOval(
              child: Image.network(
                listUser[index].avatar ?? 'https://via.placeholder.com/52',
                width: 52.0,
                height: 52.0,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              '${listUser[index].firstName} ${listUser[index].lastName}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              listUser[index].email ?? '-',
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(
            height: 0.0,
          ),
        )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
