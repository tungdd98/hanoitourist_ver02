<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="hanoitourist_ver02.admin.time.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>TimeTour</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <script>
        let params = new URLSearchParams(window.location.search);
        let status = params.get('status');
        if (status) {
            switch (status) {
                case "add-success":
                    swAlert("Thêm mới thành công!!")
                    break;
                case "update-success":
                    swAlert("Cập nhật thành công!!")
                    break;
                case "delete-success":
                    swAlert("Xoá thành công!!")
                    break;
            }
        }
    </script>
    <form id="form1" runat="server">
        <h1>Quản lý thời gian</h1>
        <div class="d-flex justify-content-end mb-2">
            <asp:Button Text="Thêm mới" runat="server" CssClass="btn btn-outline-primary" PostBackUrl="~/admin/time/create.aspx" />
        </div>
        <div class="custom-table">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="2" AutoGenerateColumns="False" CssClass="table table-bordered" OnPageIndexChanging="OnPageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="Mã thời gian">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Thời gian">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <div class="d-flex justify-content-center">
                                <asp:Button Text="Xoá" runat="server" CssClass="btn btn-outline-danger btn-sm mx-1" PostBackUrl='<%# "~/admin/time/delete.aspx?id=" + Eval("Id") %>' />
                                <asp:Button Text="Sửa" runat="server" CssClass="btn btn-outline-warning btn-sm" PostBackUrl='<%# "~/admin/time/edit.aspx?id=" + Eval("Id") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="14px" Wrap="True" />
            </asp:GridView>
        </div>
    </form>
</asp:Content>
