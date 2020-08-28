<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_admin.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="hanoitourist_ver02.admin.departure_day.edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1 class="display-4">Cập nhật</h1>
    <form id="form1" runat="server">
        <div class="form-group">
            <asp:Label Text="Chọn tour" runat="server" />
            <asp:DropDownList ID="tourId" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label Text="Ngày khởi hành" runat="server" />
            <asp:TextBox ID="startDay" runat="server" CssClass="form-control" type="date" required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label Text="Giờ khởi hành" runat="server" />
            <asp:TextBox ID="startTime" runat="server" CssClass="form-control" type="time"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Lưu lại" CssClass="btn btn-outline-success" OnClick="Button1_Click" />
        </div>
    </form>
    <a href="index.aspx" class="btn btn-outline-secondary">Quay lại</a>
</asp:Content>
