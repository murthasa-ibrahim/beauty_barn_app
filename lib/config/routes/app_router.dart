// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:machine_test_superlabs/config/routes/routes.dart';


// class NavigationService {
//   final GlobalKey<NavigatorState> _shellNavigatorKey =
//       GlobalKey<NavigatorState>(debugLabel: 'shell');
//   final GlobalKey<NavigatorState> navigatorKey =
//       GlobalKey<NavigatorState>(debugLabel: 'root');

//   late final GoRouter router;

//   NavigationService() {
//     router = GoRouter(
//       navigatorKey: navigatorKey,
//       initialLocation: Routes.splash,
//       routes: [
//         ShellRoute(
//           navigatorKey: _shellNavigatorKey,
//           builder: (context, state, child) {
//             return NavBarScreen(child: child);
//           },
//           routes: [
//             GoRoute(
//               path: Routes.home,
//               name: RouteNames.home,
//               builder: (context, state) => const HomeScreen(),
//             ),
//             GoRoute(
//               path: Routes.hub,
//               name: RouteNames.hub,
//               builder: (context, state) => const HubScreen(),
//             ),
//             GoRoute(
//               path: Routes.market,
//               name: RouteNames.market,
//               builder: (context, state) => const MarketPlaceScreen(),
//             ),
//             GoRoute(
//               path: Routes.dealerCollab,
//               name: RouteNames.dealerCollab,
//               builder: (context, state) => const DealersCollabScreen(),
//             ),
//             GoRoute(
//               path: Routes.more,
//               name: RouteNames.more,
//               builder: (context, state) => const MoreScreen(),
//             ),
//           ],
//         ),

//         // Moved outside ShellRoute with root navigator
//         GoRoute(
//           path: '/hub-form',
//           name: 'hub_form',
//           parentNavigatorKey: navigatorKey,
//           builder: (context, state) {
//             final extra = state.extra as Map<String, dynamic>?; // safely cast
//             final name = extra?['name'] as String? ?? '';
//             return HubScreen(isForm: true, formName: name);
//           },
//         ),

//         GoRoute(
//           path: Routes.splash,
//           name: RouteNames.splash,
//           builder: (context, state) => const SplashSceen(),
//         ),

//         GoRoute(
//           path: Routes.profileSettings,
//           name: RouteNames.profileSettings,
//           builder: (context, state) {
//             final userDetails = state.extra as UserDetails;
//             return ProfileSettingsScreen(userDetails: userDetails);
//           },
//         ),

//         GoRoute(
//           path: Routes.salesDetails,
//           name: RouteNames.salesDetails,
//           builder: (context, state) => const SalesDetailsScreen(),
//         ),

//         GoRoute(
//           path: Routes.login,
//           name: RouteNames.login,
//           builder: (context, state) => const LoginScreen(),
//         ),

//         GoRoute(
//           path: '${Routes.otpScreen}/:mobile',
//           name: RouteNames.otpScreen,
//           builder: (context, state) {
//             return OTPScreen(mobile: state.pathParameters['mobile']!);
//           },
//         ),

//         GoRoute(
//           path: Routes.vehicleDetails,
//           name: RouteNames.vehicleDetails,
//           builder: (context, state) {
//             final index = state.extra as int;
//             return VehicleDetailsScreen(index: index);
//           },
//         ),

//         GoRoute(
//           path: Routes.sales,
//           name: RouteNames.sales,
//           builder: (context, state) => const SalesListScreen(),
//         ),

//         GoRoute(
//           path: Routes.repairManagement,
//           name: RouteNames.repairManagement,
//           builder: (context, state) => const RepairMgtScreen(),
//         ),

//         GoRoute(
//           path: Routes.addToRepair,
//           name: RouteNames.addToRepair,
//           builder: (context, state) => const AddToRepairScreen(),
//         ),

//         GoRoute(
//           path: Routes.repairList,
//           name: RouteNames.repairList,
//           builder: (context, state) {
//             VehiclePathParams params = state.extra as VehiclePathParams;
//             VehicleList? vehicle = params.vehicleList;
//             bool isCompleted = params.isCompleted;
//             bool fromSale = params.fromSale ?? false;
//             return RepairListScreen(
//               vehicle: vehicle,
//               isCompleted: isCompleted,
//               fromSale: fromSale,
//             );
//           },
//         ),

