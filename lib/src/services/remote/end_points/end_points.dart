class EndPoints {
  static const String login = 'api/v1/auth/';
  static const String userDetails = 'api/v1/auth/user-details';
  static const String getBrands = 'api/v1/brand/';
  static const String getCarModel = 'api/v1/car-models/';
  static const String getCarVariant = 'api/v1/variants/';
  static const String createVehicle = 'api/v1/vehicles/';
  static const String imageUpload = 'api/v1/image_upload/';
  static const String searchBroker = 'api/v1/broker/';
  static const String getVehicleColors = 'api/v1/colors/';
  static const String getRepairList = 'api/v1/repairs/';
  static const String branch = 'api/v1/branch/';
  static const String repairMgt = 'api/v1/repair-management/';
  static const String monthlyProfit = 'api/v1/dashboard/monthly-profit';
  static const String dashboardTopCards =
      'api/v1/dashboard/app-dashboard-cards';
  static const String dashboardAppSummary = 'api/v1/dashboard/app-summary';
  static const String customer = 'api/v1/customers/';
  static const String sales = 'api/v1/sales/';
  static const String clients = 'api/v1/clients/';
  static const String connectionRequest = 'api/v1/connection-request/';
  static const String enquiry = 'api/v1/leads/';
  static const String followUp = 'api/v1/follow-up/';
  static const String testDrive = 'api/v1/test-drive/';
  static const String deleteAccount = '/api/v1/users/{pk}/';
  static const String editProfile = '/api/v1/users/profile/{pk}/';
  static const String editEnquiry = 'api/v1/leads/{pk}/';
  static const String user = 'api/v1/users/';
  static const String role = 'api/v1/role/';
  static const String enquiredVehicleList =
      'api/v1/vehicles/enquired-vehicles/';
  static const String jointVenture = 'api/v1/joint-ventures/';
  static const String enquiryCount = 'api/v1/leads/enquiry/indications/';
  static const String overview = 'api/v1/sales/staff/overview/';
  static const String enquiryOverview = 'api/v1/leads/user/enquiry/overview/';
  static const String expense = '/api/v1/expense/';
  static const String expenseCategory = '/api/v1/expense-category/';
  static const String editExpense = '/api/v1/expense/{pk}/';
  static const String editExpenseCategory = '/api/v1/expense-category/{pk}/';
  static const String broker = '/api/v1/broker/';
  static const String editBroker = '/api/v1/broker/{pk}/';
  static const String saleBroker = '/api/v1/sales/broker/sales/';
  static const String profit = '/api/v1/sales/by/profit/';
  static const String enquiryReport = '/api/v1/reports/enquiry-report/';
  static const String generalSettings = 'api/v1/general-settings/';
  static const String gstReport = '/api/v1/reports/gst-report/';
  static const String fcmToken = 'api/v1/auth/push/register/';
  static const String missedFollowupReport =
      '/api/v1/reports/missed-followup-report/';
  static const String vehicleReport = '/api/v1/reports/vehicle-report/';
  static const String pendingFollowupReport =
      '/api/v1/reports/pending-followup-report/';
}
