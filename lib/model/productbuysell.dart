 

class ProductBuysell {
  String productname;
  String ProductDiscription;
  String Productimage;
  String ProdcutPeice;
  String? Productid;
  String uid;

  ProductBuysell({
    required this.productname,
    required this.ProductDiscription,
    required this.Productimage,
    required this.ProdcutPeice,
    this.Productid,
    required this.uid,
  });

  Map<String, dynamic> toJson(idd) => {
        'ProductName': productname,
        'ProductDiscription': ProductDiscription,
        'Productimage': Productimage,
        'ProdcutPeice': ProdcutPeice,
        'Productid': idd,
        'uid': uid,
      };

  factory ProductBuysell.fromjson(Map<String, dynamic> jsone) {
    return ProductBuysell(
      productname: jsone['ProductName'],
      ProductDiscription: jsone['ProductDiscription'],
      Productimage: jsone['Productimage'],
      ProdcutPeice: jsone['ProdcutPeice'],
      uid: jsone['uid'],
      Productid: jsone['Productid'],
    );
  }
}
