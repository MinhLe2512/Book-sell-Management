using System;
using System.Collections.Generic;
using System.Data;
using MySql.Data.MySqlClient;
using System.Linq;
using System.Web;

namespace BTL.KetNoiMySQL
{
    public class clsDongHo
    {
        //============ loại đồng hồ=======================
        public DataTable GetList()
        {
            MySqlCommand sqlCom = new MySqlCommand("select * from LoaiDongHo");
            sqlCom.CommandType = CommandType.Text;
            return connectSQL.GetData(sqlCom);
        }
        public void Insert(string CategoryName, string xuatXu,string hangSanXuat, string thuongHieu)//
        {
            MySqlCommand sqlCom = new MySqlCommand("insert into LoaiDongHo(nameTypeDH, xuatXu, hangSanXuat, active, thuongHieu) values (@CategoryName,@xuatxu, @hangsanxuat,1,@th)");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@CategoryName", CategoryName);
            sqlCom.Parameters.AddWithValue("@xuatxu", xuatXu);
            sqlCom.Parameters.AddWithValue("@hangsanxuat", hangSanXuat);
            sqlCom.Parameters.AddWithValue("@th", thuongHieu);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public void Update(int id, string CategoryName, string xuatXu, string hangSanXuat,string thuongHieu)//
        {
            MySqlCommand sqlCom = new MySqlCommand("Update LoaiDongHo set nameTypeDH=@CategoryName,xuatXu=@xuatxu,hangSanXuat=@hangsx ,active=1,thuongHieu=@th where typeDHid=@cateid");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@CategoryName", CategoryName);
            sqlCom.Parameters.AddWithValue("@xuatxu", xuatXu);
            sqlCom.Parameters.AddWithValue("@hangsx", hangSanXuat);
            sqlCom.Parameters.AddWithValue("@cateid", id);
            sqlCom.Parameters.AddWithValue("@th", thuongHieu);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public void Delete(int id)//
        {
            MySqlCommand sqlCom = new MySqlCommand("delete from LoaiDongHo where typeDHid=@cateid");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@cateid", id);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public DataTable GetDHbyCategoryID(int id)
        {
            MySqlCommand sqlCom = new MySqlCommand("select * from LoaiDongHo where typeDHid=@cateid");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@cateid", id);
            return connectSQL.GetData(sqlCom);
        }

        
        //================chi tiết về 1 đồng hồ==========================
        public DataTable GetListWatchDetailByCate(int typewatchID)
        {
            MySqlCommand sqlCom = new MySqlCommand("select * from ChiTietDongHo where typeDHid_pk=@id");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@id", typewatchID);
            return connectSQL.GetData(sqlCom);
        }

        public void InsertDatail(int typeHDid, string code, long price, double sale,string image,long quantity,
            DateTime createDate,string kieudang,string nangluong,long dochiunuoc,string chatlieumat,double duongkinhmat,
            string chatlieuday,double sizeDay,string chatlieuvo,double duongkinhvo,double timebaohanh, bool active)
        {
            MySqlCommand sqlCom;
            if (active == true)
            {
                sqlCom = new MySqlCommand("insert into ChiTietDongHo(typeDHid_pk, code, price, sale, urlPicture, urlVideo, quantity, createDate, kieuDang, nangLuong, doChiuNuoc, chatLieuMat, duongKinhMat, chatLieuDay, sizeDay, chatLieuVo, duongKinhVo, timeBaoHanh, active) values(@typeDHid,@code,@price,@sale,@urlPicture,' '" +
                ",@quantity,@createDate,@kieudang,@nangluong,@dochiunuoc,@chatlieumat,@duongkinhmat,@chatlieuday,@sizeday" +
                ",@chatlieuvo,@duongkinhvo,@timebaohanh,1)");//@acitve
            }
            else {
                sqlCom = new MySqlCommand("insert into ChiTietDongHo(typeDHid_pk, code, price, sale, urlPicture, urlVideo, quantity, createDate, kieuDang, nangLuong, doChiuNuoc, chatLieuMat, duongKinhMat, chatLieuDay, sizeDay, chatLieuVo, duongKinhVo, timeBaoHanh, active) values(@typeDHid,@code,@price,@sale,@urlPicture,' '" +
                ",@quantity,@createDate,@kieudang,@nangluong,@dochiunuoc,@chatlieumat,@duongkinhmat,@chatlieuday,@sizeday" +
                ",@chatlieuvo,@duongkinhvo,@timebaohanh,0)");//@acitve
            }
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@typeDHid", typeHDid);
            sqlCom.Parameters.AddWithValue("@code", code);
            sqlCom.Parameters.AddWithValue("@price", price);
            sqlCom.Parameters.AddWithValue("@sale", sale);
            sqlCom.Parameters.AddWithValue("@urlPicture", image);
            sqlCom.Parameters.AddWithValue("@quantity", quantity);
            sqlCom.Parameters.AddWithValue("@createDate", createDate);
            sqlCom.Parameters.AddWithValue("@kieudang", kieudang);
            sqlCom.Parameters.AddWithValue("@nangluong", nangluong);
            if(dochiunuoc>0)
                sqlCom.Parameters.AddWithValue("@dochiunuoc", dochiunuoc);
            else
                sqlCom.Parameters.AddWithValue("@dochiunuoc",DBNull.Value);
            sqlCom.Parameters.AddWithValue("@chatlieumat", chatlieumat);
            if(duongkinhmat>0)
                sqlCom.Parameters.AddWithValue("@duongkinhmat", duongkinhmat);
            else
                sqlCom.Parameters.AddWithValue("@duongkinhmat", DBNull.Value);
            sqlCom.Parameters.AddWithValue("@chatlieuday", chatlieuday);
            if(sizeDay>0)
                sqlCom.Parameters.AddWithValue("@sizeday", sizeDay);
            else
                sqlCom.Parameters.AddWithValue("@sizeday", DBNull.Value);
            sqlCom.Parameters.AddWithValue("@chatlieuvo",chatlieuvo );
            if(duongkinhvo>0)
                sqlCom.Parameters.AddWithValue("@duongkinhvo", duongkinhvo);
            else
                sqlCom.Parameters.AddWithValue("@duongkinhvo", DBNull.Value);
            if(timebaohanh>0)
                sqlCom.Parameters.AddWithValue("@timebaohanh", timebaohanh);
            else
                sqlCom.Parameters.AddWithValue("@timebaohanh", DBNull.Value);
            //sqlCom.Parameters.AddWithValue("@active", active);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }

        public void UpdateDatailWatch(int detailHDid,int typeHDid, string code, long price, double sale, string image, long quantity,
            string kieudang, string nangluong, long dochiunuoc, string chatlieumat, double duongkinhmat,
            string chatlieuday, double sizeDay, string chatlieuvo, double duongkinhvo, double timebaohanh,  bool active)
        {
            MySqlCommand sqlCom;
            if (active == true)
            {
                sqlCom= new MySqlCommand("update ChiTietDongHo set typeDHid_pk=@typeDHid,code=@code,price=@price,sale=@sale,urlPicture=@urlPicture" +
                ",quantity=@quantity,kieuDang=@kieudang,nangLuong=@nangluong,doChiuNuoc=@dochiunuoc,chatLieuMat=@chatlieumat,duongKinhMat=@duongkinhmat,chatLieuDay=@chatlieuday,sizeDay=@sizeday" +
                ",chatLieuVo=@chatlieuvo,duongKinhVo=@duongkinhvo,timeBaoHanh=@timebaohanh,active=1 where chiTietDHid=@detailID");
            }
            else {
                sqlCom = new MySqlCommand("update ChiTietDongHo set typeDHid_pk=@typeDHid,code=@code,price=@price,sale=@sale,urlPicture=@urlPicture" +
                ",quantity=@quantity,kieuDang=@kieudang,nangLuong=@nangluong,doChiuNuoc=@dochiunuoc,chatLieuMat=@chatlieumat,duongKinhMat=@duongkinhmat,chatLieuDay=@chatlieuday,sizeDay=@sizeday" +
                ",chatLieuVo=@chatlieuvo,duongKinhVo=@duongkinhvo,timeBaoHanh=@timebaohanh,active=0 where chiTietDHid=@detailID");
            }
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@typeDHid", typeHDid);
            sqlCom.Parameters.AddWithValue("@code", code);
            sqlCom.Parameters.AddWithValue("@price", price);
            sqlCom.Parameters.AddWithValue("@sale", sale);
            sqlCom.Parameters.AddWithValue("@urlPicture", image);
            sqlCom.Parameters.AddWithValue("@quantity", quantity);
            sqlCom.Parameters.AddWithValue("@kieudang", kieudang);
            sqlCom.Parameters.AddWithValue("@nangluong", nangluong);
            if (dochiunuoc > 0)
                sqlCom.Parameters.AddWithValue("@dochiunuoc", dochiunuoc);
            else
                sqlCom.Parameters.AddWithValue("@dochiunuoc", DBNull.Value);
            sqlCom.Parameters.AddWithValue("@chatlieumat", chatlieumat);
            if (duongkinhmat > 0)
                sqlCom.Parameters.AddWithValue("@duongkinhmat", duongkinhmat);
            else
                sqlCom.Parameters.AddWithValue("@duongkinhmat", DBNull.Value);
            sqlCom.Parameters.AddWithValue("@chatlieuday", chatlieuday);
            if (sizeDay > 0)
                sqlCom.Parameters.AddWithValue("@sizeday", sizeDay);
            else
                sqlCom.Parameters.AddWithValue("@sizeday", DBNull.Value);
            sqlCom.Parameters.AddWithValue("@chatlieuvo", chatlieuvo);
            if (duongkinhvo > 0)
                sqlCom.Parameters.AddWithValue("@duongkinhvo", duongkinhvo);
            else
                sqlCom.Parameters.AddWithValue("@duongkinhvo", DBNull.Value);
            if (timebaohanh > 0)
                sqlCom.Parameters.AddWithValue("@timebaohanh", timebaohanh);
            else
                sqlCom.Parameters.AddWithValue("@timebaohanh", DBNull.Value);
           // sqlCom.Parameters.AddWithValue("@active", active);
            sqlCom.Parameters.AddWithValue("@detailID", detailHDid);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public DataTable GetListWatchDetails_by_DelID(int delID)
        {
            MySqlCommand sqlCom = new MySqlCommand("select * from ChiTietDongHo where chiTietDHid=@detailID");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@detailID", delID);
            return connectSQL.GetData(sqlCom);
        }
        public void DeleteWatchDetail(int detailWatchID)
        {
            MySqlCommand sqlCom = new MySqlCommand("Delete from ChiTietDongHo where chiTietDHid=@detailID");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@detailID", detailWatchID);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
    }
    
}