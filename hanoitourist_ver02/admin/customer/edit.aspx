<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_admin.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="hanoitourist_ver02.admin.customer.edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1 class="display-4">Cập nhật</h1>
    <form id="form1" runat="server">
         <div class="form-group">
            <asp:Label Text="Họ Tên" runat="server" />
            <asp:TextBox ID="name" runat="server" CssClass="form-control" type="text" required="true"></asp:TextBox>
        </div>
         <div class="form-group">
            <asp:Label Text="Quốc gia" runat="server" />
            <asp:TextBox ID="nation" runat="server" CssClass="form-control" type="text" required="true"></asp:TextBox>
        </div>
         <div class="form-group">
            <asp:Label Text="Địa chỉ" runat="server" />
            <asp:TextBox ID="address" runat="server" CssClass="form-control" type="text" required="true"></asp:TextBox>
        </div>
         <div class="form-group">
            <asp:Label Text="Số điện thoại" runat="server" />
            <asp:TextBox ID="phone" runat="server" CssClass="form-control" type="text" required="true"></asp:TextBox>
        </div>
         <div class="form-group">
            <asp:Label Text="Email" runat="server" />
            <asp:TextBox ID="email" runat="server" CssClass="form-control" type="text" required="true"></asp:TextBox>
        </div>
         <div class="form-group">
            <asp:Label Text="Nội dung" runat="server" />
            <asp:TextBox ID="content" runat="server" CssClass="form-control" type="text" required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Lưu lại" CssClass="btn btn-outline-success" OnClick="Button1_Click" />
        </div>
    </form>
    <a href="index.aspx" class="btn btn-outline-secondary">Quay lại</a>
</asp:Content>
