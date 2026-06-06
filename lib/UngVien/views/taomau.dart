import 'package:do_an_mobile/UngVien/views/taocv.dart';
import 'package:flutter/material.dart';

class TaoMau extends StatefulWidget {
  final String type;

  const TaoMau({super.key, this.type = "simple"});

  @override
  State<TaoMau> createState() => _TaoMauState();
}

class _TaoMauState extends State<TaoMau> {

  // 🔥 STATE (chỉ dùng cho SIMPLE)
  List<int> experiences = [1];
  List<int> activities = [1];
  List<int> certificates = [1];
  List<int> skills = [1];   
  List<int> hobbies = [1]; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: "Tên CV",
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
      ),

      body: widget.type == "pro"
          ? buildProfessionalCV()
          : buildSimpleCV(),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TaoCV()),
              );
            },
            child: const Text("Tạo CV", style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }

  // ================= SIMPLE =================
  Widget buildSimpleCV() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        color: Colors.white,
        child: IntrinsicHeight(
        child: Row(
          children: [
            // LEFT (GIỮ NGUYÊN)
            Container(
              width: 150,
              height: double.infinity,
              color: const Color(0xFF5D4037),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const CircleAvatar(radius: 40, backgroundColor: Colors.grey),
                  const SizedBox(height: 20),

                  TextField(
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      hintText: "Họ tên",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),

                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Vị trí ứng tuyển",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Divider(color: Colors.white),

                  infoInput(Icons.phone, "Số điện thoại"),
                  infoInput(Icons.calendar_today, "Ngày sinh"),
                  infoInput(Icons.email, "Email"),
                  infoInput(Icons.person, "Profile Facebook"),
                  infoInput(Icons.location_on, "Địa chỉ"),

                  const SizedBox(height: 10),

                  // ================= HỌC VẤN =================
                  sectionTitle("Học vấn"),

                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Ngành học / Môn học",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  ),

                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Bắt đầu - Kết thúc",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  ),

                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Tên trường học",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  ),

                  TextField(
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: "Mô tả quá trình học",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ================= KỸ NĂNG =================
                  sectionTitle("Kỹ năng"),

                  ...skills.map((e) => TextField(
                    decoration: const InputDecoration(
                      hintText: "Tên kỹ năng",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  )),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        skills.add(1);
                      });
                    },
                    child: const Text(
                      "+ Thêm",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ================= SỞ THÍCH =================
                  sectionTitle("Sở thích"),

                  ...hobbies.map((e) => TextField(
                    decoration: const InputDecoration(
                      hintText: "Tên sở thích",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  )),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        hobbies.add(1);
                      });
                    },
                    child: const Text(
                      "+ Thêm",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ================= NGƯỜI GIỚI THIỆU =================
                  sectionTitle("Người giới thiệu"),

                  TextField(
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: "Tên, chức vụ, liên hệ",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),

            // 🔥 RIGHT (ĐÃ SỬA)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildCareerGoal(),
                    buildExperienceSection(),
                    buildAwardSection(),
                    buildCertificateSection(),
                    buildActivitySection(),
                  ],
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }

  // ================= PRO (GIỮ NGUYÊN) =================
  Widget buildProfessionalCV() {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: 160,
              color: const Color.fromARGB(255, 218, 129, 206),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(radius: 40, backgroundColor: Colors.grey),
                  const SizedBox(height: 10),

                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Họ tên",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),

                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Vị trí",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),

                  const Divider(),

                  infoInput(Icons.cake, "Ngày sinh"),
                  infoInput(Icons.phone, "SĐT"),
                  infoInput(Icons.email, "Email"),
                  infoInput(Icons.location_on, "Địa chỉ"),

                  const SizedBox(height: 10),

                  sectionTitle("Học vấn"),
                  TextField(
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: "Nhập học vấn",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),

                  sectionTitle("Kỹ năng"),
                  TextField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: "Nhập kỹ năng",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    rightSection("Mục tiêu nghề nghiệp"),
                    rightSection("Kinh nghiệm làm việc"),
                    rightSection("Danh hiệu và giải thưởng"),
                    rightSection("Chứng chỉ"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= COMPONENT =================

  Widget brownTitle(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF5D4037),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildCareerGoal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        brownTitle("Mục tiêu nghề nghiệp"),
        TextField(maxLines: 3),
        const Divider(),
      ],
    );
  }

  Widget buildExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        brownTitle("Kinh nghiệm làm việc"),
        ...experiences.map((e) => experienceItem()),
        TextButton(
          onPressed: () {
            setState(() {
              experiences.add(1);
            });
          },
          child: const Text("+ Thêm"),
        ),
        const Divider(),
      ],
    );
  }

  Widget experienceItem() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: TextField(decoration: const InputDecoration(hintText: "Vị trí"))),
            const SizedBox(width: 10),
            SizedBox(width: 70, child: TextField(decoration: const InputDecoration(hintText: "Từ"))),
            const SizedBox(width: 5),
            SizedBox(width: 70, child: TextField(decoration: const InputDecoration(hintText: "Đến"))),
          ],
        ),
        TextField(decoration: const InputDecoration(hintText: "Tên công ty")),
        TextField(maxLines: 2, decoration: const InputDecoration(hintText: "Mô tả")),
      ],
    );
  }

  Widget buildAwardSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        brownTitle("Danh hiệu"),
        Row(
          children: [
            Expanded(child: TextField(decoration: const InputDecoration(hintText: "Thời gian"))),
            const SizedBox(width: 10),
            Expanded(child: TextField(decoration: const InputDecoration(hintText: "Tên"))),
          ],
        ),
        TextButton(
          onPressed: () {
            setState(() {
              certificates.add(1);
            });
          },
          child: const Text("+ Thêm"),
        ),
        const Divider(),
      ],
    );
  }

  Widget buildCertificateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        brownTitle("Chứng chỉ"),
        ...certificates.map((e) => Row(
              children: [
                Expanded(child: TextField(decoration: const InputDecoration(hintText: "Thời gian"))),
                const SizedBox(width: 10),
                Expanded(child: TextField(decoration: const InputDecoration(hintText: "Tên"))),
              ],
            )),
        TextButton(
          onPressed: () {
            setState(() {
              certificates.add(1);
            });
          },
          child: const Text("+ Thêm"),
        ),
        const Divider(),
      ],
    );
  }

  Widget buildActivitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        brownTitle("Hoạt động"),
        ...activities.map((e) => Column(
              children: [
                Row(
                  children: [
                    Expanded(child: TextField(decoration: const InputDecoration(hintText: "Vị trí"))),
                    const SizedBox(width: 10),
                    SizedBox(width: 70, child: TextField(decoration: const InputDecoration(hintText: "Từ"))),
                    const SizedBox(width: 5),
                    SizedBox(width: 70, child: TextField(decoration: const InputDecoration(hintText: "Đến"))),
                  ],
                ),
                TextField(decoration: const InputDecoration(hintText: "Tổ chức")),
                TextField(decoration: const InputDecoration(hintText: "Mô tả")),
              ],
            )),
        TextButton(
          onPressed: () {
            setState(() {
              activities.add(1);
            });
          },
          child: const Text("+ Thêm"),
        ),
        const Divider(),
      ],
    );
  }

  Widget infoInput(IconData icon, String hint) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 16),
        const SizedBox(width: 5),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget rightSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const Divider(),
          TextField(),
        ],
      ),
    );
  }
}