﻿<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="hanoitourist_ver02.admin.vehicle.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>VehicleTour</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <form id="form1" runat="server">
        <h1>Quản lý loại phương tiện</h1>
        <div class="d-flex justify-content-end mb-2">
            <asp:Button Text="Thêm mới" runat="server" CssClass="btn btn-outline-primary" PostBackUrl="~/admin/vehicle/create.aspx" />
        </div>
        <div class="custom-table">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" CssClass="table table-bordered" OnPageIndexChanging="OnPageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="Mã phương tiện">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên phương tiện">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <div class="d-flex justify-content-center">
                                <asp:Button Text="Xoá" runat="server" CssClass="btn btn-outline-danger btn-sm mx-1" PostBackUrl='<%# "~/admin/vehicle/delete.aspx?id=" + Eval("Id") %>' />
                                <asp:Button Text="Sửa" runat="server" CssClass="btn btn-outline-warning btn-sm" PostBackUrl='<%# "~/admin/vehicle/edit.aspx?id=" + Eval("Id") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="14px" Wrap="True" />
            </asp:GridView>
            <%if (GridView1.Rows.Count == 0)
                { %>
            <div class="text-center">Không có dữ liệu</div>
            <%} %>
        </div>
    </form>
</asp:Content>
