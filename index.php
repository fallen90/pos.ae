<?php
    ini_set('max_execution_time', 300);
    require_once("includes/POS.php");
    require_once("includes/form_actions.php");

    $outlets = get_outlets();


?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="/favicon.ico">
        <title>Kanto Freestyle</title>
        <!-- Bootstrap core CSS -->
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

        <![endif]-->
        <script src="./assets/js/jquery.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <!-- <script src="http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script> -->
        <style>
        #body {
            margin-top: 100px;
        }
        
        cite {
            display: block;
            padding-top: 12px;
            color: #bbb;
        }
        
        [id^="markAsRead"] {
            margin-top: -4.1%;
            margin-right: 27px;
        }
        </style>
    </head>

    <body>
        

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<?='./?outlet_id=' . $_GET['outlet_id'];?>">Kanto Freestyle</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="/pos.ae/wp-admin">Return to Dashboard</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="glyphicon glyphicon-refresh"></i> Switch Branch
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <?php foreach($outlets as $outlet):?>
                                <li>
                                    <a href="./?outlet_id=<?=$outlet['ID'];?>">
                                        <?=$outlet['name'];?>
                                    </a>
                                </li>
                                <?php endforeach;?>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </nav>
        <?php if(!isset($_GET['outlet_id'])): ?>
            <div class="container" style="padding-top:60px;">
                <div class="jumbotron">
                    <div class="container">
                        <h1>Select Branch to Manage</h1>
                        <p>
                            <?php foreach($outlets as $outlet):?>
                            <a class="btn btn-default btn-lg" href="./?outlet_id=<?=$outlet['ID'];?>">
                                <?=$outlet['name'];?>
                            </a>
                            <?php endforeach;?>
                        </p>
                    </div>
                </div>
            </div>
        <?php
        elseif(isset($_GET['outlet_id']) && $_GET['outlet_id'] != '' && isset($_GET['menu_manager'])): 
            include('/partials/menu_manager.php'); 
        else: ?>
        <div class="container" id="body">
            <?php
                $alerts = get_ingredients_by_outlet(get_current_outlet()['sku_prefix']);
                // if(isset($alerts['out_of_stock']) && sizeof($alerts['out_of_stock']) >= 1):
                    foreach($alerts as $alert) :

                        if($alert->stock_quantity == 0):
                            ?>
                                <div class="alert alert-danger">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    <strong>Alert!</strong> Item <b><?=$alert->title;?></b> is out of stock !
                                </div>
                            <?php 
                        endif;
                    endforeach;
                // endif;
            ?>
            <?php
                // $alerts = get_stock_alerts($_GET['outlet_id'])['threshold_reached'];
                // if(isset($alerts['threshold_reached']) && sizeof($alerts['threshold_reached']) >= 1):
                    foreach($alerts as $alert) :
                        if($alert->stock_quantity <= $config->stock_threshold && $alert->stock_quantity != 0):
                            ?>
                                <div class="alert alert-warning">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                    <strong>Warning!</strong> Item <b><?=$alert->title;?></b> has reached stock threshold.
                                </div>
                            <?php
                        endif;
                    endforeach;
                // endif;
            ?>
            <h1><i class="glyphicon glyphicon-home"></i> <?=get_current_outlet()['name'];?></h1>
            <div class="well">
                <?php if(show_response()): ?>
                <div class="alert alert-<?=@$response['status'];?>">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <strong><?=@$response['message'];?></strong>
                </div>
                <?php endif;?>
                <div role="tabpanel">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#ingredients" aria-controls="ingredients" role="tab" data-toggle="tab">Ingredients</a>
                        </li>
                        <li role="presentation">
                            <a href="#borrow" aria-controls="tab" role="tab" data-toggle="tab">Borrow</a>
                        </li>
                        <li role="presentation">
                            <a href="#notifs" aria-controls="tab" role="tab" data-toggle="tab">Notifications</a>
                        </li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="ingredients">
                            <?php include('partials/ingredients_table.php'); ?>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="borrow">
                            <?php include('partials/borrow_table.php');?>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="notifs">
                            <?php include('partials/notification_table.php');?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php include('/partials/add_modal.php');?>
        <?php endif;?>
    </body>

    </html>
