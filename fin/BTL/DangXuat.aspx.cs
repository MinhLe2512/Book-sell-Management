using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class DangXuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Session["loginAccount"] = -1;
            Session["userName"] = "";
            Session["userID"] = -1;
            Session["avatarUser"] = "images/icon-acc.png";
            Response.Redirect(Session["url"].ToString());
        }
    }
}