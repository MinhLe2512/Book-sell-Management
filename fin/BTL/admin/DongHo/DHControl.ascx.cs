using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL.admin.DongHo
{
    public partial class DHControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("~/administrator.aspx");
            string type = Request["type"];
            switch (type)
            {
                case "category":
                    Controls.Add(LoadControl("DHCategory.ascx"));
                    break;
                case "detail_1_DH":
                    Controls.Add(LoadControl("DHDetail.ascx"));
                    break;
                default:
                    Controls.Add(LoadControl("DHCategory.ascx"));
                    break;
            }
        }
    }
}