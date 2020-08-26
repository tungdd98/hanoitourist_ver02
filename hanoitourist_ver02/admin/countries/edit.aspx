<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_admin.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="hanoitourist_ver02.admin.countries.edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1 class="display-4">Cập nhật</h1>
    <form id="form1" runat="server">
        <div class="form-group">
            <asp:Label Text="Tên khu vực" runat="server" />
            <asp:TextBox ID="title" runat="server" CssClass="form-control" type="text" required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label Text="Lãnh thổ" runat="server" />
            <asp:DropDownList ID="isNation" runat="server" CssClass="form-control">
                <asp:ListItem Value="0">Trong nước</asp:ListItem>
                <asp:ListItem Value="1">Ngoài nước</asp:ListItem>
            </asp:DropDownList>
        </div>
         <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Lưu lại" CssClass="btn btn-outline-success" OnClick="Button1_Click"/>
        </div>
    </form>
    <a href="index.aspx" class="btn btn-outline-secondary">Quay lại</a>
</asp:Content>
