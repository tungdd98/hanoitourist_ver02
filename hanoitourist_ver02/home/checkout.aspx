<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_default.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="hanoitourist_ver02.home.checkout" %>

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
                    <asp:Label Text="Giỏ hàng" runat="server" ID="textBreadcrumb" />
                </li>
            </ol>
        </div>
    </nav>
    <!-- End: Breadcrumbs -->
    <div class="container">
        <div class="row my-4">
            <div class="col-9">
                <div class="border shadow-sm p-3 rounded">
                    <h3>CHI TIẾT GIỎ HÀNG</h3>
                    <hr />
                    <%if (cartList.Items.Count > 0)
                        { %>
                    <asp:ListView runat="server" ID="cartList">
                        <ItemTemplate>
                            <div class="border shadow-sm rounded  overflow-hidden position-relative mb-3">
                                <div class="position-absolute" style="top: 10px; right: 10px;">
                                    <asp:HyperLink NavigateUrl='<%# "~/home/checkout.aspx?id=" + Eval("TourId") + "&action=delete" %>' runat="server" Text="X" CssClass="font-18 el-weight-bold text-danger" />
                                </div>
                                <div class="d-flex bg-gray-2 p-2">
                                    <img src="../publics/uploads/tours/<%# Eval("Thumbnail") %>" alt='<%# Eval("Title") %>' width="130" height="130" style="object-fit: cover;" />
                                    <div class="px-3">
                                        <div class="text-uppercase el-weight-bold mb-2">
                                            <span>(tour)</span>
                                            <span class="font-18"><%# Eval("Title") %></span>
                                        </div>
                                        <div class="mb-1">
                                            <span>Điểm khởi hành: </span>
                                            <span class="el-weight-bold"><%# Eval("DepartureName") %></span>
                                        </div>
                                        <div class="mb-1">
                                            <span>Phương tiện: </span>
                                            <span class="el-weight-bold"><%# Eval("VehicleName") %></span>
                                        </div>
                                        <div class="mb-1">
                                            <span>Số chỗ trống: </span>
                                            <span class="el-weight-bold"><%# Eval("Place") %></span>
                                        </div>
                                        <div class="mb-1">
                                            <span>Thời gian: </span>
                                            <span class="el-weight-bold"><%# Eval("TimeName") %></span>
                                        </div>
                                    </div>
                                </div>
                                <asp:ListView runat="server" DataSource='<%# Eval("CartDepartureDays") %>' ID="cartListDays">
                                    <ItemTemplate>
                                        <div class="d-flex justify-content-between p-2 font-12 align-items-center border-bottom">
                                            <div class="d-flex flex-column pr-4">
                                                <span>Khởi hành: <%# Eval("StartTime") %></span>
                                                <span>Ngày <%# Eval("StartDay", "{0:MM/dd/yyyy}") %></span>
                                            </div>
                                            <div class="flex-grow-1 border-right border-left px-4">
                                                <asp:ListView runat="server" DataSource='<%# Eval("CartPrices") %>' ID="cartListPrices">
                                                    <ItemTemplate>
                                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                                            <span>Giá trọn gói <%# Eval("CustomerName") %>: 
                                                                <span class="text-danger"><%# Eval("Price", "{0:n0}") %>đ</span>
                                                            </span>
                                                            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" CssClass="form-control form-control-sm" Style="width: 50px" Text='<%# Eval("Quantity") %>' min="0" />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:ListView>
                                            </div>
                                            <div class="d-flex flex-column text-right pl-4 w-25">
                                                <span>Thành tiền</span>
                                                <span class="text-danger el-weight-bold font-16"><%# Eval("Total", "{0:n0}") %>đ</span>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="d-flex justify-content-end mt-3">
                        <asp:HyperLink NavigateUrl="~/home/checkout.aspx?action=destroy" runat="server" Text="Xoá giỏ hàng" CssClass="btn btn-danger" />
                        <asp:Button Text="Cập nhật giỏ hàng" runat="server" CssClass="btn btn-mid-blue ml-2" OnClick="btnUpdate_Click" ID="btnUpdate" />
                    </div>
                    <%}
                        else
                        { %>
                    <div class="text-center">
                        <div class="mb-3">Giỏ hàng của bạn đang trống.</div>
                        <asp:HyperLink NavigateUrl="~/home/index.aspx" runat="server" Text="Tiếp tục đặt tour" CssClass="btn btn-outline-mid-blue" />
                    </div>
                    <%} %>
                </div>
                <%if (cartList.Items.Count > 0)
                    { %>
                <div class="d-flex justify-content-end mt-3">
                    <asp:HyperLink NavigateUrl="~/home/confirm.aspx" runat="server" CssClass="btn btn-outline-mid-blue" Text="Tiến hành thanh toán" />
                </div>
                <%} %>
            </div>
            <div class="col-3">
                <div class="border shadow rounded sticky-top" style="top: 80px">
                    <div class="text-white bg-mid-blue px-3 py-2 font-16">GIỎ HÀNG CỦA BẠN</div>
                    <asp:ListView runat="server" ID="myCartList">
                        <ItemTemplate>
                            <div class="p-3 border-bottom">
                                <div class="text-uppercase font-16 text-truncate font-weight-bold mb-1"><%# Eval("Title") %></div>
                                <div class="d-flex align-items-center mb-2">
                                    <img
                                        src="../publics/uploads/qrcode.png"
                                        alt=""
                                        height="14" class="pr-2" />
                                    <div>
                                        Mã tour: <strong><%# Eval("TourId") %></strong>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <img
                                        src="../publics/uploads/location.png"
                                        alt=""
                                        height="14" class="pr-2" />
                                    <div>
                                        Điểm khởi hành: <strong><%# Eval("DepartureName") %></strong>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <img
                                        src="../publics/uploads/clock (1).png"
                                        alt=""
                                        height="14" class="pr-2" />
                                    <div>
                                        Thời gian: <strong><%# Eval("TimeName") %></strong>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <img
                                        src="../publics/uploads/traveler.png"
                                        alt=""
                                        height="14" class="pr-2" />
                                    <div>
                                        Phương tiện: <strong><%# Eval("VehicleName") %></strong>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>

                    <div class="p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div><strong>Tổng tiền: </strong></div>
                            <div>
                                <strong class="text-danger font-16 el-weight-bold">
                                    <asp:Label Text="" ID="lbTotalMoney" runat="server" />đ</strong>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
