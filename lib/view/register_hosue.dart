import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HouseListingPage extends StatefulWidget {
  @override
  _HouseListingPageState createState() => _HouseListingPageState();
}

class _HouseListingPageState extends State<HouseListingPage> {
  File? _image;
  final _picker = ImagePicker();

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  int _bedrooms = 1;
  int _bathrooms = 1;
  double _area = 100.0;
  bool _hasGarage = false;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Your House'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload House Picture',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.purple, width: 2),
                  ),
                  child: _image == null
                      ? Center(child: Text('Tap to upload an image'))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'House Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: _addressController,
                labelText: 'Address',
                icon: Icons.location_on,
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: _descriptionController,
                labelText: 'Description',
                icon: Icons.description,
                maxLines: 5,
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: _priceController,
                labelText: 'Price (in USD)',
                icon: Icons.attach_money,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              _buildDropdown(
                labelText: 'Number of Bedrooms',
                icon: Icons.bed,
                value: _bedrooms,
                items: List.generate(10, (index) => index + 1),
                onChanged: (value) {
                  setState(() {
                    _bedrooms = value!;
                  });
                },
              ),
              SizedBox(height: 15),
              _buildDropdown(
                labelText: 'Number of Bathrooms',
                icon: Icons.bathtub,
                value: _bathrooms,
                items: List.generate(10, (index) => index + 1),
                onChanged: (value) {
                  setState(() {
                    _bathrooms = value!;
                  });
                },
              ),
              SizedBox(height: 15),
              Text(
                'Area (in sq. ft.)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Slider(
                value: _area,
                min: 100,
                max: 10000,
                divisions: 100,
                label: '${_area.toStringAsFixed(0)} sq. ft.',
                onChanged: (value) {
                  setState(() {
                    _area = value;
                  });
                },
                activeColor: Colors.purple,
                inactiveColor: Colors.purple[100],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Checkbox(
                    value: _hasGarage,
                    onChanged: (value) {
                      setState(() {
                        _hasGarage = value!;
                      });
                    },
                    activeColor: Colors.purple,
                  ),
                  Text(
                    'Has Garage',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submission logic here
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.purple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String labelText,
    required IconData icon,
    required int value,
    required List<int> items,
    required ValueChanged<int?> onChanged,
  }) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.purple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: DropdownButton<int>(
        value: value,
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down, color: Colors.purple),
        underline: SizedBox(),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
      ),
    );
  }
}
