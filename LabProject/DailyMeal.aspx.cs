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
    public partial class DailyMeal : System.Web.UI.Page
    {
        string connctstring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        string currentMonth= DateTime.Now.ToString("MM-yyyy");
        String query;   
        DataHandling dth = new DataHandling();
        DataTable dt = new DataTable();

        public object TableFooterCell { get; private set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            currentMonth = txtMonth.Text.ToString();
            var id = Request.QueryString["id"];
            FillGrid();
            if (id == "2")
            {
                gvDailyMeal.FooterRow.Visible = false;
                gvDailyMeal.Columns[0].Visible = false;
                Calculate.Visible = false;
            }
            else
            {
            }
        }
        void FillGrid()
        {
            query = @"SELECT * FROM DailyMealTracker where SUBSTRING(Date,  4, 7)='" + currentMonth + "' ORDER BY Date ASC ";
            dt = dth.GetDatatable(query);
            if (dt.Rows.Count == 0)
            {
                
                dt.Rows.Add();
            }
            gvDailyMeal.DataSource = dt;
            gvDailyMeal.DataBind();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        }
        int getNumOfMembers()
        {
            query = @"Select Count(*) From INFORMATION_SCHEMA.COLUMNS Where TABLE_NAME='DailyMealTracker'";
            dt = dth.GetDatatable(query);
            int numOfColumn = Convert.ToInt32(dt.Rows[0][0].ToString());//count number of rows
            return numOfColumn-1;
        }
        int getNumOfDays()
        {
            query = @"select count(*) from dbo.DailyMealTracker where SUBSTRING(Date,  4, 7)='" + currentMonth + "'";
            dt = dth.GetDatatable(query);
            int numOfDays = Convert.ToInt32(dt.Rows[0][0].ToString());//count number of rows
            return numOfDays;
        }
        protected void gvDailyMeal_DataBound(object sender, EventArgs e)
        {
        }
        void SaveMeal_Click(object sender, EventArgs e)
        { 
            
        }
        protected void gvDailyMeal_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            
            string script = string.Empty; 
            e.Row.Cells[0].Width = Unit.Pixel(80);
            e.Row.Cells[1].Width = Unit.Pixel(170);
            for (int i = 2; i <= getNumOfMembers() + 1; i++)
            {
                e.Row.Cells[i].Width = Unit.Pixel(100);

            }
                if (e.Row.RowType == DataControlRowType.Footer)
                {
                    int numOfDays = getNumOfDays();
                    int numOfColumn = getNumOfMembers();
                    Button btn = new Button();
                    btn.ID = "btnMealSave";
                    btn.Click += btnMealSave_Click;
                    btn.Text = "Save";
                    btn.CssClass = "button";
                    btn.Style.Add("margin-left", "10px");
                    btn.Width = Unit.Pixel(85);
                    e.Row.Cells[0].Controls.Add(btn);
                    TextBox txtdate = new TextBox();
                    txtdate.ID = "txt0";
                    //txtdate.Style["text-align"] = "center";
                    //txtdate.CssClass = "date";   // class date
                    txtdate.Text = "Pick a Date:";
                    txtdate.Style.Add("margin-right", "3px");
                    txtdate.Style.Add("margin-left", "4px");
                    txtdate.Width = Unit.Pixel(100);
                txtdate.CssClass = "datepicker";
                    e.Row.Cells[1].Controls.Add(txtdate);
                
                for (int i = 1; i <= getNumOfMembers(); i++)
                    {
                        TextBox txtBox = new TextBox();
                        txtBox.ID = "txt" + i;
                        txtBox.Width = Unit.Pixel(100);
                        e.Row.Cells[i + 1].Controls.Add(txtBox);
                    }
                }
        }
        protected void gvDailyMeal_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDailyMeal.EditIndex = e.NewEditIndex;
        }

        protected void gvDailyMeal_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
        }
        public string[] getColumnNames()
        {
            query = @"SELECT * FROM DailyMealTracker"; 
            dt = dth.GetDatatable(query);
            string[] result = new string[dt.Columns.Count];
            int i = 0;
            foreach (DataColumn c in dt.Columns) { 
                result[i] = c.ColumnName.ToString();
                i++;
            }  
            return result;
        }
        protected void gvDailyMeal_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDailyMeal.EditIndex = -1;
            FillGrid();
        }
        //Method for Creating Dynamic TextBoxes
        protected void btnMealSave_Click(object sender, EventArgs e)
        {
            // int nu = Convert.ToInt32(ViewState["addedBooks"]);
            String[] txtMeals = new String[getNumOfMembers()+1];
            int i;
            for (i = 0; i <= getNumOfMembers(); i++)
            {
                String txtId = "txt" + i;// Produce id of Dynamically created TextBoxes
                TextBox txtUserName = (gvDailyMeal.FooterRow.FindControl(txtId) as TextBox);
            if (txtUserName != null)
                {
                    txtMeals[i] = txtUserName.Text.ToString();
                }
                Response.Write(txtMeals[i] + " ");
            }
            string[] columns = getColumnNames();
            query = @"SELECT * From DailyMealTracker Where " + columns[0] + "='" + txtMeals[0] + "'";
            dt = dth.GetDatatable(query);
            int a = dt.Rows.Count;
            if (a == 0)
            {
                query = @"INSERT INTO DailyMealTracker(" + columns[0] + ") VALUES('" + (txtMeals[0].ToString()) + "')";
                dth.executequery(query);
            }
            for (i = 1; i <= getNumOfMembers(); i++) {
                Response.Write(a+" " + columns[i]);
                    query = @"Update DailyMealTracker set [" + columns[i] + "] = '" + Convert.ToInt32(txtMeals[i].ToString()) + "'" + "WHERE [" + columns[0] + "]='" + txtMeals[0] + "'";
                    dth.executequery(query);
            }
            FillGrid();
        }
        
        protected void Calculate_Click(object sender, EventArgs e)
        {
            int totalExpense = 0   ;
            
            query = @"SELECT SUM(Expenditure) from DailyExpenses where SUBSTRING(Date,  4, 7)='" + currentMonth + "'";
            dt = dth.GetDatatable(query);
            try
            {
                totalExpense = Convert.ToInt32(dt.Rows[0][0].ToString());
            }
            catch 
            {
                 totalExpense = 0;
            }
            string[] memberNames = getColumnNames();
            int grandTotalMeal = 0;
            int MealCharge;
            int[] MealDiposit = new int[getNumOfMembers()];
            int[] totalMeal = new int[getNumOfMembers()];
            int[] MealBill = new int[getNumOfMembers()];
            int[] Due = new int[getNumOfMembers()];
            for (int i = 1; i < getNumOfMembers()+1;i++) {
                //query = @"SELECT SUM([" + memberNames[i] + "]) from  DailyMealTracker where SUBSTRING(DailyMealTracker.Date,  4, 7)='" + currentMonth + "'";
                //dt = dth.GetDatatable(query);
                int sumOfEachPersonMeal = 0;
                for (int j = 0; j < gvDailyMeal.Rows.Count; ++j)
                {
                    try
                    {
                        sumOfEachPersonMeal += Convert.ToInt32(gvDailyMeal.Rows[j].Cells[i + 1].Text);
                    }
                    catch
                    {
                        sumOfEachPersonMeal += 0;
                    }
                }
                
               totalMeal[i - 1] = sumOfEachPersonMeal;
                grandTotalMeal = grandTotalMeal + totalMeal[i - 1];
                query = @"SELECT MealDeposit FROM MonthlyCostInfo WHERE MemberUserName = '" + memberNames[i] + "' AND Month= '" + currentMonth + "'";
                dt = dth.GetDatatable(query);
                try
                {
                    MealDiposit[i - 1] = Convert.ToInt32(dt.Rows[0][0].ToString());
                }
                catch(Exception )
                {
                    MealDiposit[i - 1] = 0;  
                }
            }
            Response.Write(grandTotalMeal+"  aaa  " + totalExpense);
            MealCharge = (totalExpense / grandTotalMeal);
            for(int i=0; i < getNumOfMembers(); i++)//get Due and meaalbill 
            {
                MealBill[i] = (totalMeal[i] * MealCharge);
                Due[i] = (MealDiposit[i] - MealBill[i]);
            }
            for(int i = 1; i < getNumOfMembers()+1; i++)
            {
                query = @"Update MonthlyCostInfo set [TotalMeal] = '" + (totalMeal[i-1]) + "', [TotalCharge] ='" + (MealBill[i - 1]) + "', [Due] ='" + (Due[i - 1]) + "' WHERE [MemberUserName]='" + memberNames[i] + "'AND Month= '" + currentMonth + "'";
                dth.executequery(query);
            }
            query = @"INSERT INTO MonthlyGrandExpense Values('" + currentMonth + "'," + totalExpense + "," + grandTotalMeal + ")";
            dth.executequery(query);
            if (dth.executequery(query) == false)
            {
                query = @"UPDATE MonthlyGrandExpense SET TotalExpense=" + totalExpense + ", TotalMeal=" + grandTotalMeal +" WHERE Month='"+ currentMonth+"'" ;
                dth.executequery(query);
               
            }
            else
            Response.Redirect("MonthlyReport.aspx");
        }

        protected void gvDailyMeal_Sorting(object sender, GridViewSortEventArgs e)
        {
            gvDailyMeal.DataBind();
        }
        protected void btnViewMealDetails_Click(object sender, EventArgs e)
        {
            currentMonth = txtMonth.Text.ToString();
            FillGrid();
            if (currentMonth != DateTime.Now.ToString("MM-yyyy"))
            {
                gvDailyMeal.FooterRow.Visible = false;
                gvDailyMeal.Columns[0].Visible = false;
            }
            else
            {
                gvDailyMeal.FooterRow.Visible = true;
            }
        }
    }
}