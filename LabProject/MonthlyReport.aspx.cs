using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabProject
{
    public partial class MonthlyReport : System.Web.UI.Page
    {
        String query,month= DateTime.Now.ToString("MM-yyyy");
        DataHandling dth = new DataHandling();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(month);
            FillGrid(month);
        }
        protected void FillGrid( string month)
        {
            query = @"SELECT * FROM [dbo].[MonthlyCostInfo] where Month = '"+ month+"'";
            dt = dth.GetDatatable(query);
            gvMembersInfo.DataSource = dt;
            gvMembersInfo.DataBind();
            query = @"SELECT * FROM [dbo].[MonthlyGrandExpense] where Month = '" + month + "'"; 
            dt = dth.GetDatatable(query);
            gvMonthlyExpense.DataSource = dt;
            gvMonthlyExpense.DataBind();
        }
        protected void gvEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMembersInfo.PageIndex = e.NewPageIndex;
            FillGrid(month);
        }
        protected void btnViewReport_Click(object sender, EventArgs e)
        {
            month = startDate.Value;

            FillGrid(month);
        }
    }
}