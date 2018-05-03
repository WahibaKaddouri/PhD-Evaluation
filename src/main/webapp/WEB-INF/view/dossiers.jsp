<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/03/2018
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>MESRS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <link rel="stylesheet" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.css">
    <!--Morris Chart CSS -->
    <link rel="stylesheet" href="/resources/plugins/morris.css">

    <!-- Bootstrap core CSS -->
    <link href="/resources/css_ens/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/resources/css_ens/metisMenu.min.css" rel="stylesheet">
    <!-- Icons CSS -->
    <link href="/resources/css_ens/icons.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/css_ens/style.css" rel="stylesheet">
    <!--Start of Zendesk Chat Script-->
    <script type="text/javascript">
        window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
                d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
        _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
            $.src="https://v2.zopim.com/?4p3c7OqA0zvVAAMy3Kh6gWn1I6PNXVjw";z.t=+new Date;$.
                    type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
    </script>
    <!--End of Zendesk Chat Script-->
</head>


<body>

<div id="page-wrapper" >

    <!-- Top Bar Start -->
    <div class="topbar" style="background-color: #534441">

        <div class="topbar-left">
            <div class="">

            </div>
        </div>

        <!-- Top navbar -->
        <div class="navbar navbar-default" role="navigation">

            <!-- Top nav Right menu -->
            <ul class="nav navbar-nav navbar-right top-navbar-items-right pull-right" style="position:absolute; top:-110px;right:4px;">
                <li class="hidden-xs" style="padding-top:10px;" >
                    <form role="search" class="navbar-left app-search pull-left">
                        <input type="text" placeholder="Search..." class="form-control">
                        <a href=""><i class="fa fa-search" ></i></a>
                    </form>
                </li>
                <li class="dropdown top-menu-item-xs" style="height:80px;">
                    <a href="#" data-target="#" class="dropdown-toggle menu-right-item" data-toggle="dropdown" aria-expanded="true" style="background-color:#067790;height:80px;">
                        <i class="fa fa-bell" style="padding-top:15px;"></i> <span class="label label-danger" style="position:absolute;top:30px;"></span>
                    </a>
                    <ul class="dropdown-menu p-0 dropdown-menu-lg">
                        <!--<li class="notifi-title"><span class="label label-default pull-right">New 3</span>Notification</li>-->
                        <li class="list-group notification-list" style="height:70px;">
                            <div class="slimscroll">
                                <!-- list item-->
                                <a href="javascript:void(0);" class="list-group-item">
                                    <div class="media">
                                        Vous n'avez aucune nouvelle notification
                                    </div>
                                </a>

                                <!-- list item-->


                                <!-- list item-->

                            </div>
                        </li>

                    </ul>
                </li>

                <li class="dropdown top-menu-item-xs" style="height:80px;padding-top: 14px;">
                    <a href="" class="dropdown-toggle menu-right-item profile" data-toggle="dropdown" aria-expanded="true" style="background-color:#067790;right:2px;height:60px;"><i class="fa fa-user" style="font-size: 25px;text-align:center;"></i></a>
                    <ul class="dropdown-menu">

                        <li><a href="javascript:void(0)"><i class="ti-settings m-r-10"></i> paramètres</a></li>

                        <li class="divider"></li>
                        <li><a href="javascript:void(0)"><i class="ti-power-off m-r-10"></i> Déconnexion</a></li>
                    </ul>
                </li>
            </ul>
            <!-- time-line -->
            <!--
                    <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,600,700' rel='stylesheet' type='text/css'>
                     <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">


             <ul class="timeline" id="timeline" style="margin-top:20px;">
               <li class="li complete" style="width:50px;">

                 <div class="status">
                   <h4></h4>
                 </div>
               </li>
               <li class="li complete" style="width:50px;">

                 <div class="status">
                   <h4></h4>
                 </div>
               </li>
               <li class="li complete" style="width:50px;">
                 <div class="status">
                   <h4></h4>
                 </div>
               </li>
               <li class="li" style="width:50px;">
                 <div class="status">
                   <h4></h4>
                 </div>
               </li>
                <li class="li">
                 <div class="status">
                   <h4></h4>
                 </div>
               </li>
                <li class="li" style="width:50px;">
                 <div class="status">
                   <h4></h4>
                 </div>
               </li>
                <li class="li" style="width:50px;">
                 <div class="status">
                   <h4></h4>
                 </div>
               </li>
                <li class="li" style="width:50px;">
                 <div class="status">
                   <h4></h4>
                 </div>
               </li>
                <li class="li" style="width:50px;">
                 <div class="status">
                   <h4></h4>
                 </div>
               </li>
              </ul>
              -->
            <!-- time-line -->
        </div>
    </div>
    <!-- Top Bar End -->


    <!-- Page content start -->
    <div class="page-contentbar">

        <!--left navigation start-->
        <aside class="sidebar-navigation">
            <div class="scrollbar-wrapper">
                <div >
                    <button type="button" class="button-menu-mobile btn-mobile-view visible-xs visible-sm">
                        <i class="mdi mdi-close"></i>
                    </button>
                    <!-- User Detail box -->
                    <div class="user-details" >
                        <div class="pull-left" style="margin-left:20px;">
                            <i class="fa fa-user" style="font-size: 25px;text-align:center;"><p style="font-size:17px;text-align: center">Prénom</p><br><p style="font-size:17px;">Nom candidat</p></i>
                        </div>
                        <div class="user-info">

                        </div>
                    </div>
                    <!--- End User Detail box -->

                    <!-- Left Menu Start -->
                    <ul class="nav">
                        <li class="nav-item active" style="border-top: solid #F5F5F5 1px";>
                            <a class="nav-link" href="<%=request.getContextPath()+response.encodeURL("/Accueil")%>">
                                <i class="nc-icon nc-chart-pie-35"></i>
                                <p style="text-align:center;font-size:17px;padding-top:26px;color:#696969;">Accueil</p>
                            </a>
                        </li>
                        <li style="border-top: solid #F5F5F5 1px;">
                            <a class="nav-link" href="<%=request.getContextPath()+response.encodeURL("/dossiers")%>">
                                <i class="nc-icon nc-circle-09"></i>
                                <p style="text-align:center;font-size:17px;padding-top:26px;color:#696969">Mon dossier</p>
                            </a>
                        </li>
                        <li style="border-top: solid #F5F5F5 1px;border-bottom: solid #F5F5F5 1px;">
                            <a class="nav-link" href="#">
                                <i class="nc-icon nc-notes"></i>
                                <p style="text-align:center;font-size:17px;padding-top:26px;color:#696969;">Procédure</p>
                            </a>
                        </li>


                    </ul>
                </div>
            </div><!--Scrollbar wrapper-->
        </aside>
        <!--left navigation end-->

        <!-- START PAGE CONTENT -->


        <div id="page-right-content">

            <div class="container">

                <div class="external-event bg-custom ui-draggable ui-draggable-handle" data-class="bg-warning" style="position:absolute;top:130px;left:210px;width:67.5%;border-radius:50px;">
                    <i class="mdi mdi-checkbox-blank-circle m-r-10 vertical-middle"></i>
                    &emsp;&emsp;&emsp; &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Complétez votre dossier</div>

                <div class="col-md-4" style="position:absolute;top:200px;left:200px;display:inline;">
                    <!-- Personal-Information -->
                    <div class="panel panel-default panel-fill">
                        <div class="panel-heading">
                            <h3 class="panel-title" style="text-align:center">Dossier administratif</h3>
                        </div>
                        <div class="panel-body" style="height:200px;">
                            <a href="<%=request.getContextPath()+response.encodeURL("/Enseignant/Dossier_administratif")%>" class="btn btn-default btn-sm btn-icon icon-left" style="background-color:#eeeeee;width:100%;position:relative;top:170px;">
                                <i class="fa fa-book"></i>
                                Compléter
                            </a>

                        </div>
                    </div>
                    <!-- Personal-Information -->


                </div>


                <div class="col-md-4" style="position:relative;top:200px;right:-600px;height:200px;">
                    <!-- Personal-Information -->
                    <div class="panel panel-default panel-fill">
                        <div class="panel-heading">
                            <h3 class="panel-title" style="text-align:center;">Dossier Pédagogique</h3>
                        </div>
                        <div class="panel-body" style="height:200px;">

                            <a href="<%=request.getContextPath()+response.encodeURL("/Enseignant/Dossier_pédagogique")%>" class="btn btn-default btn-sm btn-icon icon-left" style="background-color:#eeeeee;width:100%;position:relative;top:170px;">
                                <i class="fa fa-book"></i>
                                Compléter
                            </a>
                        </div>
                    </div>
                    <!-- Personal-Information -->


                </div>

            </div>
            <!-- end container -->



            <!-- end container -->

            <div class="footer" style="position:relative,top:-87px;">
                <div class="pull-right hidden-xs">
                    <strong>GCode</strong> - Copyright &copy; 2018
                </div>
            </div>


            <!-- End #page-right-content -->

        </div>
        <!-- end .page-contentbar -->
    </div>
    <!-- End #page-wrapper -->



    <!-- js placed at the end of the document so the pages load faster -->
    <script src="/resources/js_ens/jquery-2.1.4.min.js"></script>
    <script src="/resources/js_ens/bootstrap.min.js"></script>
    <script src="/resources/js_ens/metisMenu.min.js"></script>
    <script src="/resources/js_ens/jquery.slimscroll.min.js"></script>

    <!--Morris Chart-->
    <script src="/resources/plugins/morris.min.js"></script>
    <script src="/resources/plugins/raphael-min.js"></script>

    <!-- Dashboard init -->
    <script src="/resources/js_ens/jquery.dashboard.js"></script>

    <!-- App Js -->
    <script src="/resources/js_ens/jquery.app.js"></script>
    <script src="/resources/js_ens/bootbox.min.js"></script>


</body>
</html>

