<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="hanoitourist_ver02.loginn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <link href="../publics/css/admin.css" rel="stylesheet" />
    <script src="../_vendor/jquery.min.js"></script>
    <script src="../_vendor/bootstrap.bundle.js"></script>
    <script src="../_vendor/main.js"></script>
    <script src="https://kit.fontawesome.com/ab4eacbd98.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<body class="bg-gradient-primary">
    <form id="form1" runat="server">
        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label Text="Email" runat="server" />
                                            <asp:TextBox ID="name" runat="server" CssClass="form-control" type="email" required="true"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label Text="Mật Khẩu" runat="server" />
                                            <asp:TextBox ID="passwords" runat="server" CssClass="form-control" type="password" required="true"></asp:TextBox>
                                        </div>
                                        <hr />
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Đăng nhập" class="btn btn-primary btn-user btn-block" />
                                        <br />
                                        <hr />

                                        <div class="text-center">
                                            <asp:HyperLink runat="server" class="small" NavigateUrl="~/home/index.aspx">Quay về trang chủ</asp:HyperLink>
                                        </div>
                                        <div class="text-center">
                                            <a class="small" href="register.aspx">Đăng ký</a>
                                        </div>
                                    </div>
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
