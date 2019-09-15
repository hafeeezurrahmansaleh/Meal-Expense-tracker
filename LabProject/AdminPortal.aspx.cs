using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;

namespace LabProject
{
    public partial class Admin_Portal : System.Web.UI.Page
    {

        string connctstring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        string currentMonth = DateTime.Now.ToString("MM-yyyy");
        String query;
        DataHandling dth = new DataHandling();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDisplayDate.Text =DateTime.Now.ToString("dddd, dd MMMM-yyyy");
            SuccessMessaage.Text = "";
            if (Session["New"] == null)
                Response.Redirect("login.aspx");
            if (!IsPostBack)
            {
                FillGrid();

            }
        }
        protected void FillGrid()
        {
            query = @"SELECT MemberUserName, HouseRent, Utilities, TotalPaid, MealDeposit FROM [dbo].[MonthlyCostInfo] where Month = '" + currentMonth + "'";
            dt = dth.GetDatatable(query);
            if (dt.Rows.Count == 0)
            {
                DailyMeal dm = new DailyMeal();
                string[] columns = dm.getColumnNames();
                for (int i = 1; i < columns.Length;i++) {
                    query = @"INSERT INTO MonthlyCostInfo(MemberUserName, Month) Values('" + columns[i] + "', '" + currentMonth + "')";
                    Response.Write(columns[i]);
                    Response.Write( dth.executequery(query));
                }
                query = @"SELECT MemberUserName, HouseRent, Utilities, TotalPaid, MealDeposit FROM [dbo].[MonthlyCostInfo] where Month = '" + currentMonth + "'";
                dt = dth.GetDatatable(query);
            }
            gvMembersInfo.DataSource = dt;
            gvMembersInfo.DataBind();
        }

