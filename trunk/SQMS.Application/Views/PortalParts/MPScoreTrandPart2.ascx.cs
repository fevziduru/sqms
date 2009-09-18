using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SQMS.Application.Views.PortalParts
{
        public partial class MPScoreTrandPart2 : System.Web.UI.UserControl
        {
                protected void Page_Load(object sender, EventArgs e)
                {
                        this.WeekChart.DataSource = MakeWeekChart();
                        this.WeekChart.DataBind();

                        this.MonthChart.DataSource = MakeMonthChart();
                        this.MonthChart.DataBind();

                        this.YearChart.DataSource = MakeYearChart();
                        this.YearChart.DataBind();
                }

                private DataTable MakeWeekChart()
                {
                        DataTable dt = new DataTable("Data");
                        dt.Columns.Add("Default");
                        dt.Columns.Add("星期一");
                        dt.Columns.Add("星期二");
                        dt.Columns.Add("星期三");
                        dt.Columns.Add("星期四");
                        dt.Columns.Add("星期五");
                        dt.Columns.Add("星期六");
                        dt.Columns.Add("星期七");

                        for (int i = 1; i <= 7; i++)
                        {                                
                                dt.Columns[i].DataType = typeof(double);
                        }

                        Random rand = new Random(100);

                        for (int i = 1; i <= 5; i++)
                        {
                                DataRow row = dt.NewRow();
                                row["Default"] = "监控点"+i.ToString();
                                row["星期一"] = rand.Next(50,120);
                                row["星期二"] = rand.Next(50, 120);
                                row["星期三"] = rand.Next(50, 120);
                                row["星期四"] = rand.Next(50, 120);
                                row["星期五"] = rand.Next(50, 120);
                                row["星期六"] = rand.Next(50, 120);
                                row["星期七"] = rand.Next(50, 120);

                                dt.Rows.Add(row);
                        }

                        return dt;
                }

                private DataTable MakeMonthChart()
                {
                        DataTable dt = new DataTable("Data");
                        dt.Columns.Add("Default");
                        for (int i = 1; i <= 30; i++)
                        {
                                dt.Columns.Add(i.ToString());
                                dt.Columns[i].DataType = typeof(double);
                        }

                        Random rand = new Random(100);

                        for (int i = 1; i <= 5; i++)
                        {
                                DataRow row = dt.NewRow();
                                row["Default"] = "监控点" + i.ToString();
                                for (int j = 1; j <= 30; j++)
                                {
                                        row[j.ToString()] = rand.Next(50, 150);
                                }

                                dt.Rows.Add(row);
                        }

                        return dt;
                }

                private DataTable MakeYearChart()
                {
                        DataTable dt = new DataTable("Data");
                        dt.Columns.Add("Default");
                        for (int i = 1; i <= 12; i++)
                        {
                                dt.Columns.Add(i.ToString()+"月");
                                dt.Columns[i].DataType = typeof(double);
                        }

                        Random rand = new Random(100);

                        for (int i = 1; i <= 5; i++)
                        {
                                DataRow row = dt.NewRow();
                                row["Default"] = "监控点" + i.ToString();
                                for (int j = 1; j <= 12; j++)
                                {
                                        row[j.ToString() + "月"] = rand.Next(50, 150);
                                }

                                dt.Rows.Add(row);
                        }

                        return dt;
                }
        }
}