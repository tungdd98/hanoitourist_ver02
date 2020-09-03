<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_default.Master" AutoEventWireup="true" CodeBehind="finish.aspx.cs" Inherits="hanoitourist_ver02.home.finish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="bg-white rounded shadow mx-auto flex-center flex-column p-5 m-5 text-center" style="width: 700px">
        <img src="../publics/uploads/email.png" alt="Alternate Text" />
        <h1 class="display-4 text-uppercase my-2">Cám ơn bạn</h1>
        <p>
            Chúng tôi đã nhận được yêu cầu của quý khách <br />
Chúng tôi sẽ liên hệ cho bạn qua Email hoặc số điện thoại trong thời gian sớm nhất !
        </p>
        <asp:HyperLink NavigateUrl="~/home/index.aspx" runat="server" CssClass="btn btn-mid-blue" Text="Trang chủ" />
    </div>
</asp:Content>