        protected void btnUpdatePersonalInfo_Click(object sender, EventArgs e)
        {
            //Panel1.Visible = true;
            SqlConnection conn = new SqlConnection(connctstring);
            if (btnUpdatePersonalInfo.Text == "UPDATE")
            {
                btnUpdatePersonalInfo.CausesValidation = false;
                txtName.ReadOnly = txtMemberPassword.ReadOnly = txtAdminUserName.ReadOnly = txtNID.ReadOnly = txtUserName.ReadOnly = txtMobile.ReadOnly = txtGuardianMobile.ReadOnly = txtEmail.ReadOnly = txtAdvanceDeposit.ReadOnly = txtAddress.ReadOnly = false;
                btnUpdatePersonalInfo.Text = "SAVE";
                txtMemberPassword.ReadOnly = txtUserName.ReadOnly = true;
            }

            else if (btnUpdatePersonalInfo.Text == "SAVE" || btnUpdatePersonalInfo.Text == "ADD")
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
                sqlCmd.Parameters.AddWithValue("@Month", currentMonth);
                sqlCmd.Parameters.AddWithValue("@btnText", btnUpdatePersonalInfo.Text.ToString());
                
                try
                {
                    sqlCmd.ExecuteNonQuery();
                    //Panel1.Visible = false;
                    if (btnUpdatePersonalInfo.Text == "ADD")
                    {
                       // query = @"ALTER TABLE DailyMealTracker ADD " + txtUserName.Text.Trim()+" int NULL";
                        query= @"ALTER TABLE[dbo].[DailyMealTracker]
                                ADD[" + txtUserName.Text.Trim()+"][int] NULL";
                        SqlCommand cmd = new SqlCommand(query, conn); //push data
                        cmd.ExecuteNonQuery();
                    }
                    SuccessMessaage.Text = "Saved Successfully";
                    FillGrid();
                }
                catch (Exception eee)
                {
                    SuccessMessaage.Text = "Faild!!!"+eee;
                }
                
                conn.Close();



            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //Response.Redirect("AdminPortal.aspx");
            clear();
            Panel1.Visible = true;
            btnUpdatePersonalInfo.Text = "ADD";
            txtName.ReadOnly = txtMemberPassword.ReadOnly = txtAdminUserName.ReadOnly = txtNID.ReadOnly = txtUserName.ReadOnly = txtMobile.ReadOnly = txtGuardianMobile.ReadOnly = txtEmail.ReadOnly = txtAdvanceDeposit.ReadOnly = txtAddress.ReadOnly = false;
            //btnUpdatePersonalInfo_Click(sender,e);
        }
        public void clear()
        {
            txtMemberPassword.Text = txtNID.Text = txtAdminUserName.Text = txtUserName.Text = txtName.Text = txtMobile.Text = txtEmail.Text = txtGuardianMobile.Text = txtAdvanceDeposit.Text = txtAddress.Text = "";
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connctstring);
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            SqlCommand sqlCmd = new SqlCommand("UpdateMonthlyCostInfo", conn);
            if (txtAddMoreDiposite.Text == "")
            {
                txtAddMoreDiposite.Text = "0";
            }
            int TotalPaid = Convert.ToInt32(txtTotalPaid.Text) + Convert.ToInt32(txtAddMoreDiposite.Text);
            int MealDeposit = TotalPaid - (Convert.ToInt32(txtHouseRent.Text) + Convert.ToInt32(txtUtilities.Text));
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@MemberUserName", txtUserName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@MealDeposit", MealDeposit);
            sqlCmd.Parameters.AddWithValue("@HouseRent", txtHouseRent.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Utilities", txtUtilities.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@TotalPaid", TotalPaid);
            sqlCmd.Parameters.AddWithValue("@Month", txtMonth.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@AddDeposite", Convert.ToInt32(txtAddMoreDiposite.Text));
            sqlCmd.ExecuteNonQuery();
            FillTextBoxes(txtUserName.Text);
            FillGrid();
            txtAddMoreDiposite.Text = "0";
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {

        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            String UserName = (sender as LinkButton).CommandArgument;
            FillTextBoxes(UserName);


        }
        void FillTextBoxes(String UserName)
        {
            try
            {
                Panel1.Visible = true;
                query = @"SELECT * FROM (MemberInfo INNER JOIN MonthlyCostInfo ON MemberInfo.MemberUserName= MonthlyCostInfo.MemberUserName) WHERE MemberInfo.MemberUserName = '" + UserName + "' AND MonthlyCostInfo.Month = '"+currentMonth+"'";
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
                txtMonth.Text= dt.Rows[0]["Month"].ToString();
            }
            catch (Exception) { }
        }
        public void FillExpenseTextboxes(object sender, EventArgs e)
        {
            string userName; string month;
            userName ="subroto.s";
            month = "12-2018";
            Response.Write(month);
            query = @"SELECT * FROM MonthlyCostInfo WHERE MemberUserName = '" + userName + "' AND Month = '" + month + "'";
            dt = dth.GetDatatable(query);
            txtHouseRent.Text = dt.Rows[0]["HouseRent"].ToString();
            txtUtilities.Text = dt.Rows[0]["Utilities"].ToString();
            txtTotalPaid.Text = dt.Rows[0]["TotalPaid"].ToString();
            txtMonth.Text = dt.Rows[0]["Month"].ToString();
        }
        protected void ClearInfo_Click(object sender, EventArgs e)
        {
            clear();
        }

        protected void BackToHome_Click(object sender, EventArgs e)
        {
            clear();
            Panel1.Visible = false;
            Response.Redirect("AdminPortal.aspx");
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("LogIn.aspx");
        }

        protected void btnDeleteMember_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connctstring);
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            SqlCommand sqlCmd = new SqlCommand("DeleteMemberInfo", conn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@MemberUserName", txtUserName.Text.Trim());
            try
            {
                sqlCmd.ExecuteNonQuery();
                query = @"ALTER TABLE DailyMealTracker  DROP COLUMN [" + txtUserName.Text.Trim()+"]" ;
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                SuccessMessaage.Text = "Deleted Successfully";
                clear();
                FillGrid();
            }
            catch (Exception eee)
            {
                SuccessMessaage.Text = "Faild!!!"+eee;
            }
            conn.Close();
        }

        /*<Columns>
                    <asp:BoundField DataField="MemberUserName" HeaderText="Member Name" />
                    <asp:BoundField DataField="HouseRent" HeaderText="House Rent" />
                    <asp:BoundField DataField="Utilities" HeaderText="Utilities" />
                    <asp:BoundField DataField="TotalPaid" HeaderText="Paid" />
                    <asp:BoundField DataField="Due" HeaderText="Due" />
                    <asp:BoundField DataField="MealDeposit" HeaderText="Meal Deposit" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("MemberUserName") %>' OnClick="lnk_OnClick" CausesValidation="False" OnClientClick="lnk_OnClick"> Details </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>*/

        protected void gvEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMembersInfo.PageIndex = e.NewPageIndex;
            FillGrid();
        }

       
    }






















}