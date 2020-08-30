<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_default.Master" AutoEventWireup="true" CodeBehind="tour.aspx.cs" Inherits="hanoitourist_ver02.home.tour" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <!-- Begin: Breadcrumbs -->
    <nav aria-label="breadcrumb" class="bg-light">
        <div class="container">
            <ol class="breadcrumb bg-white px-0">
                <li class="breadcrumb-item">
                    <asp:HyperLink NavigateUrl="~/home/index.aspx" runat="server" Text="Trang chủ" />
                </li>
                <li class="breadcrumb-item">
                    <asp:Label Text="" runat="server" ID="textBreadcrumb" />
                </li>
            </ol>
        </div>
    </nav>
    <!-- End: Breadcrumbs -->

    <div class="container">
        <h3 class="text-uppercase">
            <asp:Label Text="" runat="server" ID="title" /></h3>
        <div>
            <asp:Label Text="" runat="server" ID="description" />
        </div>
        <div class="my-4 d-flex align-items-center justify-content-between">
            <h4>Danh sách tour</h4>
            <div>
                <span>Sắp xếp theo</span>
                <asp:Button Text="Giá tăng dần" runat="server" CssClass="btn btn-outline-mid-blue mx-2" ID="buttonDesc" OnClick="buttonDesc_Click" />
                <asp:Button Text="Giá giảm dần" runat="server" CssClass="btn btn-outline-mid-blue mx-2" ID="buttonAsc" OnClick="buttonAsc_Click" />
            </div>
        </div>
    </div>
    <div class="my-4 container-fluid">
        <div class="row no-gutters ">
            <asp:ListView runat="server" ID="tourList">
                <ItemTemplate>
                    <div class="col-2 p-1">
                        <div class="border rounded el-hot-tour h-100 d-flex flex-column">
                            <div
                                class="position-relative el-hot-tour__image">
                                <img src="../publics/uploads/tours/<%# Eval("Thumbnail") %>" alt="" />
                                <div
                                    class="d-flex px-3 pb-2 w-100 justify-content-between text-white position-absolute"
                                    style="bottom: 10px;">
                                    <div class="d-flex align-items-center">
                                        <img
                                            src="../publics/uploads/clock.png"
                                            alt=""
                                            height="14" />
                                        <span class="mx-1"><%# Eval("TimeName") %></span>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <img
                                            src="../publics/uploads/slot.png"
                                            alt=""
                                            height="14" />
                                        <span class="mx-1"><%# Eval("Place") %> chỗ</span>
                                    </div>
                                </div>
                                <div
                                    visible='<%# (float)Eval("Sale") > 0 %>'
                                    runat="server"
                                    class="position-absolute"
                                    style="top: 0; right: 10px;">
                                    <img src="../publics/uploads/group.png" alt="" />
                                    <div
                                        class="text-white absolute-center el-weight-bold text-center"
                                        style="line-height: 1.1; margin-top: -5px;">
                                        <div class="font-12">SALE</div>
                                        <div class="font-20"><%# Eval("Sale", "{0:n0}") %>%</div>
                                    </div>
                                </div>
                            </div>
                            <div class="p-3 flex-grow-1 d-flex flex-column justify-content-between">
                                <a
                                    href="#"
                                    class="text-uppercase text-dark el-weight-bold text-truncate d-block">
                                    <%# Eval("Title") %>
                                </a>
                                <div
                                    class="d-flex justify-content-between align-items-center py-2">
                                    <div class="font-13">
                                        <div class="mb-1">
                                            <img
                                                src="../publics/uploads/traveler.png"
                                                alt=""
                                                height="14" />
                                            <span><%# Eval("VehicleName") %></span>
                                        </div>
                                        <div class="d-flex">
                                            <img
                                                class="mt-1"
                                                src="../publics/uploads/date.png"
                                                alt=""
                                                height="14" />
                                            <div class="ml-1">
                                                <asp:ListView runat="server" DataSource='<%# Eval("DepartureDay") %>'>
                                                    <ItemTemplate>
                                                        <div><%# Eval("StartDay", "{0:MMM d}") %></div>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <div>Giá từ</div>
                                        <div
                                            class="el-weight-bold text-danger">
                                            <%# Eval("Price", "{0:n0}") %>đ
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-end">
                                    <button
                                        class="btn btn-sm el-weight-bold text-capitalize btn-mid-orange text-white mt-2 px-3">
                                        Giữ chỗ
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <% if (tourList.Items.Count == 0)
            { %>
        <div class="text-center">
            Không có tour nào phù hợp. 
        </div>
        <%}%>
    </div>

</asp:Content>
