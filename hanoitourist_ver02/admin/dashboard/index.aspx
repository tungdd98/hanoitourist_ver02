<%@ Page Title="" Language="C#" MasterPageFile="~/layouts/_admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="hanoitourist_ver02.admin.dashboard.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1>Dashboard</h1>
    <div class="row">

        <!-- Thống kê lượt người truy cập -->
        <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Tổng lượt truy cập</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                <asp:Label runat="server" ID="userVisited"></asp:Label>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Thống kê user đang online -->
        <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Người dùng đang online</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                <asp:Label runat="server" ID="userOnline"></asp:Label>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Thống kê tour được đặt nhiều nhất -->
        <div class="col-xl-4 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tour được đặt nhiều nhất</div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <asp:Label runat="server" class="mb-0 mr-3 font-weight-bold text-gray-800" ID="tourName">
                                    </asp:Label>
                                    Số lượng đặt <asp:Label runat="server" class="mb-0 mr-3 font-weight-bold text-gray-800" ID="tourQuantity"></asp:Label>
                                </div> 
                                
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
