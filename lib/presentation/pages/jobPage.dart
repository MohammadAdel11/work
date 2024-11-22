import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herafi/domain/entites/job.dart';
import 'package:herafi/domain/repositories/jobRepository.dart';

class JobInsertPage extends StatefulWidget {
  final JobRepository jobRepository; // Injected repository for data insertion.

  const JobInsertPage({Key? key, required this.jobRepository}) : super(key: key);

  @override
  State<JobInsertPage> createState() => _JobInsertPageState();
}

class _JobInsertPageState extends State<JobInsertPage> {
  // Controllers for form fields
  final TextEditingController idController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  // Date fields
  DateTime? createdAt;
  DateTime? startDate;
  DateTime? endDate;

  // Validation and submission
  final _formKey = GlobalKey<FormState>();

  Future<void> insertJob() async {
    if (_formKey.currentState!.validate()) {
      final job = JobEntity(
        id: idController.text,
        createdAt: createdAt ?? DateTime.now(),
        category: categoryController.text,
        location: locationController.text,
        description: descriptionController.text,
        startDate: startDate,
        cost: double.tryParse(costController.text),
        endDate: endDate,
        status: statusController.text,
      );

      final result = await widget.jobRepository.insertJob(job);

      result.fold(
            (failure) {
          Get.snackbar(
            "Error",
            failure.message,
            snackPosition: SnackPosition.BOTTOM,
          );
        },
            (_) {
          Get.snackbar(
            "Success",
            "Job inserted successfully",
            snackPosition: SnackPosition.BOTTOM,
          );
          _clearFields();
        },
      );
    }
  }

  void _clearFields() {
    idController.clear();
    categoryController.clear();
    locationController.clear();
    descriptionController.clear();
    costController.clear();
    statusController.clear();
    setState(() {
      createdAt = null;
      startDate = null;
      endDate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert Job"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: idController,
                decoration: const InputDecoration(labelText: "Job ID"),
                validator: (value) =>
                value == null || value.isEmpty ? "Job ID is required" : null,
              ),
              TextFormField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: "Category"),
                validator: (value) =>
                value == null || value.isEmpty ? "Category is required" : null,
              ),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(labelText: "Location"),
                validator: (value) =>
                value == null || value.isEmpty ? "Location is required" : null,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
                validator: (value) =>
                value == null || value.isEmpty ? "Description is required" : null,
              ),
              TextFormField(
                controller: costController,
                decoration: const InputDecoration(labelText: "Cost"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value != null && double.tryParse(value) == null
                    ? "Enter a valid cost"
                    : null,
              ),
              TextFormField(
                controller: statusController,
                decoration: const InputDecoration(labelText: "Status"),
                validator: (value) =>
                value == null || value.isEmpty ? "Status is required" : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Created At: ${createdAt?.toIso8601String() ?? 'Not selected'}",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      setState(() {
                        createdAt = selectedDate;
                      });
                    },
                    child: const Text("Select Created At"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Start Date: ${startDate?.toIso8601String() ?? 'Not selected'}",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      setState(() {
                        startDate = selectedDate;
                      });
                    },
                    child: const Text("Select Start Date"),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "End Date: ${endDate?.toIso8601String() ?? 'Not selected'}",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      setState(() {
                        endDate = selectedDate;
                      });
                    },
                    child: const Text("Select End Date"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: insertJob,
                child: const Text("Insert Job"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
