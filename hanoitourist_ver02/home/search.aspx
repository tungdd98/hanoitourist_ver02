<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_default.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="hanoitourist_ver02.home.search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <!-- Begin: Breadcrumbs -->
    <nav aria-label="breadcrumb" class="bg-light">
        <div class="container">
            <ol class="breadcrumb bg-light px-0">
                <li class="breadcrumb-item">
                    <asp:HyperLink NavigateUrl="~/home/index.aspx" runat="server" Text="Trang chủ" />
                </li>
                <li class="breadcrumb-item">
                    <asp:Label Text="Tìm kiếm" runat="server" ID="textBreadcrumb" />
                </li>
            </ol>
        </div>
    </nav>
    <!-- End: Breadcrumbs -->

    <div class="container">
        <div class="row">
            <div class="col-3">
                <div class="border shadow rounded py-4 px-2 mb-2">
                    <div class="el-weight-bold text-info font-16 mb-2">BỘ LỌC TÌM KIẾM</div>
                    <div class="el-weight-bold mb-2">Loại tour</div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="all" checked="checked" />
                        <label class="custom-control-label" for="all">Tất cả</label>
                    </div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="sale" />
                        <label class="custom-control-label" for="sale">Tour khuyến mãi</label>
                    </div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="hot" />
                        <label class="custom-control-label" for="hot">Tour nổi bật</label>
                    </div>
                </div>
                <div class="border shadow rounded py-4 px-2 mb-2">
                    <div class="el-weight-bold mb-2">Khoảng giá</div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" class="custom-control-input" checked="checked" id="allPrice" />
                        <label class="custom-control-label" for="allPrice">Tất cả</label>
                    </div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="under3m" />
                        <label class="custom-control-label" for="under3m">Dưới 3 triệu</label>
                    </div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="3m10m" />
                        <label class="custom-control-label" for="3m10m">Từ 3 triệu - 10 triệu</label>
                    </div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="10m25m" />
                        <label class="custom-control-label" for="10m25m">Từ 10 triệu - 25 triệu</label>
                    </div>
                    <div class="custom-control custom-checkbox mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="over25m" />
                        <label class="custom-control-label" for="over25m">Trên 25 triệu</label>
                    </div>
                </div>
                <div class="border shadow rounded py-4 px-2 mb-2">
                    <div class="el-weight-bold text-info font-16">LIÊN HỆ TƯ VẤN</div>
                    <hr />
                    <div class="mb-1">Tổng đài: <strong><a href="tel:19004518" class="text-danger">19004518</a></strong></div>
                    <div class="font-12"><i>Hoặc để lại thông tin Hanoitourist sẽ liên hệ với bạn</i></div>
                </div>
            </div>
            <div class="col-9">
                <div class="font-16 mb-4">
                    Kết quả tìm kiếm tour du lịch
                    <asp:Label ID="departureName" Text="" runat="server" />
                    <asp:Label ID="destinationName" Text="" runat="server" />
                    <asp:Label ID="date" Text="" runat="server" />
                    <asp:Label ID="keySearch" Text="" runat="server" />
                </div>
                <div class="mb-1">
                    <asp:Label Text="" ID="textCountResult" runat="server" /> kết quả
                </div>
                <div class="row no-gutters ">
                    <asp:ListView runat="server" ID="tourSearch">
                        <ItemTemplate>
                            <div class="col-4 p-1">
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
                                                                <div><%# Eval("StartDay", "{0:MM/dd}") %></div>
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
                <% if (tourSearch.Items.Count == 0)
                    { %>
                <div class="text-center">
                    Không có tour nào phù hợp. 
                </div>
                <%}%>
            </div>
        </div>
    </div>
</asp:Content>
