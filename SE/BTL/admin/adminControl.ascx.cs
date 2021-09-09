using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL.admin
{
    public partial class adminControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("~/administrator.aspx");
            string s = Request.QueryString["choose"];
            switch (s)
            {
                case "dongho":
                    LoadRegionAdmin.Controls.Add(LoadControl("DongHo/DHControl.ascx"));
                    break;
                case "userAdmin":
                    LoadRegionAdmin.Controls.Add(LoadControl("Users/UserAdmin.ascx"));
                    break;
                case "donhang":
                    LoadRegionAdmin.Controls.Add(LoadControl("DonDatHang/donhang.ascx"));
                    break;

            }
        }

        protected void lnkExit_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();

            Response.Redirect("~/administrator.aspx");
        }
    }
}