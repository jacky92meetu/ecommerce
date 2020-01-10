<?php echo $header; ?>

<link rel="stylesheet" href="/merchant/view/css/dashboard.css" />
                                
					<div class="row">
						<div class="col-xs-12">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                                <!-- col-lg-3 start here -->
                                                                <div class="tile green" href="/merchant/order/today_order">
                                                                    <!-- tile start here -->
                                                                    <div class="tile-icon">
                                                                        <i class="ace-icon fa fa-shopping-cart fa-5x"></i>
                                                                    </div>
                                                                    <div class="tile-content">
                                                                        <div class="number"><? echo $today_order; ?></div>
                                                                        <h3>Today New Orders</h3>
                                                                    </div>
                                                                </div>
                                                                <!-- tile end here -->
                                                            </div>
                                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                                <!-- col-lg-3 start here -->
                                                                <div class="tile orange">
                                                                    <div class="tile-icon">
                                                                        <i class="ace-icon fa fa-bar-chart-o fa-5x"></i>
                                                                    </div>
                                                                    <div class="tile-content">
                                                                        <div class="number"><? echo $page_view['by_today']; ?></div>
                                                                        <h3>Page Views By Today</h3>
                                                                    </div>
                                                                </div>
                                                                <!-- tile end here -->
                                                            </div>                                                            
                                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                                <!-- col-lg-3 start here -->
                                                                <div class="tile blue">
                                                                    <!-- tile start here -->
                                                                    <div class="tile-icon">
                                                                        <i class="ace-icon fa fa-comment fa-5x"></i>
                                                                    </div>
                                                                    <div class="tile-content">
                                                                        <div class="number"><? echo $today_review; ?></div>
                                                                        <h3>Today Comments</h3>
                                                                    </div>
                                                                </div>
                                                                <!-- tile end here -->
                                                            </div>
                                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                                <!-- col-lg-3 start here -->
                                                                <div class="tile red" href="/merchant/order/today_order">
                                                                    <!-- tile start here -->
                                                                    <div class="tile-icon">
                                                                        <i class="ace-icon fa fa-dollar fa-5x"></i>
                                                                    </div>
                                                                    <div class="tile-content">
                                                                        <div class="number"><? echo $today_sales; ?></div>
                                                                        <h3>Today Sales</h3>
                                                                    </div>
                                                                </div>
                                                                <!-- tile end here -->
                                                            </div>
                                                        </div>
                                                    
                                                        <div class="hr hr32 hr-dotted"></div>
                                                        
                                                        <div class="row">                                                            
                                                            <div class="phase-2 col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                <div class="panel panel-teal">                                                                    
                                                                    <div class="panel-heading">
                                                                        <h4 class="widget-title">
                                                                                <i class="ace-icon fa fa-signal"></i>
                                                                                Customer Gender
                                                                        </h4>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        <div class="drawPieChart" id="customer_gender"></div>
                                                                    </div>
                                                                </div>                                                                
                                                            </div>
                                                            <div class="phase-2 col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                <div class="panel panel-teal">                                                                    
                                                                    <div class="panel-heading">
                                                                        <h4 class="widget-title">
                                                                                <i class="ace-icon fa fa-signal"></i>
												Traffic Sources
                                                                        </h4>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        <div class="drawPieChart" id="piechart-placeholder"></div>
                                                                    </div>
                                                                </div>                                                                
                                                            </div>
                                                            <div class="phase-2 col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                <div class="panel panel-teal">                                                                    
                                                                    <div class="panel-heading">
                                                                        <h4 class="widget-title">
                                                                                <i class="ace-icon fa fa-signal"></i>
												Monthly Sales Stats
                                                                        </h4>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        <div id="sales-charts" class="plothover"></div>
                                                                    </div>
                                                                </div>                                                                
                                                            </div>
                                                            
                                                            <div class="phase-2 col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                <div class="panel panel-teal">                                                                    
                                                                    <div class="panel-heading">
                                                                        <h4 class="widget-title">
                                                                                <i class="ace-icon fa fa-signal"></i>                                                                                
												Popular Products
                                                                        </h4>
                                                                    </div>
                                                                    <div class="panel-body no-padding no-margin">
                                                                        <table class="table table-bordered table-striped no-margin">
													<thead class="thin-border-bottom">
														<tr>
															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>name
															</th>

															<th>
																<i class="ace-icon fa fa-caret-right blue"></i>price
															</th>

															<th class="hidden-480">
																<i class="ace-icon fa fa-caret-right blue"></i>status
															</th>
														</tr>
													</thead>

													<tbody>
                                                                                                                <?
                                                                                                                    foreach($popular_products as $product){
                                                                                                                        if($product['quantity']>0){
                                                                                                                            $temp = '<span class="label label-success arrowed-in arrowed-right">on sale</span>';
                                                                                                                        }else{
                                                                                                                            $temp = '<span class="label label-danger arrowed arrowed-in-right">'.$product['stock_status'].'</span>';
                                                                                                                        }
                                                                                                                ?>
														<tr>
                                                                                                                    <td><a href="<? echo $product['href']; ?>" target="_blank"><? echo $product['name']; ?></a></td>
                                                                                                                    <td>
                                                                                                                        <small>
                                                                                                                                <s class="red"><? echo $product['price']; ?></s>
                                                                                                                        </small>
                                                                                                                        <b class="green"><? echo $product['special']; ?></b>
                                                                                                                    </td>
                                                                                                                    <td class="hidden-480">
                                                                                                                            <? echo $temp; ?>
                                                                                                                    </td>
														</tr>
                                                                                                                <? } ?>
													</tbody>
												</table>
                                                                    </div>
                                                                </div>                                                                
                                                            </div>
                                                            
                                                            <div class="phase-2 col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                <div class="panel panel-teal">                                                                    
                                                                    <div class="panel-heading">
                                                                        <h4 class="widget-title">
                                                                                <i class="ace-icon fa fa-phone orange"></i>
                                                                                            Contact UBIB Admin
                                                                        </h4>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        
                                                                        <form class="form-horizontal validation-form skip-auto-focus" action="/merchant/contact" role="form">
                                                                                                <input type="hidden" name="form_action" value="contact">
                                                                                                <fieldset>                                            
                                                                                                    <div class="form-group">
                                                                                                            <label class="col-sm-3 control-label no-padding-right"> Title </label>
                                                                                                            <div class="col-sm-9 control-value">
                                                                                                                <div class="clearfix">
                                                                                                                    <select class="form-control" name="title">
                                                                                                                        <option value='I want to know more'>I want to know more</option>
                                                                                                                        <option value='I need some help'>I need some help</option>
                                                                                                                        <option value='Payment'>Payment</option>
                                                                                                                        <option value='Dashboard Technical'>Dashboard Technical</option>
                                                                                                                        <option value='Products'>Products</option>
                                                                                                                        <option value='Customers'>Customers</option>
                                                                                                                        <option value='Others'>Others</option>
                                                                                                                    </select>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                    </div>
                                                                                                    <div class="form-group">
                                                                                                            <label class="col-sm-3 control-label no-padding-right"> Comment </label>
                                                                                                            <div class="col-sm-9 control-value">
                                                                                                                <div class="clearfix">
                                                                                                                    <textarea class="form-control" name="comments" style="height:100px;" placeholder="Please enter your comment here"></textarea>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                    </div>
                                                                                                </fieldset>

                                                                                                <div class="clearfix">
                                                                                                        <div class="col-md-offset-3 col-md-9">
                                                                                                                <button class="btn btn-info">
                                                                                                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                                                                                                        Submit
                                                                                                                </button>

                                                                                                                &nbsp; &nbsp; &nbsp;
                                                                                                                <button class="btn" type="reset">
                                                                                                                        <i class="ace-icon fa fa-undo bigger-110"></i>
                                                                                                                        Reset
                                                                                                                </button>
                                                                                                        </div>
                                                                                                </div> 
                                                                                            </form>
                                                                    </div>
                                                                </div>                                                                
                                                            </div>
                                                            <? /* ?>
                                                            <div class="phase-2 col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                <div class="panel panel-teal">                                                                    
                                                                    <div class="panel-heading">
                                                                        <h4 class="widget-title">
                                                                                <i class="ace-icon fa fa-comments"></i>
												Customer Latest Comments
                                                                        </h4>
                                                                    </div>
                                                                    <div class="panel-body">
                                                                        <div class="dialogs">
													<div class="itemdiv dialogdiv">
														<div class="user">
															<img alt="Alexa's Avatar" src="/merchant/view/images/avatar1.png">
														</div>

														<div class="body">
															<div class="time">
																<i class="ace-icon fa fa-clock-o"></i>
																<span class="green">4 sec</span>
															</div>

															<div class="name">
																<a href="#">Alexa Tan</a>
															</div>
															<div class="text">I just placed on order this morning. I want to change my address. Is this possible? Please reply me asap.</div>
                                                                                                                        <div class="tools">
                                                                                                                                <div class="inline position-relative">
                                                                                                                                        <button class="btn btn-minier bigger btn-yellow dropdown-toggle" data-toggle="dropdown">
                                                                                                                                                <i class="ace-icon fa fa-angle-down icon-only bigger-120"></i>
                                                                                                                                        </button>

                                                                                                                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                                                                                                                <li>
                                                                                                                                                        <a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Approve">
                                                                                                                                                                <span class="green">
                                                                                                                                                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                                                                                                                                                </span>
                                                                                                                                                        </a>
                                                                                                                                                </li>

                                                                                                                                                <li>
                                                                                                                                                        <a href="#" class="tooltip-warning" data-rel="tooltip" title="" data-original-title="Reject">
                                                                                                                                                                <span class="orange">
                                                                                                                                                                        <i class="ace-icon fa fa-times bigger-110"></i>
                                                                                                                                                                </span>
                                                                                                                                                        </a>
                                                                                                                                                </li>

                                                                                                                                                <li>
                                                                                                                                                        <a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
                                                                                                                                                                <span class="red">
                                                                                                                                                                        <i class="ace-icon fa fa-trash-o bigger-110"></i>
                                                                                                                                                                </span>
                                                                                                                                                        </a>
                                                                                                                                                </li>
                                                                                                                                        </ul>
                                                                                                                                </div>
                                                                                                                        </div>
														</div>
													</div>

													<div class="itemdiv dialogdiv">
														<div class="user">
															<img alt="John's Avatar" src="/merchant/view/images/avatar.png">
														</div>

														<div class="body">
															<div class="time">
																<i class="ace-icon fa fa-clock-o"></i>
																<span class="blue">38 sec</span>
															</div>

															<div class="name">
																<a href="#">John Lai</a>
															</div>
															<div class="text">Received with thanks! Very good quality and will buy again. Please keep up the good work merchant and i will recommend more friends to visit your store.</div>

															<div class="tools">
																<div class="inline position-relative">
                                                                                                                                        <button class="btn btn-minier bigger btn-yellow dropdown-toggle" data-toggle="dropdown">
                                                                                                                                                <i class="ace-icon fa fa-angle-down icon-only bigger-120"></i>
                                                                                                                                        </button>

                                                                                                                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                                                                                                                <li>
                                                                                                                                                        <a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Approve">
                                                                                                                                                                <span class="green">
                                                                                                                                                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                                                                                                                                                </span>
                                                                                                                                                        </a>
                                                                                                                                                </li>

                                                                                                                                                <li>
                                                                                                                                                        <a href="#" class="tooltip-warning" data-rel="tooltip" title="" data-original-title="Reject">
                                                                                                                                                                <span class="orange">
                                                                                                                                                                        <i class="ace-icon fa fa-times bigger-110"></i>
                                                                                                                                                                </span>
                                                                                                                                                        </a>
                                                                                                                                                </li>

                                                                                                                                                <li>
                                                                                                                                                        <a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
                                                                                                                                                                <span class="red">
                                                                                                                                                                        <i class="ace-icon fa fa-trash-o bigger-110"></i>
                                                                                                                                                                </span>
                                                                                                                                                        </a>
                                                                                                                                                </li>
                                                                                                                                        </ul>
                                                                                                                                </div>
															</div>
														</div>
													</div>

													<div class="itemdiv dialogdiv">
														<div class="user">
															<img alt="Bob's Avatar" src="/merchant/view/images/user.jpg">
														</div>

														<div class="body">
															<div class="time">
																<i class="ace-icon fa fa-clock-o"></i>
																<span class="orange">2 min</span>
															</div>

															<div class="name">
																<a href="#">Mun Cheong</a>
                                                                                                                                <!--
																<span class="label label-info arrowed arrowed-in-right">admin</span>
                                                                                                                                -->
															</div>
															<div class="text">How long do i need to wait? Please reply me asap cheong.mun@gmail.com</div>

															<div class="tools">
																<div class="inline position-relative">
                                                                                                                                        <button class="btn btn-minier bigger btn-yellow dropdown-toggle" data-toggle="dropdown">
                                                                                                                                                <i class="ace-icon fa fa-angle-down icon-only bigger-120"></i>
                                                                                                                                        </button>

                                                                                                                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                                                                                                                <li>
                                                                                                                                                        <a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Approve">
                                                                                                                                                                <span class="green">
                                                                                                                                                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                                                                                                                                                </span>
                                                                                                                                                        </a>
                                                                                                                                                </li>

                                                                                                                                                <li>
                                                                                                                                                        <a href="#" class="tooltip-warning" data-rel="tooltip" title="" data-original-title="Reject">
                                                                                                                                                                <span class="orange">
                                                                                                                                                                        <i class="ace-icon fa fa-times bigger-110"></i>
                                                                                                                                                                </span>
                                                                                                                                                        </a>
                                                                                                                                                </li>

                                                                                                                                                <li>
                                                                                                                                                        <a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
                                                                                                                                                                <span class="red">
                                                                                                                                                                        <i class="ace-icon fa fa-trash-o bigger-110"></i>
                                                                                                                                                                </span>
                                                                                                                                                        </a>
                                                                                                                                                </li>
                                                                                                                                        </ul>
                                                                                                                                </div>
															</div>
														</div>
													</div>
												</div>
                                                                    </div>
                                                                </div>                                                                
                                                            </div>
                                                            <? */ ?>
                                                        </div>

							<!-- PAGE CONTENT ENDS -->
						</div><!-- /.col -->
					</div>

