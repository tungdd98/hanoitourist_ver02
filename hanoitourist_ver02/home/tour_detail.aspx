<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_default.Master" AutoEventWireup="true" CodeBehind="tour_detail.aspx.cs" Inherits="hanoitourist_ver02.home.tour_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <!-- Begin: Breadcrumbs -->
    <nav aria-label="breadcrumb" class="bg-light">
        <div class="container">
            <ol class="breadcrumb px-0 bg-light">
                <li class="breadcrumb-item">
                    <asp:HyperLink NavigateUrl="~/home/index.aspx" runat="server" Text="Trang chủ" />
                </li>
                <li class="breadcrumb-item">
                    <asp:Label Text="" runat="server" ID="textBreadcrumb" CssClass="text-uppercase" />
                </li>
            </ol>
        </div>
    </nav>
    <!-- End: Breadcrumbs -->
    <div class="container">
        <div class="row">
            <div class="col-9">
                <h2 class="text-uppercase my-3">
                    <asp:Label runat="server" ID="title" Text="">
                    </asp:Label>
                </h2>
                <asp:Image ImageUrl="" runat="server" ID="thumbnail" CssClass="img-fluid w-100" alt="Ảnh tour" />
                <h4 class="my-3">Thông tin tour:
                </h4>
                <div class="border shadow-sm mb-5">
                    <div class="row px-3 py-4">
                        <div class="col-6">
                            <p class="d-flex align-items-center">
                                <i class="fas fa-qrcode pr-2"></i>
                                Mã Tour:&nbsp;
                                <asp:Label runat="server" ID="idTourDetail" CssClass="font-weight-bold"></asp:Label>
                            </p>
                            <p class="d-flex align-items-center">
                                <i class="fas fa-map-marker-alt pr-2"></i>
                                Điểm Khởi Hành:&nbsp;
                                <asp:Label runat="server" ID="startAt" CssClass="font-weight-bold"></asp:Label>
                            </p>
                            <p class="d-flex align-items-center">
                                <i class="fas fa-map-marker-alt pr-2"></i>
                                Điểm Đến:&nbsp;
                                <asp:Label runat="server" ID="goTo" CssClass="font-weight-bold"></asp:Label>
                            </p>
                            <div class="d-flex">
                                <div class="d-flex align-items-center">
                                    <i class="far fa-calendar-alt pr-2"></i>
                                    <span>Ngày Khởi Hành:&nbsp;</span>
                                </div>
                                <div class="font-weight-bold">
                                    <asp:ListView runat="server" ID="departureDay">
                                        <ItemTemplate>
                                            <span><%# Eval("StartDay", "{0:dd/MM}") %></span>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <p class="d-flex align-items-center">
                                <i class="far fa-clock pr-2"></i>
                                Thời Gian:&nbsp;
                                <asp:Label runat="server" ID="timeStart" CssClass="font-weight-bold"></asp:Label>
                            </p>
                            <p class="d-flex align-items-center">
                                <i class="fas fa-user-alt pr-2"></i>
                                Phương Tiện:&nbsp;
                                <asp:Label runat="server" ID="vehicle" CssClass="font-weight-bold"></asp:Label>
                            </p>
                            <p class="d-flex align-items-center">
                                <i class="fas fa-user-alt pr-2"></i>
                                Số chỗ trống:&nbsp;
                                <asp:Label runat="server" ID="slots" CssClass="font-weight-bold"></asp:Label>
                            </p>
                            <p class="d-flex align-items-center">
                                <i class="far fa-calendar-alt pr-2"></i>
                                Lịch Trình:&nbsp;
                                <asp:Label runat="server" ID="schedule" CssClass="font-weight-bold"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="cart">
                </div>
                <nav>
                    <div class="nav nav-tabs bg-mid-blue d-flex justify-content-around p-3 text-uppercase" id="nav-tab" role="tablist">
                        <a class="btn btn-light text-primary" id="nav-home-tab" data-toggle="tab" href="#nav-home"
                            role="tab" aria-controls="nav-home" aria-selected="false">Giới thiệu lịch trình</a>
                        <a class="btn btn-light text-primary" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
                            role="tab" aria-controls="nav-profile" aria-selected="true">Bảng giá chi tiết</a>
                        <a class="btn btn-light text-primary" id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
                            role="tab" aria-controls="nav-contact" aria-selected="false">Điều khoản quy định</a>
                        <a class="btn btn-light text-primary" id="nav-contact-tab1" data-toggle="tab" href="#nav-contact1"
                            role="tab" aria-controls="nav-contact" aria-selected="false">Đánh giá</a>
                    </div>
                </nav>
                <div class="tab-content border border-top-0 mb-5" id="nav-tabContent">
                    <div class="tab-pane fade px-3 py-4" id="nav-home" role="tabpanel"
                        aria-labelledby="intro">
                        <asp:Label runat="server" ID="description">
                        </asp:Label>
                    </div>
                    <div class="tab-pane show active fade px-3 py-4 el-scroll" id="nav-profile" role="tabpanel"
                        aria-labelledby="price-detail" style="max-height: 500px; overflow-y: auto">
                        <asp:ListView runat="server" ID="detailPrice">
                            <ItemTemplate>
                                <div class="mb-2">
                                    <div class="bg-primary text-white p-2 d-inline-block">
                                        Khởi hành ngày: <span><%# Eval("StartDay", "{0:dd/MM/yyyy}") %></span>
                                    </div>
                                    <div class="container-fluid">
                                        <div class="row px-2 py-3 bg-light">
                                            <div class="col-3">
                                                Giờ khởi hành: <span><%# Eval("StartTime") %></span>
                                            </div>
                                            <div class="col-6">
                                                <asp:ListView runat="server" DataSource='<%# Eval("PriceTour") %>'>
                                                    <ItemTemplate>
                                                        <div>
                                                            Giá <%# Eval("CustomerName")%>: <span class="text-danger"><%# Eval("Price", "{0:n0}") %>đ</span>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </div>
                                            <div class="col-3">
                                                <asp:LinkButton Text="text" runat="server" CssClass="btn btn-mid-orange font-14" PostBackUrl='<%# "~/home/checkout.aspx?id=" + Eval("TourId") + "&dayId=" + Eval("Id") + "&action=add" %>'>
                                                <i class="fas fa-shopping-cart text-white"></i>
                                                <span class="text-white">Thêm vào giỏ</span>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                    <div class="tab-pane fade px-3 py-4" id="nav-contact" role="tabpanel"
                        aria-labelledby="rule">
                        <asp:Label runat="server" ID="content">
                        </asp:Label>
                    </div>
                    <div class="tab-pane fade px-3 py-4" id="nav-contact1" role="tabpanel"
                        aria-labelledby="rating">
                        Đang cập nhật...
                    </div>
                </div>
            </div>
            <div class="col-3 py-4 mt-5">
                <div class="border shadow p-3 text-center">
                    <div>Giá chỉ</div>
                    <div class="font-20 text-danger my-3">
                        <strong>
                            <asp:Label Text="" ID="price" runat="server" />đ</strong>
                    </div>
                    <asp:HyperLink NavigateUrl="" runat="server" Text="Giữ chỗ" CssClass="btn btn-sm el-weight-bold text-capitalize btn-mid-orange text-white mt-2 px-3" ID="btnKeep" />
                    <a href="tel:19004518" class="btn btn-outline-mid-blue w-100 d-flex my-3 flex-column">
                        <span class="text-uppercase">đăng ký tư vấn</span>
                        <small class="text-dark">Hotline: 19004518</small>
                    </a>
                </div>
                <div class="border shadow p-3 mt-4">
                    <div class="text-center text-uppercase font-weight-bold pb-3">Mọi thắc mắc xin vui lòng liên hệ</div>
                    <div>Hotline: 19004518</div>
                    <div>Email: sales@hanoitourist.vn</div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
