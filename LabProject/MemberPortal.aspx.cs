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
    public partial class MemberPortal : System.Web.UI.Page
    {
        string connctstring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        String query;
        DataHandling dth = new DataHandling();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            //String UserName = (string)Session["New"];
            string UserName = (string)Session["value"];
            if(UserName == "maruf.s")
            {
                FillGrid();
            }
            SuccessMessaage.Text = "";
            if (Session["New"] == null)
               // Response.Redirect("login.aspx");
            if (!IsPostBack)
            {
                    try
                    {
                        Panel1.Visible = true;
                        query = @"SELECT * FROM (MemberInfo INNER JOIN MonthlyCostInfo ON MemberInfo.MemberUserName= MonthlyCostInfo.MemberUserName) WHERE MemberInfo.MemberUserName = '" + UserName + "'";
                        dt = dth.GetDatatable(query);
                        txtUserName.Text = dt.Rows[0]["MemberUserName"].ToString();
                        txtName.Text = dt.Rows[0]["MemberName"].ToString();
                        txtMobile.Text = dt.Rows[0]["Mobile"].ToString();
                        txtEmail.Text = dt.Rows[0]["MemberEmail"].ToString();
                        txtGuardianMobile.Text = dt.Rows[0]["GuardianMobile"].ToString();
                        txtAdvanceDeposit.Text = dt.Rows[0]["AdvanceRent"].ToString();
                        txtNID.Text = dt.Rows[0]["NID"].ToString();
                        txtHouseRent.Text = dt.Rows[0]["HouseRent"].ToString();
                        txtAddress.Text = dt.Rows[0]["MemberAddress"].ToString();
                        txtUtilities.Text = dt.Rows[0]["Utilities"].ToString();
                        txtTotalPaid.Text = dt.Rows[0]["TotalPaid"].ToString();
                        txtAdminUserName.Text = dt.Rows[0]["AdminUserName"].ToString();
                        txtMemberPassword.Text = dt.Rows[0]["MemberPassword"].ToString();
                    }
                    catch (Exception)
                    {

                    }

            }
        }
        protected void FillGrid()
        {
            query = @"SELECT MemberUserName FROM [dbo].[MonthlyCostInfo]";
            dt = dth.GetDatatable(query);
            gvMaruf.DataSource = dt;
            gvMaruf.DataBind();
        }
        protected void btnUpdatePersonalInfo_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connctstring);
            if (btnUpdatePersonalInfo.Text == "Change Password")
            {
                txtMemberPassword.ReadOnly = false;
                btnUpdatePersonalInfo.Text = "CHANGE";
            }
            else
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                SqlCommand sqlCmd = new SqlCommand("CreateOrUpdateMemberInfo", conn);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@MemberName", txtName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MemberUserName", txtUserName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@AdminUserName", txtAdminUserName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@GuardianMobile", txtGuardianMobile.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MemberEmail", txtEmail.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MemberAddress", txtAddress.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@MemberPassword", txtMemberPassword.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@AdvanceRent", Convert.ToInt32(txtAdvanceDeposit.Text.Trim()));
                sqlCmd.Parameters.AddWithValue("@NID", txtNID.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@btnText", btnUpdatePersonalInfo.Text.ToString());

                string oldPassword= txtMemberPassword.Text.Trim();
                try
                {
                    sqlCmd.ExecuteNonQuery();
                    SuccessMessaage.Text = "Changed Successfully";
                    btnUpdatePersonalInfo.Text = "Change Password";
                }
                catch (Exception eee)
                {
                    txtMemberPassword.Text = oldPassword;
                    SuccessMessaage.Text = "Faild!!!"+eee;
                }
                conn.Close();

            }
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("LogIn.aspx");
        }
    }
}