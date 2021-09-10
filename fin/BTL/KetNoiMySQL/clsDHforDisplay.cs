using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace BTL.KetNoiMySQL
{
    public class clsDHforDisplay
    {
        /// <summary>
        /// lấy 10 tên loại đồng hồ để cho vào menu dropdown
        /// </summary>
        /// <returns></returns>
        public DataTable get10TypeDH()
        {
            string query = @"select typeDHid,nameTypeDH
                            from LoaiDongHo";
            MySqlCommand cmd = new MySqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);
        }
        /// <summary>
        /// lấy 4 chiếc đồng hồ đang giảm giá
        /// </summary>
        /// <returns></returns>
        public DataTable get4DHSale()
        {
            string query = @"select ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture,(ctdt.price - ctdt.price*ctdt.sale/100) as priceSale
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and sale>0 and ctdt.active=1";
            MySqlCommand cmd = new MySqlCommand(query);
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
            string query = @"select ldh.typeDHid,ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1 and ctdt.typeDHid_pk=@typeID";//and sale=0 
            MySqlCommand cmd = new MySqlCommand(query);
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
            string query = @"select ldh.typeDHid,ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1 and ctdt.typeDHid_pk=@typeID";//and sale=0 
            MySqlCommand cmd = new MySqlCommand(query);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@typeID", idLoaiDH);
            return connectSQL.GetData(cmd);
        }
        public DataTable get20DH()
        {
            string query = @"select ldh.typeDHid,ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1";//and sale=0 
            MySqlCommand cmd = new MySqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);
        }
        public DataTable get20DHbyCode(string code)
        {
            string query = @"select ldh.typeDHid,ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1 and ctdt.code like '%" + code+"%'";
            MySqlCommand cmd = new MySqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);
        }
        public DataTable get20DHbyTypeName(string typeDHName)
        {
            string query = @"select ldh.typeDHid,ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1 and ldh.nameTypeDH like '%" + typeDHName+"%'";
            MySqlCommand cmd = new MySqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);
        }
        public DataTable get20DHbyTypeID(int id)
        {
            string query = @"select ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and ctdt.active=1 and ldh.typeDHid=@id";
            MySqlCommand cmd = new MySqlCommand(query);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@id", id);
            return connectSQL.GetData(cmd);
        }
        public DataTable get20DHSale()
        {
            string query = @"select ldh.typeDHid,ctdt.chiTietDHid,ldh.nameTypeDH,ctdt.code,ctdt.price,urlPicture,(ctdt.price - ctdt.price*ctdt.sale/100) as priceSale
                            from ChiTietDongHo ctdt, LoaiDongHo ldh
                            where ctdt.typeDHid_pk=ldh.typeDHid and sale>0 and ctdt.active=1";
            MySqlCommand cmd = new MySqlCommand(query);
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
            MySqlCommand cmd = new MySqlCommand(query);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@ID", watchID);
            return connectSQL.GetData(cmd);
        }
    }
}