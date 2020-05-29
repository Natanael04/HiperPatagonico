<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HiperPatagonico1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<!DOCTYPE html>
    <html>

    <head>
        <title>Inicio</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    </head>
    <body>
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-5">
                    <img class="mx-auto" src="img/Logo_hiper.png" />
                </div>
                <div class="col-md-7">
                    <h1 class="mx-auto">Control Horarios</h1>
                    <p class="mx-auto">Supermercado Hiper Patagonico.</p>
                </div>
            </div>
        </div>
        <asp:Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Formulario" OnClick="Button1_Click"/>
        <br />
        <div class="row row-centered">
            <div class="col-md-10 col-centered" style="margin-left: 7%">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>

    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="text-center">
                                <img src="img/carousel-1.jpg" alt="" style="height: 500px" >
                            </div>
                        </div>
                        <div class="item">
                            <div class="text-center">
                                <img src="img/carousel-2.jpg" alt="" style="height: 500px">
                            </div>
                        </div>
                        <div class="item">
                            <div class="text-center">
                                <img src="img/carousel-3.jpg" alt="" style="height: 500px" >
                            </div>
                        </div>
                    </div>
    <!-- Controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            // Call carousel manually
            $('#myCarouselCustom').carousel();

            // Go to the previous item
            $("#prevBtn").click(function () {
                $("#myCarouselCustom").carousel("prev");
            });
            // Go to the previous item
            $("#nextBtn").click(function () {
                $("#myCarouselCustom").carousel("next");
            });
</script>
    </body>
    </html>
</asp:Content>