//         GoRoute(
//           path: Routes.addVehicle,
//           name: RouteNames.addVehicle,
//           builder: (context, state) => const AddNewVehicle(),
//         ),

//         GoRoute(
//           path: Routes.forms,
//           name: RouteNames.forms,
//           builder: (context, state) => const FormListScreen(),
//         ),

//         GoRoute(
//           path: Routes.salesVehicleList,
//           name: RouteNames.salesVehicleList,
//           builder: (context, state) {
//             // Check for extra parameters passed in the route
//             final args = state.extra as Map<String, dynamic>? ?? {};
//             return VehicleListScreen(
//               showGenerateReport: args['showGenerateReport'] ?? false,
//               onGenerateReport: args['onGenerateReport'],
//             );
//           },
//         ),

//         GoRoute(
//           path: Routes.vehicleFormView,
//           name: RouteNames.vehicleFormView,
//           builder: (context, state) {
//             final type = state.extra as FormType;
//             return VehicleFormScreen(type: type);
//           },
//         ),

//         GoRoute(
//           path: Routes.editVehicle,
//           name: RouteNames.editVehicle,
//           builder: (context, state) {
//             final type = state.extra as VehicleDetails;
//             return EditVehicle(vehicle: type);
//           },
//         ),

//         GoRoute(
//           path: Routes.buyerDetails,
//           name: RouteNames.buyerDetails,
//           builder: (context, state) {
//             final type = state.extra as CustomerDetails?;
//             return BuyerDetailsScreen(customer: type);
//           },
//         ),
//         GoRoute(
//           path: Routes.newEnquiry,
//           name: RouteNames.newEnquiry,
//           builder: (context, state) {
//             return const NewEnquiryScreen();
//           },
//         ),
//         GoRoute(
//           path: Routes.newExpense,
//           name: RouteNames.newExpense,
//           builder: (context, state) {
//             if (state.extra is Map<String, dynamic>) {
//               final extra = state.extra as Map<String, dynamic>;
//               if (extra.containsKey('expenseToEdit')) {
//                 return AddNewExpenseScreen(
//                   isVehicleExpense: extra['isVehicleExpense'] ?? false,
//                   expense: extra['expenseToEdit'] as Expense,
//                   initialBranchId: extra['branchId'],
//                   initialVehicleList: extra['vehicleList'],
//                 );
//               } else {
//                 return AddNewExpenseScreen(
//                   isVehicleExpense: extra['isVehicleExpense'] ?? false,
//                   initialBranchId: extra['branchId'],
//                   initialVehicleList: extra['vehicleList'],
//                 );
//               }
//             }
//             return const AddNewExpenseScreen(isVehicleExpense: false);
//           },
//         ),

//         GoRoute(
//           path: Routes.enquiry,
//           name: RouteNames.enquiry,
//           builder: (context, state) {
//             final extra = state.extra as Map<String, dynamic>?;
//             return EnquiryListScreen(
//               initialTabIndex: extra?['initialTabIndex'] ?? 0,
//               initialBranchId: extra?['branchId'] as String?,
//               initialDateRange: extra?['dateRange'] as DateTimeRange?,
//               showAddNewEnquiryButton:
//                   extra?['showAddNewEnquiryButton'] ?? true,
//             );
//           },
//         ),
//         GoRoute(
//             path: Routes.overviewSales,
//             name: RouteNames.overviewSales,
//             builder: (context, state) {
//               final extra = state.extra as Map<String, dynamic>?;
//               return OverviewSalesList(
//                 branchId: extra?['branchId'] as String?,
//                 dateRange: extra?['dateRange'] as DateTimeRange?,
//                 staffId: extra?['staffId'] as String?,
//               );
//             }),

//         GoRoute(
//           path: Routes.vehicleInfoSale,
//           name: RouteNames.vehicleInfoSale,
//           builder: (context, state) {
//             return VehicleInfoScreen(vehicle: state.extra as VehicleDetails);
//           },
//         ),

