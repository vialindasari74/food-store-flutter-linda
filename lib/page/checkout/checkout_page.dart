import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foodstore/bloc/checkout/checkout_cubit.dart';
import 'package:flutter_foodstore/bloc/location/location_cubit.dart';
import 'package:flutter_foodstore/bloc/shipping_cost/shipping_cost_cubit.dart';
import 'package:flutter_foodstore/core/utils/currency_helper.dart';
import 'package:flutter_foodstore/resource/model/checkout_model.dart';
import 'package:flutter_foodstore/resource/model/location_model.dart';
import 'package:flutter_foodstore/resource/model/shipping_cost_model.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatefulWidget {
  final int totalPrice;
  final int totalWeight;
  const CheckoutPage({
    super.key,
    required this.totalPrice,
    required this.totalWeight,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LocationModel? selectLocation;
  int totalItems = 0;

  final List<String> shippingMethods = [
    'POS',
    'JNE',
    'TIKI',
    'SiCepat',
    'JNT',
    'Ninja',
    'Lion',
    'Anteraja',
    'NCS',
    'Rex',
    'Sentral',
    'Star',
    'Wahana',
  ];
  String? selectedShipping;
  int? selectShippingCost = 0;
  ShippingCostModel? shippingCostModel;

  bool isFormValid = false;

  @override
  void initState() {
    totalItems = widget.totalPrice;
    addressController.addListener(_validateForm);
    locationController.addListener(_validateForm);
    super.initState();
  }

  @override
  void dispose() {
    addressController.removeListener(_validateForm);
    locationController.removeListener(_validateForm);
    addressController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final valid = addressController.text.isNotEmpty &&
        locationController.text.isNotEmpty &&
        selectedShipping != null &&
        selectedShipping!.isNotEmpty &&
        selectShippingCost != null &&
        selectShippingCost! > 0 &&
        selectLocation != null;
    if (isFormValid != valid) {
      setState(() => isFormValid = valid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: _appBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    title: 'Shipping Information',
                    icon: Icons.location_on_outlined,
                    child: Column(
                      spacing: 16.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLocation(),
                        _buildAddressField(),
                      ],
                    ),
                  ),
                  _buildSection(
                    title: 'Select Shipping Method',
                    icon: Icons.local_shipping_outlined,
                    child: Column(
                      spacing: 16.0,
                      children: [
                        _buildShippingMethodDropdown(),
                        _buildShippingCost(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          color: Colors.white,
          child: Column(
            spacing: 8.0,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPriceRow(
                title: 'Total Items:',
                fontSize: 16.0,
                price: widget.totalPrice,
              ),
              _buildPriceRow(
                title: 'Shipping Cost:',
                fontSize: 16.0,
                price: selectShippingCost ?? 0,
              ),
              Divider(
                thickness: 2,
                color: Colors.grey[300],
              ),
              _buildPriceRow(
                title: 'Grand Total:',
                fontSize: 18.0,
                price: totalItems + (selectShippingCost ?? 0),
                isBold: true,
              ),
              _buildButtonPay(context),
            ],
          ),
        ),
      );
    });
  }

  // appBar
  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
      ),
      title: const Text(
        'Checkout',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
          ]),
          const SizedBox(height: 12),
          child
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return Column(
      spacing: 12.0,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                controller: locationController,
                decoration: const InputDecoration(
                  labelText: 'Search Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Search Location cannot be empty'
                    : null,
              ),
            ),
            IconButton.filled(
              onPressed: () {
                if (locationController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please Select Location'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                context
                    .read<LocationCubit>()
                    .getLocation(locationController.text);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
        BlocBuilder<LocationCubit, LocationState>(builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (locations) => locations.isEmpty
                ? const Center(child: Text('Location not found'))
                : _buildLocationList(locations),
            error: (message) => Center(child: Text(message)),
            orElse: () => const SizedBox(),
          );
        }),
      ],
    );
  }

  Widget _buildLocationList(List<LocationModel> locations) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return ListTile(
            title: Text(location.label.toString()),
            onTap: () {
              setState(() {
                locationController.text = location.label.toString();
                selectLocation = location;
              });
              context.read<LocationCubit>().clearLocation();
              _validateForm();
            },
          );
        },
      ),
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      controller: addressController,
      decoration: const InputDecoration(
        labelText: 'Address',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Please enter your address' : null,
      maxLines: 3,
    );
  }

  Widget _buildShippingMethodDropdown() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      value: selectedShipping,
      items: shippingMethods
          .map((method) => DropdownMenuItem(value: method, child: Text(method)))
          .toList(),
      hint: const Text('Select Shipping Method'),
      validator: (value) => (value == null || value.isEmpty)
          ? 'Please Select Shipping Method'
          : null,
      onChanged: (value) {
        selectShippingCost = null;
        if (selectLocation == null) {
          _messageEror('Please Select Location');
          return;
        }
        context.read<ShippingCostCubit>().getShippingCost(
              selectLocation?.id ?? 0,
              widget.totalWeight,
              value?.toLowerCase() ?? '',
            );
        setState(() => selectedShipping = value);
        _validateForm();
      },
    );
  }

  Widget _buildShippingCost() {
    return BlocBuilder<ShippingCostCubit, ShippingCostState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (shippingCost) {
            if (shippingCost.isEmpty) {
              return const Center(child: Text("Tidak ada data tersedia"));
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: shippingCost.length,
              itemBuilder: (context, index) {
                final option = shippingCost[index];
                return RadioListTile<ShippingCostModel>(
                  title: Text(
                      "${option.description} - ${CurrencyHelper.formatRupiah(option.cost?.toDouble() ?? 0)}"),
                  subtitle: Text("Estimasi: ${option.etd} hari"),
                  value: option,
                  groupValue: shippingCostModel,
                  onChanged: (value) {
                    setState(() {
                      selectShippingCost = value?.cost ?? 0;
                      shippingCostModel = option;
                    });
                    _validateForm();
                  },
                );
              },
            );
          },
          error: (message) => Center(child: Text(message)),
          orElse: () => const SizedBox(),
        );
      },
    );
  }

  Widget _buildPriceRow({
    required String title,
    required int price,
    required double fontSize,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          CurrencyHelper.formatRupiah(price.toDouble()),
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonPay(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (snapToken) async {
            final result = await context.push('/midtransPayment/$snapToken');
            if (result == 'success') {
              _navigateToDetailOrder(snapToken);
            } else {
              _navigateToDetailOrder(snapToken);
            }
          },
          error: (message) {
            _messageEror(message);
          },
          orElse: () {},
        );
      },
      child: FilledButton(
        onPressed: isFormValid
            ? () {
                if (_formKey.currentState!.validate()) {
                  final checkout = CheckoutModel(
                    provinceName: selectLocation?.provinceName ?? "",
                    cityName: selectLocation?.cityName ?? "",
                    districtName: selectLocation?.districtName ?? "",
                    subdistrictName: selectLocation?.subdistrictName ?? "",
                    zipCode: selectLocation?.zipCode ?? "",
                    fullAddress: addressController.text,
                    weight: widget.totalWeight,
                    shippingCourier: selectedShipping?.toLowerCase() ?? "",
                    shippingService:
                        shippingCostModel?.service?.toLowerCase() ?? "",
                    shippingCost: selectShippingCost ?? 0,
                    total: widget.totalPrice + (selectShippingCost ?? 0),
                  );
                  context.read<CheckoutCubit>().checkout(checkout);
                }
              }
            : null,
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: const Center(
          child: Text('Confirm and Pay',
              style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
    );
  }

  void _navigateToDetailOrder(String snapToken) {
    context.go('/orderDetail/$snapToken');
  }

  void _messageEror(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red));
  }
}
