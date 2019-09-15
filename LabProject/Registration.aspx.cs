using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabProject
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=DESKTOP-6L4UQ6J;Initial Catalog=HostelManagement;Integrated Security=true");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
                
            SqlCommand sqlCmd = new SqlCommand("CreateAdmin", sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@HostelName", txtHostelName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@HostelAddress", txtAddress.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@AdminName", txtAdminName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Pwd", txtPwd.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@EmailID", txtEmailID.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Extra", txtExtra.Text.Trim());
            
                if (sqlCon.State == ConnectionState.Closed)
                    sqlCon.Open();
                sqlCmd.ExecuteNonQuery();
               // ScriptManager.RegisterStartupScript(this, GetType(), "AnyValue", "showAlert();", true);
                Session["New"] = txtUserName.Text;
                Response.Redirect("AdminPortal");
                //lblMsg.Text = "User Registration successful";
            /*}
            catch (Exception ee)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "AnyValue", "showAlert1();", true);
                //lblMsg.Text = "Error in registering user";
                Response.Write(ee);
            }*/
            sqlCon.Close();
        }

        

    }
}