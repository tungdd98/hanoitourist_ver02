﻿<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_default.Master" AutoEventWireup="true" CodeBehind="confirm.aspx.cs" Inherits="hanoitourist_ver02.home.confirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <nav aria-label="breadcrumb" class="bg-light">
        <div class="container">
            <ol class="breadcrumb px-0 bg-light">
                <li class="breadcrumb-item">
                    <asp:HyperLink NavigateUrl="~/home/index.aspx" runat="server" Text="Trang chủ" />
                </li>
                <li class="breadcrumb-item">
                    <asp:Label Text="Xác nhận thanh toán" runat="server" ID="textBreadcrumb" />
                </li>
            </ol>
        </div>
    </nav>
    <!-- End: Breadcrumbs -->
    <div class="container">
        <div class="row my-4">
            <div class="col-9">
                <div class="border shadow-sm p-3 rounded">
                    <% if (Session["Email"] == null)
                        { %>
                    <div class="border-bottom mb-4">
                        <h5>THÔNG TIN LIÊN HỆ</h5>
                        <p class="font-italic">Thông tin có dấu (*) là bắt buộc phải nhập. Xin quý khách vui lòng kiểm tra kỹ thông tin email, điện thoại để tránh bị sai sót.</p>
                        <div style="width: 600px">
                            <div class="form-group row">
                                <label for="" class="col-sm-3 col-form-label">Họ và tên <i class="text-danger">(*)</i></label>
                                <div class="col-sm-9">
                                    <asp:TextBox required="true" runat="server" ID="name" CssClass="form-control form-control-sm" placeholder="Vui lòng nhập họ tên" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" class="col-sm-3 col-form-label">Quốc gia</label>
                                <div class="col-sm-9">
                                    <asp:TextBox runat="server" ID="nation" CssClass="form-control form-control-sm" placeholder="Vui lòng nhập quốc gia" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" class="col-sm-3 col-form-label">Địa chỉ <i class="text-danger">(*)</i></label>
                                <div class="col-sm-9">
                                    <asp:TextBox required="true" runat="server" ID="address" CssClass="form-control form-control-sm" placeholder="Vui lòng nhập địa chỉ" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" class="col-sm-3 col-form-label">Số điện thoại</label>
                                <div class="col-sm-9">
                                    <asp:TextBox TextMode="Phone" runat="server" ID="phone" CssClass="form-control form-control-sm" placeholder="Vui lòng nhập số điện thoại" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" class="col-sm-3 col-form-label">Email <i class="text-danger">(*)</i></label>
                                <div class="col-sm-9">
                                    <asp:TextBox required="true" TextMode="Email" runat="server" ID="email" CssClass="form-control form-control-sm" placeholder="Vui lòng nhập email" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" class="col-sm-3 col-form-label">Nội dung</label>
                                <div class="col-sm-9">
                                    <asp:TextBox runat="server" ID="content" CssClass="form-control form-control-sm" placeholder="Vui lòng nhập nội dung yêu cầu" TextMode="multiline" Columns="50" Rows="5" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <%} %>
                    <div class="border-bottom mb-4">
                        <h5>LOẠI HÌNH THANH TOÁN</h5>
                        <div class="el-custom-checkbox row mb-2">
                            <div class="offset-3">
                                <asp:RadioButton ID="rdoType1" Text="Thanh toán toàn bộ (100% giá trị tour)" runat="server" Checked="true" GroupName="typeCheckout" />
                            </div>
                        </div>
                        <div class="el-custom-checkbox row mb-2">
                            <div class="offset-3">
                                <asp:RadioButton ID="rdoType0" Text="Đặt cọc trước (20% giá trị tour)" runat="server" GroupName="typeCheckout" />
                            </div>
                        </div>
                    </div>
                    <div class="border-bottom mb-4">
                        <h5>PHƯƠNG THỨC THANH TOÁN</h5>
                        <div class="el-custom-checkbox row mb-2">
                            <div class="offset-3">
                                <asp:RadioButton ID="rdoMethod1" Text="Thanh toán tại nhà" runat="server" Checked="true" GroupName="locationCheckout" />
                            </div>
                        </div>
                        <div class="el-custom-checkbox row mb-2">
                            <div class="offset-3">
                                <asp:RadioButton ID="rdoMethod0" Text="Thanh toán trực tiếp tại Hanoitourist" runat="server" GroupName="locationCheckout" />
                            </div>
                        </div>
                    </div>
                    <p><i>* Khi Quý khách nhấn nút "Hoàn thành đặt tour" cũng đồng nghĩa là Quý khách đã đồng ý với các điều khoản và điều kiện về đặt dịch vụ trên website của Hanoitourist</i></p>
                    <div class="flex-center my-3">
                        <asp:Button ID="btnCheckOut" Text="THANH TOÁN" runat="server" CssClass="btn btn-mid-blue" OnClick="btnCheckOut_Click" />
                    </div>
                </div>
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
