class ListOrder {
  late String mdh;
  late String trangthai;
  late String ngay;
  late String gio;
  late String diachicuahang;
  late String diachinhan;
  late String sanpham;
  late num price;

  ListOrder(
      [String? mdh,
        String? trangthai,
        String? ngay,
        String? gio,
        String? diachicuahang,
        String? diachinhan,
        String? sanpham,
        num? price]) {
    this.mdh = mdh ?? "";
    this.trangthai = trangthai ?? "";
    this.ngay = ngay ?? "";
    this.gio = gio ?? "";
    this.diachicuahang = diachicuahang ?? "";
    this.diachinhan = diachinhan ?? "";
    this.sanpham = sanpham ?? "";
    this.price = price ?? -1;
  }

  @override
  String toString() {
    return 'Cart{mdh: $mdh,trangthai: $trangthai, ngay: $ngay, gio: $gio, diachicuahang: $diachicuahang, diachinhan: $diachinhan, sanpham: $sanpham, price: $price}';
  }
}