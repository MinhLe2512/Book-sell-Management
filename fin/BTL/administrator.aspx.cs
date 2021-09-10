using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class administrator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                plLoad.Controls.Add(LoadControl("/admin/adminControl.ascx"));
            }

            else
            {
                plLoad.Controls.Add(LoadControl("/admin/login.ascx"));
            }
        }
    }
}