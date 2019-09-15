using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace LabProject
{
    public partial class DailyExpenses : System.Web.UI.Page
    {
        string currentMonth = DateTime.Now.ToString("MM-yyyy");
        DataHandling dth = new DataHandling();
        DataTable dt = new DataTable();
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridview();            }
        }

        void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM DailyExpenses  where SUBSTRING(Date,  4, 7)='"+currentMonth+"'", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvDailyExpenses.DataSource = dtbl;
                gvDailyExpenses.DataBind();
                SqlConnection sqlCon = new SqlConnection(connectionString);
                SqlDataAdapter sqlDa1 = new SqlDataAdapter("select MemberName from[dbo].[MemberInfo]", sqlCon);
                DataSet ds = new DataSet();
                sqlDa1.Fill(ds);
                DropDownList ddl = gvDailyExpenses.FooterRow.FindControl("txtMemberUserNameFooter") as DropDownList;
                ddl.DataSource = ds.Tables[0];
                ddl.DataTextField = "MemberName";
                ddl.DataValueField = "MemberName";
                ddl.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvDailyExpenses.DataSource = dtbl;
                gvDailyExpenses.DataBind();
                gvDailyExpenses.Rows[0].Cells.Clear();
                gvDailyExpenses.Rows[0].Cells.Add(new TableCell());
                gvDailyExpenses.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvDailyExpenses.Rows[0].Cells[0].Text = "No Data Found ..!";
                gvDailyExpenses.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void gvDailyExpenses_RowCommand(object sender, GridViewCommandEventArgs e)
        { 
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO DailyExpenses (Date,MemberUserName,Description,Expenditure) VALUES (@Date,@MemberUserName,@Description,@Expenditure)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Date", (gvDailyExpenses.FooterRow.FindControl("txtDateFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@MemberUserName", (gvDailyExpenses.FooterRow.FindControl("txtMemberUserNameFooter") as DropDownList ).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Description", (gvDailyExpenses.FooterRow.FindControl("txtDescriptionFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Expenditure", (gvDailyExpenses.FooterRow.FindControl("txtExpenditureFooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        PopulateGridview();
                        lblSuccessMessage.Text = "New Record Added";
                        lblErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void gvDailyExpenses_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDailyExpenses.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void gvDailyExpenses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDailyExpenses.EditIndex = -1;
            PopulateGridview();
        }

        protected void gvDailyExpenses_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE DailyExpenses SET Date=@Date,MemberUserName=@MemberUserName,Description=@Description,Expenditure=@Expenditure WHERE ExpenseID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Date", (gvDailyExpenses.Rows[e.RowIndex].FindControl("txtDate") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@MemberUserName", (gvDailyExpenses.Rows[e.RowIndex].FindControl("txtMemberUserName") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Description", (gvDailyExpenses.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Expenditure", (gvDailyExpenses.Rows[e.RowIndex].FindControl("txtExpenditure") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvDailyExpenses.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    gvDailyExpenses.EditIndex = -1;
                    PopulateGridview();
                    lblSuccessMessage.Text = "Updated Successfully";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void gvDailyExpenses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM DailyExpenses WHERE ExpenseID = @id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gvDailyExpenses.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridview();
                    lblSuccessMessage.Text = "Deleted Successfully";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }
        protected void btnViewExpenseDetails_Click(object sender, EventArgs e)
        {
           
            currentMonth = txtMonth.Value.ToString();
            PopulateGridview();
            currentMonth = DateTime.Now.ToString("MM-yyyy");
            if (txtMonth.Value.ToString() != currentMonth)
            {
                gvDailyExpenses.Columns[4].Visible = false;
            }
            else
            {
                gvDailyExpenses.Columns[4].Visible = true;
            }
            lblSuccessMessage.Text = "";
        }
    }
}