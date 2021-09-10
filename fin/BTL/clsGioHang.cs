using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL
{
    public class clsGioHang
    {
        public string id { get; set; }
        public string img { get; set; }
        public string name { get; set; }
        public string price { get; set; }
        public string totalMoney { get; set; }
        public string number { get; set; }
        public clsGioHang()
        {

        }
        public clsGioHang(string id, string img, string name, string total, string price, string number)
        {
            this.id = id;
            this.img = img;
            this.name = name;
            this.totalMoney = total;
            this.price = price;
            this.number = number;
        }
    }
}