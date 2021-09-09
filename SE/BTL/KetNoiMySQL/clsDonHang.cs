using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Linq;
using System.Web;
using System.Data;

namespace BTL.KetNoiMySQL
{
    public class clsDonHang
    {
        public void InsertDonDatHang(string ghiChu,int kieuThanhToan, string hoTen, string sdt, string email, string diaChi)
        {
            MySqlCommand sqlCom=new MySqlCommand();
            sqlCom.CommandText = "insertDonDatHang";
            sqlCom.CommandType =CommandType.StoredProcedure;
            sqlCom.Parameters.AddWithValue("@ghiChu", ghiChu);
            sqlCom.Parameters.AddWithValue("@kieuThanhToan", kieuThanhToan);
            sqlCom.Parameters.AddWithValue("@hoTen", hoTen);
            sqlCom.Parameters.AddWithValue("@sdt", sdt);
            sqlCom.Parameters.AddWithValue("@email", email);
            sqlCom.Parameters.AddWithValue("@diaChi", diaChi);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public void InsertChiTietDonDatHang(int idDongHo, int soLuong)
        {
            MySqlCommand sqlCom = new MySqlCommand();
            sqlCom.CommandText = "insertChiTietDonDat";
            sqlCom.CommandType = CommandType.StoredProcedure;
            sqlCom.Parameters.AddWithValue("@idDH", idDongHo);
            sqlCom.Parameters.AddWithValue("@soLuong", soLuong);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public DataTable GetListDonDatHang()
        {
            MySqlCommand sqlCom = new MySqlCommand();
            sqlCom.CommandText = "GetDonHang";
            sqlCom.CommandType = CommandType.StoredProcedure;
            return connectSQL.GetData(sqlCom);
        }

        public DataTable GetDetailDonDatHang(int id)
        {
            MySqlCommand sqlCom = new MySqlCommand();
            sqlCom.CommandText = "GetDetailDonHangByID";
            sqlCom.CommandType = CommandType.StoredProcedure;
            sqlCom.Parameters.AddWithValue("@id", id);
            return connectSQL.GetData(sqlCom);
        }
        public void UpdateTinhTrangDonHang(int idDonHang,int tinhTrang)
        {
            MySqlCommand sqlCom = new MySqlCommand();
            sqlCom.CommandText = "editDonHang";
            sqlCom.CommandType = CommandType.StoredProcedure;
            sqlCom.Parameters.AddWithValue("@id", idDonHang);
            sqlCom.Parameters.AddWithValue("@tinhTrang", tinhTrang);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
    }
}