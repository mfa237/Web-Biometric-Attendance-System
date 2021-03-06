﻿<%@ Page Title="Assgin Leave to Emp" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeFile="AssignLeaveToEmployee.aspx.cs" Inherits="Admin_AssignLeaveToEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://code.jquery.com/jquery-2.2.3.min.js" integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo=" crossorigin="anonymous"></script>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css" />
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
    <title>DailyAttendanceBasicReport</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server" />

    <div class="col s12 breadcrumb">
        <br />
        <a href="../Admin/ManageMasterEntries.aspx" class="grey-text">Home &nbsp;&nbsp;></a>
        <a href="../Admin/AssignLeave.aspx" class="grey-text">Assign Leave &nbsp;&nbsp;></a>
        <a href="#!" class="teal-text">&nbsp;&nbsp;Assign Leave To Employee &nbsp;&nbsp;</a>
    </div>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col s8 m4 l4 offset-s2 offset-m1 offset-l1 card">
                    <br />
                    <asp:DropDownList ID="ddlLeaves" runat="server" AppendDataBoundItems="true" CssClass="dropdown-button btn l2 m2 s2">
                        <asp:ListItem Value="0" Text="--Select Leave--" />
                    </asp:DropDownList><br />
                    <br />
                    <div class="col s8 m4 l4 offset-l4 offset-m4">
                        <br />
                        <br />
                       End Date
                        <asp:TextBox runat="server" ID="txtDate" class="datepicker" />
                        <asp:RequiredFieldValidator SetFocusOnError="true" ErrorMessage="&nbsp;Required" ControlToValidate="txtDate" CssClass="col s12" ForeColor="Red" runat="server" />
                        <script>
                            $('.datepicker').pickadate({
                                selectMonths: true, // Creates a dropdown to control month
                                selectYears: 15 // Creates a dropdown of 15 years to control year
                            });

                        </script>
                    </div>
                     <div class="col s8 m4 l4 offset-l4 offset-m4">
                        <br />
                        <br />
                       Start Date
                        <asp:TextBox runat="server" ID="txtEndDate" class="datepicker" />
                        <asp:RequiredFieldValidator SetFocusOnError="true" ErrorMessage="&nbsp;Required" ControlToValidate="txtEndDate" CssClass="col s12" ForeColor="Red" runat="server" />
                        <script>
                            $('.datepicker').pickadate({
                                selectMonths: true, // Creates a dropdown to control month
                                selectYears: 15 // Creates a dropdown of 15 years to control year
                            });

                        </script>
                    </div>
                    <asp:Button ID="btnAssignLeave" Text="Assign Leave" CssClass="btn" runat="server" OnClick="btnAssignLeave_Click" />
                    <br />
                    <br />
                </div>
                <div class="col s8 m4 l4 offset-s2 offset-m2 offset-l2">
                    Employee Name:&nbsp;<asp:Label ID="lblName" CssClass="input-field" runat="server"></asp:Label>
                    <asp:GridView ID="gvViewEmployeeOnLeaveForDate" AutoGenerateColumns="false" CssClass="responsive-table striped card z-depth-2" runat="server" EmptyDataText="No Leave">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblRole" Text="Employee Id" runat="server" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRole" runat="server" Text='<%#Eval("EmployeeId")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblLeave" Text="Leave" runat="server" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblLeave" runat="server" Text='<%#Eval("LeaveName")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblNoOfLeaves" Text="Date" runat="server" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblNoOfLeaves" runat="server" Text='<%#Eval("Date", "{0:d}")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" Text="Delete" CommandArgument='<%#Eval("leaveId")%>' runat="server" OnClick="lnkDelete_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

