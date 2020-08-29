<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_default.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="hanoitourist_ver02.home.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <!-- Begin: Slide -->
    <div
        id="carouselExampleControls"
        class="carousel slide position-relative"
        data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img
                    src="../publics/uploads/slide1.png"
                    class="d-block w-100"
                    alt="..." />
            </div>
            <div class="carousel-item">
                <img
                    src="../publics/uploads/slide1.png"
                    class="d-block w-100"
                    alt="..." />
            </div>
            <div class="carousel-item">
                <img
                    src="../publics/uploads/slide1.png"
                    class="d-block w-100"
                    alt="..." />
            </div>
        </div>
        <a
            class="carousel-control-prev"
            href="#carouselExampleControls"
            role="button"
            data-slide="prev">
            <span
                class="carousel-control-prev-icon"
                aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a
            class="carousel-control-next"
            href="#carouselExampleControls"
            role="button"
            data-slide="next">
            <span
                class="carousel-control-next-icon"
                aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
        <!-- Begin: Search -->
        <div class="position-absolute w-100" style="bottom: 10px;">
            <div class="pb-20">
                <div class="container bg-white p-20 rounded">
                    <div
                        class="text-uppercase text-primary el-weight-bold border-bottom d-inline-block"
                        style="border-color: #ff9300 !important;">
                        Tìm kiếm tour
                    </div>
                    <div class="d-flex align-items-center">
                        <div class="form-check mr-4">
                            <input
                                class="form-check-input"
                                type="radio"
                                name="exampleRadios"
                                id="exampleRadios"
                                value="option1"
                                checked />
                            <label
                                class="form-check-label text-capitalize"
                                for="exampleRadios">
                                Tour trong nước
                            </label>
                        </div>
                        <div class="form-check">
                            <input
                                class="form-check-input"
                                type="radio"
                                name="exampleRadios"
                                id="exampleRadios1"
                                value="option1"
                                checked />
                            <label
                                class="form-check-label text-capitalize"
                                for="exampleRadios1">
                                tour nước ngoài
                            </label>
                        </div>
                        <div
                            class="ml-auto overflow-hidden rounded d-flex border align-items-center">
                            <input
                                type="text"
                                class="form-control font-14 border-0"
                                placeholder="Tìm nhanh..." />
                            <div class="py-2 px-3 border bg-gray-1">
                                <i class="fas fa-search"></i>
                            </div>
                        </div>
                    </div>
                    <div class="mt-3 el-search">
                        <div class="row no-gutters">
                            <div class="col">
                                <asp:DropDownList ID="dropDiemXuatPhat" runat="server" CssClass="form-control rounded-0 border-right-0 font-14" AppendDataBoundItems="true">
                                    <Items>
                                        <asp:ListItem Text="Điểm khởi hành" Value="" />
                                    </Items>
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <asp:DropDownList ID="dropDiemDen" runat="server" CssClass="form-control rounded-0 border-right-0 font-14" AppendDataBoundItems="true">
                                    <Items>
                                        <asp:ListItem Text="Bạn muốn đi đâu?" Value="" />
                                    </Items>
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <asp:DropDownList ID="dropTime" runat="server" CssClass="form-control rounded-0 border-right-0 font-14" AppendDataBoundItems="true">
                                    <Items>
                                        <asp:ListItem Text="Lịch trình" Value="" />
                                    </Items>
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <input
                                    type="text"
                                    id="datepicker"
                                    class="form-control font-14 rounded-0 border-right-0"
                                    placeholder="Ngày khởi hành" />
                            </div>
                            <div class="col">
                                <asp:DropDownList ID="dropPrice" runat="server" CssClass="form-control rounded-0 border-right-0 font-14" AppendDataBoundItems="true">
                                    <asp:ListItem Text="Khoảng giá" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Nhỏ hơn 3 triệu" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Từ 3 triệu - 10 triệu" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Từ 10 triệu - 25 triệu" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Trên 25 triệu" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <button
                                    class="btn btn-warning text-white w-100 el-weight-bold text-uppercase rounded-0 font-14">
                                    <i class="fas fa-search"></i>
                                    <span>Tìm kiếm</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End: Search -->
    </div>
    <!-- End: Slide -->

    <!-- Begin: Dịch vụ -->
    <div class="text-center pb-4 bg-gray-2">
        <div class="container">
            <h4 class="text-uppercase py-60">dịch vụ của chúng tôi</h4>
            <div class="row no-gutters">
                <div class="col-3 px-1">
                    <div class="border p-3 bg-white">
                        <img
                            src="../publics/uploads/logo.png"
                            alt=""
                            height="40" />
                        <div class="el-weight-bold py-2 font-16">
                            DU LỊCH M.I.C.E
                        </div>
                        <p style="min-height: 140px;">
                            MICE - du lịch nghỉ dưỡng kết hợp hội nghị
                                    hội thảo cùng Hanoitourist - đơn vị tiên
                                    phong trong việc tổ chức du lịch MICE chuyên
                                    nghiệp với đội ngũ nhân viên nhiệt tình,
                                    giàu kinh nghiệm,
                        </p>
                        <a href="#" class="font-italic">Xem thêm</a>
                    </div>
                </div>
                <div class="col-3 px-1">
                    <div class="border p-3 bg-white">
                        <img
                            src="../publics/uploads/icon7.png"
                            alt=""
                            height="40" />
                        <div class="el-weight-bold py-2 font-16">
                            THUÊ XE
                        </div>
                        <p style="min-height: 140px;">
                            Hanoitourist cung cấp và mang đến cho quý
                                    khách dịch vụ cho thuê xe du lịch, xe dịch
                                    vụ với giá cực tốt, xe đời mới 16 chỗ; 29
                                    chỗ; 35 chỗ; 45 chỗ …
                        </p>
                        <a href="#" class="font-italic">Xem thêm</a>
                    </div>
                </div>
                <div class="col-3 px-1">
                    <div class="border p-3 bg-white">
                        <img
                            src="../publics/uploads/icon8.png"
                            alt=""
                            height="40" />
                        <div class="el-weight-bold py-2 font-16">
                            VÉ MÁY BAY
                        </div>
                        <p style="min-height: 140px;">
                            Liên hệ ngay phòng vé máy bay Hanoitourist
                                    và đặt ngay các vé máy bay giá rẻ trực tuyến
                                    đơn giản, an toàn, tiết kiệm ngay tại
                                    Website Hanoitourist
                        </p>
                        <a href="#" class="font-italic">Xem thêm</a>
                    </div>
                </div>
                <div class="col-3 px-1">
                    <div class="border p-3 bg-white">
                        <img
                            src="../publics/uploads/icon11.png"
                            alt=""
                            height="40" />
                        <div class="el-weight-bold py-2 font-16">
                            DU THUYỀN
                        </div>
                        <p style="min-height: 140px;">
                            Trải nghiệm du lịch đường thủy với các du
                                    thuyền nghỉ dưỡng đầy mê hoặc. Truy cập ngay
                                    và lựa chọn hành trình phù hợp cho gia đình
                                    bạn.
                        </p>
                        <a href="#" class="font-italic">Xem thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End: Dịch vụ -->

    <!-- Begin: Hot tour -->
    <div class="py-4">
        <div
            class="container d-flex justify-content-between align-items-center pb-4">
            <h4 class="el-title">hot tour
            </h4>
            <ul role="tablist" class="nav nav-tabs">
                <li class="nav-item" role="presentation">
                    <a class="btn btn-outline-mid-blue px-4 mx-1 active" id="hot_khuyenmai-tab" data-toggle="tab" href="#hot_khuyenmai" role="tab" aria-controls="hot_khuyenmai" aria-selected="true">Tour khuyến mại
                    </a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="btn btn-outline-mid-blue px-4 mx-1" id="hot_giochot-tab" data-toggle="tab" href="#hot_giochot" role="tab" aria-controls="hot_giochot" aria-selected="false">Tour giờ chót
                    </a>
                </li>
            </ul>
        </div>
        <div class="tab-content container-fluid">
            <div class="tab-pane fade show active" id="hot_khuyenmai" role="tabpanel" aria-labelledby="home-tab">
                <div class="row no-gutters ">
                    <asp:ListView runat="server" ID="tourHotKhuyenMai">
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
                <% if (tourHotKhuyenMai.Items.Count > 0)
                    { %>
                <div class="d-flex justify-content-center mt-4">
                    <button class="btn btn-outline-mid-blue px-5">
                        Xem thêm
                    </button>
                </div>
                <%}
                    else
                    {%>
                <div class="text-center">
                    Không có tour nào phù hợp. 
                </div>
                <%} %>
            </div>
            <div class="tab-pane" id="hot_giochot" role="tabpanel" aria-labelledby="profile-tab">
                Đang cập nhật...
            </div>
        </div>
    </div>
    <!-- End: Hot tour -->

    <!-- Begin: Tour trong nước -->
    <div class="py-4">
        <div class="container">
            <h4 class="el-title">tour trong nước
            </h4>
            <p class="el-subtitle">điểm đến nổi bật</p>
            <p>
                Để không ngừng đáp ứng nhu cầu tham quan, nghỉ dưỡng,
                        khảo sát, tham dự hội chợ, triển lãm, hội thảo, giao lưu
                        và hợp tác ngày càng cao của Quý khách, với phương châm
                        “Tất cả vì sự hài lòng của khách hàng”, chúng tôi xin
                        trân trọng giới thiệu tới Quý khách các chương trình
                        “Việt Nam - Đất nước muôn màu”. Hy vọng rằng, đây sẽ là
                        những thông tin bổ ích và thiết thực về các sản phẩm du
                        lịch tiêu biểu và hấp dẫn đến hấu hết các địa danh du
                        lịch nổi tiếng của dải đất hình chữ S tươi đẹp mà công
                        ty chúng tôi đã và đang thực hiện rất thành công...
            </p>
        </div>
        <div class="container-fluid">
            <div class="tour-inside">
                <asp:ListView runat="server" ID="locationNation">
                    <ItemTemplate>
                        <asp:HyperLink NavigateUrl='<%# "~/home/tour.aspx?id=" + Eval("Id") %>' runat="server" CssClass="px-1 overflow-hidden position-relative">
                            <img
                                src="../publics/uploads/locations/<%# Eval("Thumbnail") %>"
                                alt=""
                                class="img-fluid rounded" />
                            <div class="absolute-center">
                                <span
                                    class="text-white el-weight-bold text-uppercase el-text-shadow"><%# Eval("Title") %></span>
                            </div>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <%
                if (locationNation.Items.Count > 0)
                {
            %>
            <div class="text-center pt-4">
                <a href="#">
                    <span>Xem tất cả các điểm</span>
                    <i class="fas fa-arrow-right"></i>
                </a>
            </div>
            <%} %>
        </div>
    </div>
    <!-- End: Tour trong nước -->

    <!-- Begin: Tour trong nước/Nổi bật -->
    <div class="py-4">
        <div
            class="container d-flex justify-content-between align-items-center pb-4">
            <p class="el-subtitle">
                TOUR NỔI BẬT
            </p>
            <ul role="tablist" class="nav nav-tabs">
                <li class="nav-item" role="presentation">
                    <a class="btn btn-outline-mid-blue px-4 mx-1 active" id="tourtheodiemden-tab" data-toggle="tab" href="#tourtheodiemden" role="tab" aria-controls="tourtheodiemden" aria-selected="true">Tour theo điểm đến
                    </a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="btn btn-outline-mid-blue px-4 mx-1" id="tourtheodip-tab" data-toggle="tab" href="#tourtheodip" role="tab" aria-controls="tourtheodip" aria-selected="true">Tour theo dịp
                    </a>
                </li>
            </ul>
        </div>
        <div class="tab-content container-fluid">
            <div class="tab-pane fade show active" id="tourtheodiemden" role="tabpanel" aria-labelledby="tourtheodiemden-tab">
                <div class="row no-gutters ">
                    <asp:ListView runat="server" ID="tourTheoDiemDenTrongNuoc">
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
                <% if (tourTheoDiemDenTrongNuoc.Items.Count > 0)
                    { %>
                <div class="d-flex justify-content-center mt-4">
                    <button class="btn btn-outline-mid-blue px-5">
                        Xem thêm
                    </button>
                </div>
                <%}
                    else
                    {%>
                <div class="text-center">
                    Không có tour nào phù hợp. 
                </div>
                <%} %>
            </div>
            <div class="tab-pane" id="tourtheodip" role="tabpanel" aria-labelledby="tourtheodip-tab">
                Đang cập nhật...
            </div>
        </div>
    </div>
    <!-- End: Tour trong nước/Nổi bật -->

    <!-- Begin: Tour nước ngoài -->
    <div class="py-4">
        <div class="container">
            <h4 class="el-title">tour nước ngoài
            </h4>
            <p class="el-subtitle">điểm đến nổi bật</p>
            <p>
                Trong xu thế hội nhập, để không ngừng đáp ứng nhu cầu
                        ngày càng cao của Quý khách, với phương châm “Tất cả vì
                        sự hài lòng của khách hàng”, chúng tôi xin trân trọng
                        giới thiệu tới Quý khách các chương trình “Vòng quanh
                        Thế giới”. Hy vọng rằng, đây sẽ là những thông tin bổ
                        ích và thiết thực về các sản phẩm du lịch tiêu biểu và
                        hấp dẫn đến hấu hết các quốc gia trên thế giới mà công
                        ty chúng tôi đã và đang thực hiện rất thành công...
            </p>
        </div>
        <div class="container-fluid">
            <div class="tour-inside">
                <asp:ListView runat="server" ID="locationEnterNation">
                    <ItemTemplate>
                        <asp:HyperLink NavigateUrl='<%# "~/home/tour.aspx?id=" + Eval("Id") %>' runat="server" CssClass="px-1 overflow-hidden position-relative">
                            <img
                                src="../publics/uploads/locations/<%# Eval("Thumbnail") %>"
                                alt=""
                                class="img-fluid rounded" />
                            <div class="absolute-center">
                                <span
                                    class="text-white el-weight-bold text-uppercase el-text-shadow"><%# Eval("Title") %></span>
                            </div>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <%
                if (locationEnterNation.Items.Count > 0)
                {
            %>
            <div class="text-center pt-4">
                <a href="#">
                    <span>Xem tất cả các điểm</span>
                    <i class="fas fa-arrow-right"></i>
                </a>
            </div>
            <%} %>
        </div>
    </div>
    <!-- End: Tour nước ngoài -->

    <!-- Begin: Tour nước ngoài/Nổi bật -->
    <div class="py-4">
        <div
            class="container d-flex justify-content-between align-items-center pb-4">
            <p class="el-subtitle">
                TOUR NỔI BẬT
            </p>
            <ul role="tablist" class="nav nav-tabs">
                <li class="nav-item" role="presentation">
                    <a class="btn btn-outline-mid-blue px-4 mx-1 active" id="tourtheodiemden2-tab" data-toggle="tab" href="#tourtheodiemden2" role="tab" aria-controls="tourtheodiemden2" aria-selected="true">Tour theo điểm đến
                    </a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="btn btn-outline-mid-blue px-4 mx-1" id="tourtheodip2-tab" data-toggle="tab" href="#tourtheodip2" role="tab" aria-controls="tourtheodip2" aria-selected="true">Tour theo dịp
                    </a>
                </li>
            </ul>
        </div>
        <div class="tab-content container-fluid">
            <div class="tab-pane fade show active" id="tourtheodiemden2" role="tabpanel" aria-labelledby="tourtheodiemden2-tab">
                <div class="row no-gutters ">
                    <asp:ListView runat="server" ID="tourTheoDiemDenNgoaiNuoc">
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
                <% if (tourTheoDiemDenNgoaiNuoc.Items.Count > 0)
                    { %>
                <div class="d-flex justify-content-center mt-4">
                    <button class="btn btn-outline-mid-blue px-5">
                        Xem thêm
                    </button>
                </div>
                <%}
                    else
                    {%>
                <div class="text-center">
                    Không có tour nào phù hợp. 
                </div>
                <%} %>
            </div>
            <div class="tab-pane" id="tourtheodip2" role="tabpanel" aria-labelledby="tourtheodip2-tab">
                Đang cập nhật...
            </div>
        </div>
    </div>
    <!-- End: Tour nước ngoài/Nổi bật -->

    <!-- Begin: Combo -->
    <div class="py-4">
        <div
            class="container d-flex justify-content-between align-items-center pb-4">
            <h4 class="el-title">combo
            </h4>
            <div>
                <button class="btn btn-mid-blue px-4 mx-1">
                    Combo
                </button>
                <button class="btn btn-outline-mid-blue px-4 mx-1">
                    Voucher
                </button>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row no-gutters">
                <div class="col-4 p-1">
                    <div class="border rounded el-hot-tour">
                        <div
                            class="position-relative el-hot-tour__image el-hot-tour__image--scale">
                            <img src="../publics/uploads/combo1.png" alt="" />
                        </div>
                        <div class="p-3">
                            <a
                                href="#"
                                class="text-uppercase text-dark el-weight-bold">ĐÊM THIÊNG LIÊNG - SÁNG NGỜI TINH THẦN
                                        VIỆT
                            </a>
                            <div
                                class="d-flex justify-content-between align-items-center py-2">
                                <div class="font-13">
                                    <div class="mb-1">
                                        <img
                                            src="../publics/uploads/traveler.png"
                                            alt=""
                                            height="14" />
                                        <span>Tự túc</span>
                                    </div>
                                    <div>
                                        <img
                                            src="../publics/uploads/date.png"
                                            alt=""
                                            height="14" />
                                        <span>21/8 - 22/8</span>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <div>Giá từ</div>
                                    <div
                                        class="el-weight-bold text-danger">
                                        150,000đ
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
                <div class="col-4 p-1">
                    <div class="border rounded el-hot-tour">
                        <div
                            class="position-relative el-hot-tour__image el-hot-tour__image--scale">
                            <img src="../publics/uploads/combo1.png" alt="" />
                        </div>
                        <div class="p-3">
                            <a
                                href="#"
                                class="text-uppercase text-dark el-weight-bold">ĐÊM THIÊNG LIÊNG - SÁNG NGỜI TINH THẦN
                                        VIỆT
                            </a>
                            <div
                                class="d-flex justify-content-between align-items-center py-2">
                                <div class="font-13">
                                    <div class="mb-1">
                                        <img
                                            src="../publics/uploads/traveler.png"
                                            alt=""
                                            height="14" />
                                        <span>Tự túc</span>
                                    </div>
                                    <div>
                                        <img
                                            src="../publics/uploads/date.png"
                                            alt=""
                                            height="14" />
                                        <span>21/8 - 22/8</span>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <div>Giá từ</div>
                                    <div
                                        class="el-weight-bold text-danger">
                                        150,000đ
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
                <div class="col-4 p-1">
                    <div class="border rounded el-hot-tour">
                        <div
                            class="position-relative el-hot-tour__image el-hot-tour__image--scale">
                            <img src="../publics/uploads/combo1.png" alt="" />
                        </div>
                        <div class="p-3">
                            <a
                                href="#"
                                class="text-uppercase text-dark el-weight-bold">ĐÊM THIÊNG LIÊNG - SÁNG NGỜI TINH THẦN
                                        VIỆT
                            </a>
                            <div
                                class="d-flex justify-content-between align-items-center py-2">
                                <div class="font-13">
                                    <div class="mb-1">
                                        <img
                                            src="../publics/uploads/traveler.png"
                                            alt=""
                                            height="14" />
                                        <span>Tự túc</span>
                                    </div>
                                    <div>
                                        <img
                                            src="../publics/uploads/date.png"
                                            alt=""
                                            height="14" />
                                        <span>21/8 - 22/8</span>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <div>Giá từ</div>
                                    <div
                                        class="el-weight-bold text-danger">
                                        150,000đ
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
                <div class="col-4 p-1">
                    <div class="border rounded el-hot-tour">
                        <div
                            class="position-relative el-hot-tour__image el-hot-tour__image--scale">
                            <img src="../publics/uploads/combo1.png" alt="" />
                        </div>
                        <div class="p-3">
                            <a
                                href="#"
                                class="text-uppercase text-dark el-weight-bold">ĐÊM THIÊNG LIÊNG - SÁNG NGỜI TINH THẦN
                                        VIỆT
                            </a>
                            <div
                                class="d-flex justify-content-between align-items-center py-2">
                                <div class="font-13">
                                    <div class="mb-1">
                                        <img
                                            src="../publics/uploads/traveler.png"
                                            alt=""
                                            height="14" />
                                        <span>Tự túc</span>
                                    </div>
                                    <div>
                                        <img
                                            src="../publics/uploads/date.png"
                                            alt=""
                                            height="14" />
                                        <span>21/8 - 22/8</span>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <div>Giá từ</div>
                                    <div
                                        class="el-weight-bold text-danger">
                                        150,000đ
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
                <div class="col-4 p-1">
                    <div class="border rounded el-hot-tour">
                        <div
                            class="position-relative el-hot-tour__image el-hot-tour__image--scale">
                            <img src="../publics/uploads/combo1.png" alt="" />
                        </div>
                        <div class="p-3">
                            <a
                                href="#"
                                class="text-uppercase text-dark el-weight-bold">ĐÊM THIÊNG LIÊNG - SÁNG NGỜI TINH THẦN
                                        VIỆT
                            </a>
                            <div
                                class="d-flex justify-content-between align-items-center py-2">
                                <div class="font-13">
                                    <div class="mb-1">
                                        <img
                                            src="../publics/uploads/traveler.png"
                                            alt=""
                                            height="14" />
                                        <span>Tự túc</span>
                                    </div>
                                    <div>
                                        <img
                                            src="../publics/uploads/date.png"
                                            alt=""
                                            height="14" />
                                        <span>21/8 - 22/8</span>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <div>Giá từ</div>
                                    <div
                                        class="el-weight-bold text-danger">
                                        150,000đ
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
                <div class="col-4 p-1">
                    <div class="border rounded el-hot-tour">
                        <div
                            class="position-relative el-hot-tour__image el-hot-tour__image--scale">
                            <img src="../publics/uploads/combo1.png" alt="" />
                        </div>
                        <div class="p-3">
                            <a
                                href="#"
                                class="text-uppercase text-dark el-weight-bold">ĐÊM THIÊNG LIÊNG - SÁNG NGỜI TINH THẦN
                                        VIỆT
                            </a>
                            <div
                                class="d-flex justify-content-between align-items-center py-2">
                                <div class="font-13">
                                    <div class="mb-1">
                                        <img
                                            src="../publics/uploads/traveler.png"
                                            alt=""
                                            height="14" />
                                        <span>Tự túc</span>
                                    </div>
                                    <div>
                                        <img
                                            src="../publics/uploads/date.png"
                                            alt=""
                                            height="14" />
                                        <span>21/8 - 22/8</span>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <div>Giá từ</div>
                                    <div
                                        class="el-weight-bold text-danger">
                                        150,000đ
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
            </div>
            <div class="d-flex justify-content-center mt-4">
                <button class="btn btn-outline-mid-blue px-5">
                    Xem thêm
                </button>
            </div>
        </div>
    </div>
    <!-- End: Combo -->

    <!-- Begin: Thư viện/video -->
    <div class="py-4">
        <div class="container">
            <h4 class="el-title">Thư viện
            </h4>
            <div class="d-flex justify-content-between">
                <p class="el-subtitle">video</p>
                <a href="#" class="font-italic el-weight-bold">Xem thêm</a>
            </div>
        </div>
        <div class="container-fluid">
            <div class="lib-video">
                <div class="px-1 overflow-hidden position-relative">
                    <div class="position-relative">
                        <img
                            src="../publics/uploads/tour1.png"
                            alt=""
                            class="img-fluid rounded" />
                        <img
                            src="../publics/uploads/video.png"
                            alt=""
                            class="absolute-center"
                            height="20" />
                    </div>
                    <div class="el-weight-bold font-16">
                        Du lịch Đà Lạt
                    </div>
                </div>
                <div class="px-1 overflow-hidden position-relative">
                    <div class="position-relative">
                        <img
                            src="../publics/uploads/tour1.png"
                            alt=""
                            class="img-fluid rounded" />
                        <img
                            src="../publics/uploads/video.png"
                            alt=""
                            class="absolute-center"
                            height="20" />
                    </div>
                    <div class="el-weight-bold font-16">
                        Du lịch Đà Lạt
                    </div>
                </div>
                <div class="px-1 overflow-hidden position-relative">
                    <div class="position-relative">
                        <img
                            src="../publics/uploads/tour1.png"
                            alt=""
                            class="img-fluid rounded" />
                        <img
                            src="../publics/uploads/video.png"
                            alt=""
                            class="absolute-center"
                            height="20" />
                    </div>
                    <div class="el-weight-bold font-16">
                        Du lịch Đà Lạt
                    </div>
                </div>
                <div class="px-1 overflow-hidden position-relative">
                    <div class="position-relative">
                        <img
                            src="../publics/uploads/tour1.png"
                            alt=""
                            class="img-fluid rounded" />
                        <img
                            src="../publics/uploads/video.png"
                            alt=""
                            class="absolute-center"
                            height="20" />
                    </div>
                    <div class="el-weight-bold font-16">
                        Du lịch Đà Lạt
                    </div>
                </div>
                <div class="px-1 overflow-hidden position-relative">
                    <div class="position-relative">
                        <img
                            src="../publics/uploads/tour1.png"
                            alt=""
                            class="img-fluid rounded" />
                        <img
                            src="../publics/uploads/video.png"
                            alt=""
                            class="absolute-center"
                            height="20" />
                    </div>
                    <div class="el-weight-bold font-16">
                        Du lịch Đà Lạt
                    </div>
                </div>
                <div class="px-1 overflow-hidden position-relative">
                    <div class="position-relative">
                        <img
                            src="../publics/uploads/tour1.png"
                            alt=""
                            class="img-fluid rounded" />
                        <img
                            src="../publics/uploads/video.png"
                            alt=""
                            class="absolute-center"
                            height="20" />
                    </div>
                    <div class="el-weight-bold font-16">
                        Du lịch Đà Lạt
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End: Thư viện/video -->

    <!-- Begin: Thư viện/video -->
    <div class="py-4">
        <div class="container">
            <div class="d-flex justify-content-between">
                <p class="el-subtitle">hình ảnh</p>
                <a href="#" class="font-italic el-weight-bold">Xem thêm</a>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row no-gutters">
                <div class="col-3 p-1">
                    <div class="position-relative lib-image">
                        <img src="../publics/uploads/image1.png" alt="" />
                        <div
                            class="el-weight-bold el-text-shadow text-white position-absolute"
                            style="bottom: 5px; left: 5px;">
                            Khám phá Phú Yên
                        </div>
                    </div>
                </div>
                <div class="col-3 p-1">
                    <div class="position-relative lib-image">
                        <img src="../publics/uploads/image1.png" alt="" />
                        <div
                            class="el-weight-bold el-text-shadow text-white position-absolute"
                            style="bottom: 5px; left: 5px;">
                            Khám phá Phú Yên
                        </div>
                    </div>
                </div>
                <div class="col-3 p-1">
                    <div class="position-relative lib-image">
                        <img src="../publics/uploads/image1.png" alt="" />
                        <div
                            class="el-weight-bold el-text-shadow text-white position-absolute"
                            style="bottom: 5px; left: 5px;">
                            Khám phá Phú Yên
                        </div>
                    </div>
                </div>
                <div class="col-3 p-1">
                    <div class="position-relative lib-image">
                        <img src="../publics/uploads/image1.png" alt="" />
                        <div
                            class="el-weight-bold el-text-shadow text-white position-absolute"
                            style="bottom: 5px; left: 5px;">
                            Khám phá Phú Yên
                        </div>
                    </div>
                </div>
                <div class="col-3 p-1">
                    <div class="position-relative lib-image">
                        <img src="../publics/uploads/image1.png" alt="" />
                        <div
                            class="el-weight-bold el-text-shadow text-white position-absolute"
                            style="bottom: 5px; left: 5px;">
                            Khám phá Phú Yên
                        </div>
                    </div>
                </div>
                <div class="col-3 p-1">
                    <div class="position-relative lib-image">
                        <img src="../publics/uploads/image1.png" alt="" />
                        <div
                            class="el-weight-bold el-text-shadow text-white position-absolute"
                            style="bottom: 5px; left: 5px;">
                            Khám phá Phú Yên
                        </div>
                    </div>
                </div>
                <div class="col-3 p-1">
                    <div class="position-relative lib-image">
                        <img src="../publics/uploads/image1.png" alt="" />
                        <div
                            class="el-weight-bold el-text-shadow text-white position-absolute"
                            style="bottom: 5px; left: 5px;">
                            Khám phá Phú Yên
                        </div>
                    </div>
                </div>
                <div class="col-3 p-1">
                    <div class="position-relative lib-image">
                        <img src="../publics/uploads/image1.png" alt="" />
                        <div
                            class="el-weight-bold el-text-shadow text-white position-absolute"
                            style="bottom: 5px; left: 5px;">
                            Khám phá Phú Yên
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End: Thư viện/video -->

    <!-- Begin: Banner -->
    <div class="my-2">
        <img src="../publics/uploads/banner.png" alt="banner" class="img-fluid" />
    </div>
    <!-- End: Banner -->

    <!-- Begin: Đối tác -->
    <div class="text-center pb-4 bg-gray-2">
        <div class="container">
            <h4 class="text-uppercase py-60">đối tác của chúng tôi</h4>
        </div>
        <div class="container-fluid">
            <div class="partner">
                <div class="overflow-hidden position-relative">
                    <div
                        class="position-relative border bg-white flex-center">
                        <img
                            src="../publics/uploads/doitac1.png"
                            alt=""
                            class="img-fluid rounded"
                            width="90" />
                    </div>
                </div>
                <div class="overflow-hidden position-relative">
                    <div
                        class="position-relative border bg-white flex-center">
                        <img
                            src="../publics/uploads/doitac1.png"
                            alt=""
                            class="img-fluid rounded"
                            width="90" />
                    </div>
                </div>
                <div class="overflow-hidden position-relative">
                    <div
                        class="position-relative border bg-white flex-center">
                        <img
                            src="../publics/uploads/doitac1.png"
                            alt=""
                            class="img-fluid rounded"
                            width="90" />
                    </div>
                </div>
                <div class="overflow-hidden position-relative">
                    <div
                        class="position-relative border bg-white flex-center">
                        <img
                            src="../publics/uploads/doitac1.png"
                            alt=""
                            class="img-fluid rounded"
                            width="90" />
                    </div>
                </div>
                <div class="overflow-hidden position-relative">
                    <div
                        class="position-relative border bg-white flex-center">
                        <img
                            src="../publics/uploads/doitac1.png"
                            alt=""
                            class="img-fluid rounded"
                            width="90" />
                    </div>
                </div>
                <div class="overflow-hidden position-relative">
                    <div
                        class="position-relative border bg-white flex-center">
                        <img
                            src="../publics/uploads/doitac1.png"
                            alt=""
                            class="img-fluid rounded"
                            width="90" />
                    </div>
                </div>
                <div class="overflow-hidden position-relative">
                    <div
                        class="position-relative border bg-white flex-center">
                        <img
                            src="../publics/uploads/doitac1.png"
                            alt=""
                            class="img-fluid rounded"
                            width="90" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End: Đối tác -->

    <!-- Begin: Form -->
    <div class="el-form d-flex">
        <div
            class="container d-flex justify-content-end align-items-center flex-grow-1">
            <div
                class="bg-white rounded shadow px-30 py-40 w-100"
                style="max-width: 410px;">
                <div class="d-flex align-items-center">
                    <img src="../publics/uploads/dangky.png" alt="" width="60" />
                    <span class="font-20 el-weight-bold ml-2">ĐĂNG KÝ NHẬN THÔNG TIN KHUYẾN MẠI</span>
                </div>
                <form class="mt-2">
                    <div class="form-group">
                        <label for="form_name">
                            Họ và tên
                                    <span class="text-danger">*</span>:</label>
                        <input
                            type="text"
                            required
                            class="form-control font-14"
                            id="form_name"
                            placeholder="Nhập họ và tên bạn" />
                    </div>
                    <div class="form-group">
                        <label for="form_email">
                            Email
                                    <span class="text-danger">*</span>:</label>
                        <input
                            type="email"
                            required
                            class="form-control font-14"
                            id="form_email"
                            placeholder="Nhập email của bạn" />
                    </div>
                    <div class="form-group">
                        <label for="form_phone">Số điện thoại :</label>
                        <input
                            type="text"
                            required
                            class="form-control font-14"
                            id="form_phone"
                            placeholder="Nhập số điện thoại của bạn" />
                    </div>
                    <button
                        type="submit"
                        class="btn btn-mid-blue w-100 el-weight-bold text-uppercase">
                        Đăng ký
                    </button>
                </form>
            </div>
        </div>
    </div>
    <!-- End: Form -->
</asp:Content>

