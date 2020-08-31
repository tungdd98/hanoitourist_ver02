<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="hanoitourist_ver02.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng ký</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <script src="https://kit.fontawesome.com/ab4eacbd98.js" crossorigin="anonymous"></script>
    <link href="../publics/css/admin.css" rel="stylesheet" />
    <script src="../_vendor/jquery.min.js"></script>
    <script src="../_vendor/bootstrap.bundle.js"></script>
    <script src="../_vendor/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script>
        // Cấu hình thông báo
        const Toast = Swal.mixin({
            toast: true,
            position: "top-end",
            showConfirmButton: false,
            timer: 1000,
            timerProgressBar: true,
            onOpen: (toast) => {
                toast.addEventListener("mouseenter", Swal.stopTimer);
                toast.addEventListener("mouseleave", Swal.resumeTimer);
            },
        });

        const swAlert = (title = "", icon = "success") => {
            Toast.fire({
                icon,
                title,
            });
        }

    </script>
</head>
<body class="bg-gradient-primary">
    <form id="form1" runat="server">
        <div class="container">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <asp:TextBox runat="server" type="text" class="form-control form-control-user" ID="fullName" placeholder="Họ và tên" required="true" pattern="[^0-9]*" title="Họ tên không được có số" />
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:TextBox runat="server" type="text" class="form-control form-control-user" ID="phoneNumber" placeholder="Số điện thoại" required="true" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox runat="server" type="email" class="form-control form-control-user" ID="email" placeholder="Email" required="true" />
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <asp:TextBox runat="server" type="password" class="form-control form-control-user" ID="password" placeholder="Mật khẩu" required="true" pattern=".{6,}"  title="Mật khẩu tối thiểu 6 kí tự" />
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:TextBox runat="server" type="password" class="form-control form-control-user" ID="cfPassword" placeholder="Xác nhận mật khẩu" required="true" /><br />
                                    </div>
                                </div>
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Đăng kí" class="btn btn-primary btn-user btn-block" />
                                <div class="text-center">
                                    <asp:HyperLink runat="server" class="small" NavigateUrl="~/home/index.aspx">Quay về trang chủ</asp:HyperLink>
                                </div>
                                <div class="text-center">
                                    <asp:HyperLink runat="server" class="small" NavigateUrl="~/login.aspx">Đăng nhập</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