<?php echo $footer; ?>

<!-- page specific plugin scripts -->
<script src="/merchant/view/js/jquery-ui.custom.min.js"></script>
<script src="/merchant/view/js/jquery.ui.touch-punch.min.js"></script>
<script src="/merchant/view/js/jquery.easypiechart.min.js"></script>
<script src="/merchant/view/js/jquery.sparkline.min.js"></script>
<script src="/merchant/view/js/jquery.flot.min.js"></script>
<script src="/merchant/view/js/jquery.flot.pie.min.js"></script>
<script src="/merchant/view/js/jquery.flot.resize.min.js"></script>
<script src="/merchant/view/js/jquery.validate.min.js"></script>
<script src="/merchant/view/js/dashboard.js"></script>

<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
                            $('.easy-pie-chart.percentage').each(function(){
                                    var $box = $(this).closest('.infobox');
                                    var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
                                    var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
                                    var size = parseInt($(this).data('size')) || 50;
                                    $(this).easyPieChart({
                                            barColor: barColor,
                                            trackColor: trackColor,
                                            scaleColor: false,
                                            lineCap: 'butt',
                                            lineWidth: parseInt(size/10),
                                            animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
                                            size: size
                                    });
                            })

                            $('.sparkline').each(function(){
                                    var $box = $(this).closest('.infobox');
                                    var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
                                    $(this).sparkline('html',
                                                                     {
                                                                            tagValuesAttribute:'data-values',
                                                                            type: 'bar',
                                                                            barColor: barColor ,
                                                                            chartRangeMin:$(this).data('min') || 0
                                                                     });
                            });
						  
                            function drawPieChart(placeholder, data, type) {
                                var option = {
                                    'pie':{
                                        series: {
                                            pie: {
                                                show: !0,
                                                innerRadius: 0,
                                                radius: "auto",
                                                highlight: {
                                                    opacity: .1
                                                },
                                                stroke: {
                                                    width: 2
                                                }
                                            }
                                        },
                                        legend: {
                                            show: !0,
                                            labelFormatter: function (a) {
                                                return '<div style="font-weight:bold;font-size:13px;">' + a + "</div>"
                                            },
                                            labelBoxBorderColor: null,
                                            margin: 50,
                                            width: 20,
                                            padding: 1
                                        },
                                        grid: {
                                            hoverable: !0,
                                            clickable: !0
                                        },
                                        tooltip: !0,
                                        tooltipOpts: {
                                            content: "%s : %y.1%",
                                            shifts: {
                                                x: -30,
                                                y: -50
                                            },
                                            theme: "dark",
                                            defaultTheme: !1
                                        }
                                    },
                                    'donut':{
                                        series: {
                                            pie: {
                                                show: !0,
                                                innerRadius: .55,
                                                highlight: {
                                                    opacity: .1
                                                },
                                                radius: 1,
                                                stroke: {
                                                    width: 10
                                                },
                                                startAngle: 2.15
                                            }
                                        },
                                        legend: {
                                            show: !0,
                                            labelFormatter: function (a) {
                                                return '<div style="font-weight:bold;font-size:13px;">' + a + "</div>"
                                            },
                                            labelBoxBorderColor: null,
                                            margin: 50,
                                            width: 20,
                                            padding: 1
                                        },
                                        grid: {
                                            hoverable: !0,
                                            clickable: !0
                                        },
                                        tooltip: !0,
                                        tooltipOpts: {
                                            content: "%s : %y.1%",
                                            shifts: {
                                                x: -30,
                                                y: -50
                                            },
                                            theme: "dark",
                                            defaultTheme: !1
                                        }
                                    }
                                };

                                if(typeof option[type] !== 'object'){
                                    type = 'pie';
                                }

                                $.plot(placeholder, data, option[type]);
                            }

                             /*Traffic Source*/
                             drawPieChart($('#piechart-placeholder').css({'width':'100%' , 'min-height':'200px'}), [
                                 <?
                                    $color = array("#75b9e6","#f68484","#ffcc66","#eb45a7","#71d398");
                                    $count = 0;
                                    foreach($traffic_source as $key => $value){
                                ?>
                                    { label: "<? echo $key; ?>",  data: <? echo $value; ?>, color: "<? echo $color[$count]; ?>"},
                                <?
                                    $count++;}
                                ?>                                    
                              ],'donut');                                                  			

                             /*Customer Gender*/
                             drawPieChart($('#customer_gender').css({'width':'100%' , 'min-height':'200px'}), [{label:'Male Customer', data: <? echo $customer_gender['male']; ?>, color: "#75b9e6"},{label:'Female Customer', data: <? echo $customer_gender['female']; ?>, color: "#f68484"}]);


                            //pie chart tooltip example
                            var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
                            var previousPoint = null;

                            $('.drawPieChart').on('plothover', function (event, pos, item) {
				if(item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : " + item.series['percent']+'%';
						$tooltip.show().children(0).text(tip);
					}
					$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
				} else {
					$tooltip.hide();
					previousPoint = null;
				}
                            
                            });
                                
                                $(function () {
                                    var b = {
                                        white: "#fff",
                                        dark: "#79859b",
                                        red: "#f68484",
                                        blue: "#75b9e6",
                                        green: "#71d398",
                                        yellow: "#ffcc66",
                                        orange: "#f4b162",
                                        purple: "#af91e1",
                                        pink: "#f78db8",
                                        lime: "#a8db43",
                                        mageta: "#eb45a7",
                                        teal: "#97d3c5",
                                        black: "#000",
                                        brown: "#d1b993",
                                        gray: "#f3f5f6"
                                    }
<? /* ?>
                                    {
                                        for (var a = [], c = 1; 12 >= c; c += 1) a.push([c, parseInt(30 * Math.random())]);
                                        for (var d = [], c = 1; 12 >= c; c += 1) d.push([c, parseInt(30 * Math.random())]);
                                        for (var e = [], c = 1; 12 >= c; c += 1) e.push([c, parseInt(30 * Math.random())]);
                                        var f = new Array;
                                        f.push({
                                            label: "Special",
                                            data: a,
                                            bars: {
                                                order: 1
                                            }
                                        });
                                        var g = 0,
                                            h = {
                                                bars: {
                                                    show: !0,
                                                    barWidth: .2,
                                                    fill: 1
                                                },
                                                grid: {
                                                    show: !0,
                                                    aboveData: !1,
                                                    color: b.textcolor,
                                                    labelMargin: 5,
                                                    axisMargin: 0,
                                                    borderWidth: 0,
                                                    borderColor: null,
                                                    minBorderMargin: 5,
                                                    clickable: !0,
                                                    hoverable: !0,
                                                    autoHighlight: !1,
                                                    mouseActiveRadius: 20
                                                },
                                                series: {
                                                    stack: g
                                                },
                                                legend: {
                                                    position: "ne"
                                                },
                                                colors: [b.blue, b.red, b.green]                                            
                                            };
                                        $.plot($('#sales-charts').css({'width':'100%' , 'min-height':'200px'}), f, h)
                                    }
<? */ ?>
                                    {
                                        var a = [
                                        <?
                                            foreach($monthly_sales as $key => $value){
                                                $temp = date("M",strtotime(date("Y")."-".substr("00".$key,-2)."-01"));
                                        ?>
                                                ["<? echo $temp; ?>", <? echo $value; ?>],
                                        <? } ?>                                                
                                            ],
                                            c = {
                                                grid: {
                                                    show: !0,
                                                    aboveData: !1,
                                                    color: b.textcolor,
                                                    labelMargin: 20,
                                                    axisMargin: 0,
                                                    borderWidth: 0,
                                                    borderColor: null,
                                                    minBorderMargin: 5,
                                                    clickable: !0,
                                                    hoverable: !0,
                                                    autoHighlight: !0,
                                                    mouseActiveRadius: 20
                                                },
                                                series: {
                                                    grow: {
                                                        active: !0,
                                                        duration: 1500
                                                    },
                                                    lines: {
                                                        show: !0,
                                                        fill: !0,
                                                        lineWidth: 2.5
                                                    },
                                                    points: {
                                                        show: !1
                                                    }
                                                },
                                                colors: [b.blue],
                                                legend: {
                                                    show: !1
                                                },
                                                yaxis: {
                                                    show: !0
                                                },
                                                xaxis: {
                                                    mode: "categories",
                                                    tickLength: 0
                                                }
                                            };
                                        $.plot($("#sales-charts").css({'width':'100%' , 'min-height':'200px'}), [{
                                            label: "RM ",
                                            data: a
                                        }], c);
                                    }
                                });
                                                                
                                $('.plothover').on('plothover', function (event, pos, item) {
                                        if(item) {                                            
                                                if (previousPoint != item.seriesIndex) {
                                                        previousPoint = item.seriesIndex;
                                                        var tip = item.series['label'] + " : " + item.datapoint[1];                                                        
                                                        $tooltip.show().children(0).text(tip);
                                                }
                                                $tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
                                        } else {
                                                $tooltip.hide();
                                                previousPoint = null;
                                        }
                                 });
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('.tab-content')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				
				//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
				//so disable dragging when clicking on label
				var agent = navigator.userAgent.toLowerCase();
				if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
				  $('#tasks').on('touchstart', function(e){
					var li = $(e.target).closest('#tasks li');
					if(li.length == 0)return;
					var label = li.find('label.inline').get(0);
					if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
				});
                            
                            $('form.validation-form').each(function(){                                    
                                    $(this).validate({
                                            ignore:'',
                                            errorElement: 'div',
                                            errorClass: 'help-block',
                                            focusInvalid: true,
                                            rules: {                                                    
                                                    comments: {
                                                            required: true
                                                    }
                                            },
                                            
                                            highlight: function (e) {
                                                    $(e).closest('.form-group').addClass('has-error');
                                            },

                                            success: function (e) {
                                                    $(e).closest('.form-group').removeClass('has-error');                                                    
                                            },

                                            errorPlacement: function (error, element) {                                                    
                                                    if(element.is(':checkbox') || element.is(':radio')) {
                                                            var controls = element.closest('div[class*="col-"]');
                                                            if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
                                                            else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                                                    }
                                                    else if(element.is('.select2')) {
                                                            error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                                                    }
                                                    else if(element.is('.chosen-select')) {
                                                            error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                                                    }
                                                    else error.insertAfter(element.parent());
                                            },

                                            submitHandler: function (form) {
                                                ubib_ajax_submit(form);
                                                return false;                                                
                                            },
                                            invalidHandler: function (form) {
                                            }
                                    });    
                                });
			
			});
		</script>