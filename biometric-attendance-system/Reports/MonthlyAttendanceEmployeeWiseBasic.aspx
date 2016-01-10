﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="MonthlyAttendanceEmployeeWiseBasic.aspx.cs" Inherits="Reports_MonthlyAttendanceEmployeeWiseBasic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
        <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar>
        <asp:TextBox runat="server" ID="txt_start_date" />
        <asp:TextBox runat="server" ID="txt_end_date" />
    </div>
    <div>
        <asp:TextBox ID="txtEmployeeId" runat="server"></asp:TextBox>
        <asp:DropDownList ID="ddlRelaxation" runat="server">
            <asp:ListItem Value="00:05:00">5 minutes</asp:ListItem>
            <asp:ListItem Value="00:10:00">10 minutes</asp:ListItem>
            <asp:ListItem Value="00:15:00">15 minutes</asp:ListItem>
            <asp:ListItem Value="00:20:00">20 minutes</asp:ListItem>
        </asp:DropDownList>
    </div>
    <asp:Button Text="GetData" OnClick="btn_report_Click" runat="server" />
    <div>
        <asp:Label ID="lblName" runat="server" />
        <asp:GridView runat="server" ID="grid_monthly_attendanceBasic" AutoGenerateColumns="false" EmptyDataText="No Data">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label Text="Date" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Date" runat="server" Text='<%#Eval("Date")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label Text="InTime" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblInTime" runat="server" Text='<%#Eval("InTime")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label Text="OutTime" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblOutTime" runat="server" Text='<%#Eval("OutTime")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label Text="Work Duration" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblWorkDuration" runat="server" Text='<%#Eval("TotalDuration")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label Text="Status" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label Text="Remarks" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblPunchRecords" runat="server" Text='<%#Eval("PunchRecords")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblTotalDuration" runat="server" />
        <asp:Label ID="lblPresentDays" runat="server" />
        <asp:Label ID="lblLeaves" runat="server" />
        <asp:Label ID="lblHolidays" runat="server" />
        <asp:Label ID="lblAbsentDays" runat="server" />
        <asp:Label ID="lblWeeklyOff" runat="server" />
    </div>
</asp:Content>

