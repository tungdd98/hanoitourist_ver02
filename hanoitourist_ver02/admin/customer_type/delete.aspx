<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_admin.Master" AutoEventWireup="true" CodeBehind="delete.aspx.cs" Inherits="hanoitourist_ver02.admin.customer_type.delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1 class="display-4">Xoá</h1>
    <p>Bạn có chắc chắn muốn xoá?</p>
    <form id="form1" runat="server">
        <div class="my-2">
            <asp:Button ID="Button1" runat="server" Text="Xác nhận" CssClass="btn btn-outline-danger" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Quay lại" CssClass="btn btn-outline-secondary" PostBackUrl="~/admin/customer_type/index.aspx" />
        </div>
    </form>
</asp:Content>
