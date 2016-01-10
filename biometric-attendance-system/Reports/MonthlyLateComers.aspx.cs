﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports_MonthlyLateComers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindDropDowns();
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txt_startDate.Text = Calendar1.SelectedDate.Date.ToString("d");
    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        txt_endDate.Text = Calendar2.SelectedDate.Date.ToString("d");
    }

    protected void btn_report_Click(object sender, EventArgs e)
    {
        ManageReports objManageReports = new ManageReports();
        TimeSpan relaxationTime = new TimeSpan();
        relaxationTime = TimeSpan.Parse(ddlRelaxation.SelectedValue.ToString());
        var data = objManageReports.GetDataForMonthlyLateReport(Convert.ToInt32(ddlDepartments.SelectedValue.ToString()), Calendar1.SelectedDate.Date, Calendar2.SelectedDate.Date, relaxationTime);
        grid_lateComers.DataSource = data;
        grid_lateComers.DataBind();
    }
    protected void BindDropDowns()
    {
        MasterEntries objMasterEntries = new MasterEntries();
        ddlDepartments.DataSource = objMasterEntries.GetAllDepartments();
        ddlDepartments.DataTextField = "Name";
        ddlDepartments.DataValueField = "Id";
        ddlDepartments.DataBind();
    }
}