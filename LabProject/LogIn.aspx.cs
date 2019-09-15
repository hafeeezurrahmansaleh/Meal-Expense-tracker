using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabProject
{
    public partial class LogIn : System.Web.UI.Page
    {
        DataHandling dth = new DataHandling();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        
        protected void btnSignInClicked(object sender, EventArgs e)
        {
            String query;
            DataTable dtbl = new DataTable();
            if(UserName.Value.Contains("."))
                query = @"SELECT * FROM MemberInfo WHERE MemberUserName = '" + UserName.Value + "' AND MemberPassword ='" + password.Value + "' ";
            else
                query = @"SELECT * FROM [dbo].[AdminInfo] WHERE UserName = '" + UserName.Value.ToString() + "' AND Pwd ='" + password.Value.ToString() + "' ";
            dtbl=dth.GetDatatable(query);
            int a = dtbl.Rows.Count;
            if (a == 1 && UserName.Value.Contains("."))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "AnyValue", "showAlert();", true);
                Session["value"] = UserName.Value;
                Response.Redirect("MemberPortal.aspx");
            }
            else if (a == 1 && !(UserName.Value.Contains(".")))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "AnyValue", "showAlert();", true);
                Session["New"] = "admin";
                Response.Redirect("AdminPortal.aspx");
            }
            else
            {
                //Session["New"] = UserName.Value;
                //Response.Write(Session["id"]);
                ScriptManager.RegisterStartupScript(this, GetType(), "AnyValue", "showAlert();", true);
                Response.Redirect("LogIn.aspx");
            }

        }
    }
}