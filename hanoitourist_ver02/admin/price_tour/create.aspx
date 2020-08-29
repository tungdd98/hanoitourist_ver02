<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_admin.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="hanoitourist_ver02.admin.price_tour.create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1 class="display-4">Thêm mới</h1>
    <form id="form1" runat="server">
        <div class="form-group">
            <asp:Label Text="Chọn loại khách hàng" runat="server" />
            <asp:DropDownList ID="customerTypeId" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label Text="Chọn tour" runat="server" />
            <asp:DropDownList ID="tourId" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label Text="Giá ban đầu" runat="server" />
            <asp:TextBox ID="originalPrice" runat="server" CssClass="form-control" type="text" required="true" pattern="[0-9]*" value="0"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label Text="Giá bán ra" runat="server" />
            <asp:TextBox ID="price" runat="server" CssClass="form-control" type="text" required="true" pattern="[0-9]*"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Lưu lại" CssClass="btn btn-outline-success" OnClick="Button1_Click" />
        </div>
    </form>
    <a href="index.aspx" class="btn btn-outline-secondary">Quay lại</a>
</asp:Content>
