using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace BTL.KetNoiSQL
{
    public class clsDHforDisplay
    {
        /// <summary>
        /// lấy 10 tên loại đồng hồ để cho vào menu dropdown
        /// </summary>
        /// <returns></returns>
        public DataTable get10TypeDH()
        {
            string query = @"select top 10 typeDHid,nameTypeDH
                            from LoaiDongHo";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);
        }
        /// <summary>
        /// lấy 4 chiếc đồng hồ đang giảm giá
        /// </summary>
        /// <returns></returns>
        public DataTable get4DHSale()
        {
            string query = @"select top 4 ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture,(ctdt.price - ctdt.price*ctdt.sale/100) as priceSale
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and sale>0 and ctdt.active=1";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);
        }
        /// <summary>
        /// lấy 6 đồng hồ theo mã loại
        /// </summary>
        /// <param name="idLoaiDH">id mã loại đồng hồ</param>
        /// <returns></returns>
        public DataTable get6DHbyTypeID(int idLoaiDH)
        {
            string query = @"select top 6 ldh.typeDHid,ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1 and ctdt.typeDHid_pk=@typeID";//and sale=0 
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@typeID", idLoaiDH);
            return connectSQL.GetData(cmd);
        }
        /// <summary>
        /// lấy 6 đồng hồ theo mã loại
        /// </summary>
        /// <param name="idLoaiDH">id mã loại đồng hồ</param>
        /// <returns></returns>
        public DataTable get4DHbyTypeID(int idLoaiDH)
        {
            string query = @"select top 4 ldh.typeDHid,ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1 and ctdt.typeDHid_pk=@typeID";//and sale=0 
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@typeID", idLoaiDH);
            return connectSQL.GetData(cmd);
        }
        public DataTable get20DH()
        {
            string query = @"select top 20 ldh.typeDHid,ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1";//and sale=0 
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);
        }
        public DataTable get20DHbyCode(string code)
        {
            string query = @"select top 20 ldh.typeDHid,ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1 and ctdt.code like '%" + code+"%'";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);
        }
        public DataTable get20DHbyTypeName(string typeDHName)
        {
            string query = @"select top 20 ldh.typeDHid,ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1 and ldh.nameTypeDH like '%" + typeDHName+"%'";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);
        }
        public DataTable get20DHbyTypeID(int id)
        {
            string query = @"select top 20 ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1 and ldh.typeDHid=@id";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@id", id);
            return connectSQL.GetData(cmd);
        }
        public DataTable get20DHSale()
        {
            string query = @"select top 20 ldh.typeDHid,ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture,(ctdt.price - ctdt.price*ctdt.sale/100) as priceSale
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and sale>0 and ctdt.active=1";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);
        }
        /// <summary>
        /// lấy thông tin chi tiết về 1 đồng hồ
        /// </summary>
        /// <param name="watchID">id của chi tiết đồng hồ</param>
        /// <returns></returns>
        public DataTable getInforDHbyID(int watchID)
        {
            string query = @"select ctdt.*,ldh.*
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.chiTietDHid=@ID";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@ID", watchID);
            return connectSQL.GetData(cmd);
        }
    }
}