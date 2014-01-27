﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListView.aspx.cs" Inherits="WingtipToys.DataBindingTests.ListView" %>
<%@ Register assembly="WingtipToys" namespace="WingtipToys.DataBindingTests" tagprefix="wtp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server" Text="some text" />
        <asp:Button ID="Button1" runat="server" Text="Search" />
        <h2>DataSource Control</h2>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1">
            <LayoutTemplate>
                <ul>
                    <li runat="server" id="itemPlaceholder" />
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li><%# Eval("Id") %></li>
            </ItemTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetItems" TypeName="WingtipToys.DataBindingTests.ListView">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="filter" />
                <asp:QueryStringParameter QueryStringField="sort" Name="order" />
                <wtp:CustomParameter Name="custom" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ListView ID="ListView2" runat="server" SelectMethod="GetItems">
            <LayoutTemplate>
                <ul>
                    <li runat="server" id="itemPlaceholder" />
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li><%# Eval("Id") %></li>
            </ItemTemplate>
        </asp:ListView>
        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource">
            <LayoutTemplate>
                <ul>
                    <li runat="server" id="itemPlaceholder" />
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li><%# Eval("ProductName") %></li>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:WingtipToys%>" selectcommand="SELECT * FROM Products WHERE ProductName = @Name">
            <SelectParameters>
                <asp:QueryStringParameter name="Name" QueryStringField="Name" DefaultValue="paper boat"/>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
