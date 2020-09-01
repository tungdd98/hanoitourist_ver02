<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_default.Master" AutoEventWireup="true" CodeBehind="tour_detail.aspx.cs" Inherits="hanoitourist_ver02.home.tour_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-9">
                <h2 class="text-uppercase my-30">
                    <asp:Label runat="server" ID="title">
                    </asp:Label>
                </h2>
                <img src="../publics/uploads/banner2.png" class="img-fluid" alt="Responsive image">
                <h3 class="my-20">Thông tin tour:
                </h3>
                <div class="border border-dark mb-5">
                    <div class="row px-3 py-4">
                        <div class="col-6">
                            <p class="font-weight-normal">
                                <i class="fas fa-qrcode pr-2"></i>Mã Tour:
                                <asp:Label runat="server" ID="idTourDetail">
                                </asp:Label>
                            </p>
                            <p class="font-weight-normal">
                                <i class="fas fa-map-marker-alt pr-2"></i>Điểm Khởi Hành:
                                <asp:Label runat="server" ID="startAt">
                                </asp:Label>
                            </p>
                            <p class="font-weight-normal">
                                <i class="fas fa-map-marker-alt pr-2"></i>Điểm Đến: 
                                <asp:Label runat="server" ID="goTo">
                                </asp:Label>
                            </p>
                            <p class="font-weight-normal">
                                <i class="far fa-calendar-alt pr-2"></i>Ngày Khởi Hành:
                                <asp:Label runat="server" ID="dateStart">
                                </asp:Label>
                            </p>
                        </div>
                        <div class="col-6">
                            <p class="font-weight-normal">
                                <i class="far fa-clock pr-2"></i>Thời Gian:
                                <asp:Label runat="server" ID="timeStart">
                                </asp:Label>
                            </p>
                            <p class="font-weight-normal">
                                <i class="fas fa-user-alt pr-2"></i>Phương Tiện:
                                <asp:Label runat="server" ID="vehicle">
                                </asp:Label>
                            </p>
                            <p class="font-weight-normal">
                                <i class="fas fa-user-alt pr-2"></i>Số chỗ trống:
                                <asp:Label runat="server" ID="slots">
                                </asp:Label>
                            </p>
                            <p class="font-weight-normal">
                                <i class="far fa-calendar-alt pr-2"></i>Lịch Trình:<asp:Label runat="server" ID="schedule">
                                </asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="cart">
                </div>
                <nav>
                    <div class="nav nav-tabs bg-primary d-flex justify-content-around p-3" id="nav-tab" role="tablist">
                        <a class="btn btn-light text-primary" id="nav-home-tab" data-toggle="tab" href="#nav-home"
                            role="tab" aria-controls="nav-home" aria-selected="true">Giới Thiệu lịch trình</a>
                        <a class="btn btn-light text-primary" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
                            role="tab" aria-controls="nav-profile" aria-selected="false">Bảng giá chi tiết</a>
                        <a class="btn btn-light text-primary" id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
                            role="tab" aria-controls="nav-contact" aria-selected="false">Điều khoản quy định</a>
                        <a class="btn btn-light text-primary" id="nav-contact-tab1" data-toggle="tab" href="#nav-contact1"
                            role="tab" aria-controls="nav-contact" aria-selected="false">Đánh giá</a>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active px-2 py-4 border border-dark" id="nav-home" role="tabpanel"
                        aria-labelledby="intro">
                        <asp:Label runat="server" ID="detailSchedule">
                        </asp:Label>
                    </div>
                    <div class="tab-pane fade px-2 py-4 border border-dark" id="nav-profile" role="tabpanel"
                        aria-labelledby="price-detail">
                        <div class="product">
                            <asp:ListView runat="server" ID="detailPrice">
                                <ItemTemplate>
                                    <div class="bg-primary text-white d-inline p-2">
                                        Khởi hành ngày : <span><%# Eval("StartDay") %></span>
                                    </div>
                                    <div class="row px-2 py-3">
                                        <div class="col-3 ư">
                                            Giờ khởi hành : <span><%# Eval("StartTime") %></span>
                                        </div>
                                        <div class="col-6">
                                            <asp:ListView runat="server" ID="listPriceDetail" DataSource='<%# Eval("PriceTour") %>'>
                                                <ItemTemplate>
                                                    <div>
                                                        Giá người lớn <span class="text-danger"><%# Eval("Price") %></span>
                                                    </div>
                                                    <div>
                                                        Giá trẻ em <span class="text-danger"><%# Eval("Price") %></span>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:ListView>
                                        </div>
                                        <div class="col-3">
                                            <a href="#" class="btn btn-warning">
                                                <i class="fas fa-shopping-cart text-white"></i>
                                                <b class="text-white">Thêm vào giỏ</b>
                                            </a>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                    <div class="tab-pane fade px-2 py-4 border border-dark" id="nav-contact" role="tabpanel"
                        aria-labelledby="rule">
                        deg
                    </div>
                    <div class="tab-pane fade px-2 py-4 border border-dark" id="nav-contact1" role="tabpanel"
                        aria-labelledby="rating">
                        deg
                    </div>
                </div>
            </div>
            <div class="col-3" style="padding-top: 48px">
                <div class="border border-dark p-3 text-center">
                    <small>Giá Chỉ</small>
                    <br>
                    <b class="text-danger">1500000
                    </b>
                    <br>
                    <br>
                    <a href="#" class="btn btn-warning font-weight-bold text-uppercase text-white py-2"
                        style="width: 100%">Giữ chỗ
                    </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