//         GoRoute(
//           path: Routes.enquiryVehicles,
//           name: RouteNames.enquiryVehicles,
//           builder: (context, state) {
//             final enquiry = state.extra as EnquiryData;
//             return EnquiryVehicleListScreen(enquiry: enquiry);
//           },
//         ),
//         GoRoute(
//           path: Routes.expense,
//           name: RouteNames.expense,
//           builder: (context, state) {
//             final extra = state.extra as Map<String, dynamic>?;
//             return ExpenseManagementScreen(
//               warehouseId: extra?['warehouseId'] as String?,
//               dateRange: extra?['dateRange'] as DateTimeRange?,
//             );
//           },
//         ),
//         GoRoute(
//           path: Routes.broker,
//           name: RouteNames.broker,
//           builder: (context, state) {
//             final broker = state.extra as Broker?;
//             return BrokerDetailsScreen(broker: broker);
//           },
//         ),
//         GoRoute(
//             path: Routes.addBroker,
//             name: Routes.addBroker,
//             builder: (context, state) {
//               final broker = state.extra as Broker?;
//               return BrokerPersonalInfoScreen(broker: broker);
//             }),
//         GoRoute(
//           name: Routes.brokerProfile,
//           path: Routes.brokerProfile,
//           builder: (context, state) {
//             final broker = state.extra as Broker;
//             return BlocProvider.value(
//               value: context.read<BrokerDetailsBloc>()
//                 ..add(RetrieveBrokerEvent(brokerId: broker.id!)),
//               child: BrokerProfileScreen(broker: broker),
//             );
//           },
//         ),
//         GoRoute(
//           path: Routes.report,
//           name: RouteNames.report,
//           builder: (context, state) {
//             return const ReportScreen();
//           },
//         ),
//         GoRoute(
//           path: Routes.salesProfit,
//           name: Routes.salesProfit,
//           builder: (context, state) {
//             final extra = state.extra as Map<String, dynamic>?;
//             return SalesProfitListScreen(
//               warehouseId: extra?['warehouseId'] as String?,
//               dateRange: extra?['dateRange'] as DateTimeRange?,
//             );
//           },
//         ),
//         GoRoute(
//           path: Routes.collabVehicleDetails,
//           name: RouteNames.collabVehicleDetails,
//           builder: (context, state) {
//             final client = state.extra as String;
//             return CollabVehicleDetailsScreen(clientName: client);
//           },
//         ),

//         GoRoute(
//           path: Routes.followUp,
//           name: RouteNames.followUp,
//           builder: (context, state) {
//             final enquiry = state.extra as EnquiryData;
//             return FollowUpManagementScreen(item: enquiry);
//           },
//         ),

//         GoRoute(
//           path: Routes.staffMgt,
//           name: RouteNames.staffMgt,
//           builder: (context, state) => const StaffManagementScreen(),
//         ),

//         GoRoute(
//           path: Routes.addNewStaff,
//           name: RouteNames.addNewStaff,
//           builder: (context, state) => const AddNewStaffScreen(),
//         ),

//         GoRoute(
//           path: Routes.editStaff,
//           name: RouteNames.editStaff,
//           builder: (context, state) {
//             final staff = state.extra as Staff;
//             return EditStaffScreen(staff: staff);
//           },
//         ),

//         GoRoute(
//           path: Routes.jointVenture,
//           name: RouteNames.jointVenture,
//           builder: (context, state) => const JointVentureScreen(),
//         ),
//         GoRoute(
//             path: Routes.jointVentureDetails,
//             name: RouteNames.jointVentureDetails,
//             builder: (context, state) {
//               final vehicle = state.extra as VehicleList;
//               return JointVentureDetailsScreen(
//                 vehicle: vehicle,
//               );
//             }),

//         GoRoute(
//           path: Routes.userOverview,
//           name: RouteNames.userOverview,
//           builder: (context, state) {
//             final dateRange = state.extra as DateTimeRange?;
//             return UserOverviewDashboard(
//               initialDateRange: dateRange,
//             );
//           },
//         ),

//         GoRoute(
//           path: Routes.termsCondition,
//           name: RouteNames.termsCondition,
//           builder: (context, state) => const PrivacyPolicyScreen(),
//         ),

//         GoRoute(
//           path: Routes.investorDetailList,
//           name: RouteNames.investorDetailList,
//           builder: (context, state) {
//             final investor = state.extra as Investor;
//             return InvestorDetailListScreen(
//               investor: investor,
//             );
//           },
//         ),
//         GoRoute(
//           path: Routes.generalSettings,
//           name: RouteNames.generalSettings,
//           builder: (context, state) {
//             final settings = state.extra as GeneralSettings;
//             return GeneralSettingsScreen(
//               settings: settings,
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
