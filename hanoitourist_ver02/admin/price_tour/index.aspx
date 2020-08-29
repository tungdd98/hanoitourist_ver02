<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="hanoitourist_ver02.admin.price_tour.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>PriceTour</title>
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
        <h1>Quản lý giá tour</h1>
        <div class="d-flex justify-content-end mb-2">
            <asp:Button Text="Thêm mới" runat="server" CssClass="btn btn-outline-primary" PostBackUrl="~/admin/price_tour/create.aspx" />
        </div>
        <div class="custom-table">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="2" AutoGenerateColumns="False" CssClass="table table-bordered" OnPageIndexChanging="OnPageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="Tên tour">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TourTitle") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Loại khách hàng">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("CustomerTypeName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Giá ban đầu">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("OriginalPrice", "{0:n}") %>'></asp:Label> VNĐ
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Giá bán ra">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Price", "{0:n0}") %>'></asp:Label> VNĐ
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <div class="d-flex justify-content-center">
                                <asp:Button Text="Xoá" runat="server" CssClass="btn btn-outline-danger btn-sm mx-1" PostBackUrl='<%# "~/admin/price_tour/delete.aspx?customerTypeId=" + Eval("CustomerTypeId") + "&tourId=" + Eval("TourId") %>' />
                                <asp:Button Text="Sửa" runat="server" CssClass="btn btn-outline-warning btn-sm" PostBackUrl='<%# "~/admin/price_tour/edit.aspx?customerTypeId=" + Eval("CustomerTypeId") + "&tourId=" + Eval("TourId") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="14px" Wrap="True" />
            </asp:GridView>
        </div>
    </form>
</asp:Content>
