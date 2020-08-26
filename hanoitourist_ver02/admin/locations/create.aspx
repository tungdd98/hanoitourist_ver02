<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_admin.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="hanoitourist_ver02.admin.locations.create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1 class="display-4">Thêm mới</h1>
    <form id="form1" runat="server">
        <div class="form-group">
            <asp:Label Text="Tên địa điểm" runat="server" />
            <asp:TextBox ID="title" runat="server" CssClass="form-control" type="text" required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label Text="Thuộc khu vực" runat="server" />
            <asp:DropDownList ID="countryId" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label Text="Mô tả ngắn" runat="server" />
            <asp:TextBox ID="description" runat="server" CssClass="form-control" TextMode="multiline" Columns="50" Rows="5"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label Text="Là điểm khởi hành" runat="server" />
            <asp:DropDownList ID="isStart" runat="server" CssClass="form-control">
                <asp:ListItem Selected="True" Value="0">Không</asp:ListItem>
                <asp:ListItem Value="1">Có</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label Text="Ảnh đại diện" runat="server" />
            <asp:FileUpload ID="thumbnail" runat="server" CssClass="form-control-file" />
        </div>
        <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Lưu lại" CssClass="btn btn-outline-success" OnClick="Button1_Click" />
        </div>
    </form>
    <a href="index.aspx" class="btn btn-outline-secondary">Quay lại</a>
</asp:Content>
