<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_admin.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="hanoitourist_ver02.admin.tours.edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1 class="display-4">Cập nhật</h1>
    <form id="form1" runat="server">
        <div class="form-group">
            <asp:Label Text="Tên tour" runat="server" />
            <asp:TextBox ID="title" runat="server" CssClass="form-control" type="text" required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label Text="Chọn điểm khởi hành" runat="server" />
            <asp:DropDownList ID="departureLocationId" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label Text="Chọn điểm đến" runat="server" />
            <asp:DropDownList ID="destinationLocationId" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label Text="Chọn thời gian" runat="server" />
            <asp:DropDownList ID="timeId" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label Text="Chọn phương tiện" runat="server" />
            <asp:DropDownList ID="vehicleId" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:Label Text="Mô tả ngắn" runat="server" />
            <asp:TextBox ID="description" runat="server" CssClass="form-control" TextMode="multiline" Columns="50" Rows="5"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label Text="Nội dung" runat="server" />
            <asp:TextBox ID="content" runat="server" CssClass="form-control" TextMode="multiline" Columns="50" Rows="5"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label Text="Số chỗ trống" runat="server" />
            <asp:TextBox ID="place" runat="server" CssClass="form-control" type="number" required="true"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label Text="Lịch trình" runat="server" />
            <asp:TextBox ID="schedule" runat="server" CssClass="form-control" TextMode="multiline" Columns="50" Rows="5"></asp:TextBox>
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
