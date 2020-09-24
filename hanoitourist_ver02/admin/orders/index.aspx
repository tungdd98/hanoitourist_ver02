<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="hanoitourist_ver02.admin.orders.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <form id="form1" runat="server">
        <h1>Quản lý đơn hàng</h1>
        <div class="custom-table">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" CssClass="table table-bordered" OnPageIndexChanging="OnPageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="Mã đơn hàng">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tình trạng">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Status").ToString() == "0" ? "Chưa xác nhận" : Eval("Status").ToString() == "1" ? "Đã thanh toán" : Eval("Status").ToString() == "2" ? "Đã đặt cọc" : Eval("Status").ToString() == "3" ? "Đã hoàn thành" : "Đã huỷ tour"  %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ngày tạo">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("CreateAt", "{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tổng tiền">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Total", "{0:n0}") %>'></asp:Label>đ
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Loại hình thanh toán">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("TypePayment").ToString() == "0" ? "Đặt cọc 20%" : "Thanh toán toàn bộ" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phương thức thanh toán">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("MethodPayment").ToString() == "0" ? "Tại nhà" : "Trực tiếp tại công ty" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <div class="d-flex justify-content-center">
                                <asp:Button Text="Xem chi tiết" runat="server" CssClass="btn btn-outline-success btn-sm mx-1" PostBackUrl='<%# "~/admin/orders/view.aspx?id=" + Eval("Id") %>' />
                                <asp:Button Text="Cập nhật" runat="server" CssClass="btn btn-outline-warning btn-sm" PostBackUrl='<%# "~/admin/orders/edit.aspx?id=" + Eval("Id") %>' />
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
