class User {
  List lowResolutionImage;
  List highResolutionImage;
  bool isEmailVerified;
  bool isPhoneVerified;
  String role;
  List useraddress;
  List favProd;
  List recentProducts;
  String phone;
  Object cart;
  Object lastOtpDetail;
  String name;
  String email;
  Object refer;
  Object deviceDetail;

  User(
      {this.lowResolutionImage,
      this.highResolutionImage,
      this.isEmailVerified,
      this.isPhoneVerified,
      this.role,
      this.useraddress,
      this.favProd,
      this.recentProducts,
      this.phone,
      this.cart,
      this.lastOtpDetail,
      this.name,
      this.email,
      this.refer,
      this.deviceDetail});
}
