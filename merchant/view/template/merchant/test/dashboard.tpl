<?php echo $header; ?>
                                
					<div class="row">                                                
						<div class="col-xs-12">
                                                        <div class="row">
                                                            <div class="space-6"></div>
                                                            <div class="col-xs-12 infobox-container">                                                                
                                                                    <div class="infobox infobox-green">
                                                                            <div class="infobox-icon">
                                                                                    <i class="ace-icon fa fa-comments"></i>
                                                                            </div>

                                                                            <div class="infobox-data">
                                                                                    <span class="infobox-data-number">32</span>
                                                                                    <div class="infobox-content">comments</div>
                                                                            </div>

                                                                            <div class="stat stat-success">8%</div>
                                                                    </div>

                                                                    <div class="infobox infobox-pink">
                                                                            <div class="infobox-icon">
                                                                                    <i class="ace-icon fa fa-shopping-cart"></i>
                                                                            </div>

                                                                            <div class="infobox-data">
                                                                                    <span class="infobox-data-number">8</span>
                                                                                    <div class="infobox-content">new orders</div>
                                                                            </div>
                                                                            <div class="stat stat-important">4%</div>
                                                                    </div>

                                                                    <div class="infobox infobox-red">
                                                                            <div class="infobox-icon">
                                                                                    <i class="ace-icon fa fa-heart"></i>
                                                                            </div>

                                                                            <div class="infobox-data">
                                                                                    <span class="infobox-data-number">7</span>
                                                                                    <div class="infobox-content">new wishlist product</div>
                                                                            </div>
                                                                    </div>

                                                                    <div class="infobox infobox-orange2">
                                                                            <div class="infobox-chart">
                                                                                    <span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
                                                                            </div>

                                                                            <div class="infobox-data">
                                                                                    <span class="infobox-data-number">6,251</span>
                                                                                    <div class="infobox-content">pageviews</div>
                                                                            </div>

                                                                            <div class="badge badge-success">
                                                                                    7.2%
                                                                                    <i class="ace-icon fa fa-arrow-up"></i>
                                                                            </div>
                                                                    </div>
                                                            </div>
                                                        </div>
                                                    
                                                        <div class="hr hr32 hr-dotted"></div>
                                                    
							<div class="row">
								<div class="col-sm-9 control-value">
									<div class="widget-box">
										<div class="widget-header widget-header-flat widget-header-small">
											<h4 class="widget-title">
												<i class="ace-icon fa fa-signal"></i>
												Customer Gender
											</h4>
										</div>

										<div class="widget-body">
											<div class="widget-main">
												<div class="drawPieChart" id="customer_gender"></div>
											</div><!-- /.widget-main -->
										</div><!-- /.widget-body -->
									</div><!-- /.widget-box -->
								</div><!-- /.col -->

								<div class="vspace-12-sm"></div>

								<div class="col-sm-9 control-value">
									<div class="widget-box">
										<div class="widget-header widget-header-flat widget-header-small">
											<h4 class="widget-title">
												<i class="ace-icon fa fa-signal"></i>
												Traffic Sources
											</h4>

											<div class="widget-toolbar no-border">
												<div class="inline dropdown-hover">
													<button class="btn btn-minier btn-primary">
														This Week
														<i class="ace-icon fa fa-angle-down icon-on-right bigger-110"></i>
													</button>

													<ul class="dropdown-menu dropdown-menu-right dropdown-125 dropdown-lighter dropdown-close dropdown-caret">
														<li class="active">
															<a href="#" class="blue">
																<i class="ace-icon fa fa-caret-right bigger-110">&nbsp;</i>
																This Week
															</a>
														</li>

														<li>
															<a href="#">
																<i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
																Last Week
															</a>
														</li>

														<li>
															<a href="#">
																<i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
																This Month
															</a>
														</li>

														<li>
															<a href="#">
																<i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
																Last Month
															</a>
														</li>
													</ul>
												</div>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main">
												<div class="drawPieChart" id="piechart-placeholder"></div>
											</div><!-- /.widget-main -->
										</div><!-- /.widget-body -->
									</div><!-- /.widget-box -->
								</div><!-- /.col -->
							</div><!-- /.row -->

							<div class="hr hr32 hr-dotted"></div>

							<div class="row">
								<div class="col-sm-9 control-value">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat widget-header-small">
											<h4 class="widget-title">
												<i class="ace-icon fa fa-star orange"></i>
												Popular Products
											</h4>

											
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
												<table class="table table-bordered table-striped">
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
														<tr>
															<td>Stainless Steel Steamer for Healthy Meals</td>

															<td>
																<small>
																	<s class="red">RM29.99</s>
																</small>
																<b class="green">RM19.99</b>
															</td>

															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-right">on sale</span>
															</td>
														</tr>

														<tr>
															<td>Happy Call Double Grill Non-stick Pressure Pan</td>

															<td>
																<small>
																	<s class="red"></s>
																</small>
																<b class="green">RM16.45</b>
															</td>

															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-right">on sale</span>
															</td>
														</tr>

														<tr>
															<td>The Auto Foldable Car Sunshade</td>

															<td>
																<small>
																	<s class="red"></s>
																</small>
																<b class="green">RM15.00</b>
															</td>

															<td class="hidden-480">
																<span class="label label-danger arrowed arrowed-in-right">out of stock</span>
															</td>
														</tr>

														<tr>
															<td>The Incredible Insta Hang</td>

															<td>
																<small>
																	<s class="red">RM24.99</s>
																</small>
																<b class="green">RM19.95</b>
															</td>

															<td class="hidden-480">
																<span class="label label-danger arrowed arrowed-in-right">out of stock</span>
															</td>
														</tr>
                                                                                                                
                                                                                                                <tr>
															<td>Cosmetics Storage Box Organizer</td>

															<td>
																<small>
																	<s class="red"></s>
																</small>
																<b class="green">RM45.45</b>
															</td>

															<td class="hidden-480">
																<span class="label label-success arrowed-in arrowed-right">on sale</span>
															</td>
														</tr>
													</tbody>
												</table>
											</div><!-- /.widget-main -->
										</div><!-- /.widget-body -->
									</div><!-- /.widget-box -->
								</div><!-- /.col -->

								<div class="col-sm-9 control-value">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat widget-header-small">
											<h4 class="widget-title">
												<i class="ace-icon fa fa-signal"></i>
												Sales Stats
											</h4>

											
										</div>

										<div class="widget-body">
											<div class="widget-main padding-4">
												<div id="sales-charts"></div>
											</div><!-- /.widget-main -->
										</div><!-- /.widget-body -->
									</div><!-- /.widget-box -->
								</div><!-- /.col -->
							</div><!-- /.row -->

							<div class="hr hr32 hr-dotted"></div>

							<div class="row">
								<div class="col-sm-9 control-value">
									<div class="widget-box">										
                                                                                <div class="widget-header widget-header-flat widget-header-small">
                                                                                    <h4 class="widget-title">
                                                                                            <i class="ace-icon fa fa-phone orange"></i>
                                                                                            Contact UBIB Admin
                                                                                    </h4>                                                                                       
                                                                                </div>
                                                                                <div class="widget-body">                       
                                                                                        <div class="widget-main no-padding">                                   
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

                                                                                                <div class="clearfix form-actions">
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
								</div><!-- /.col -->

								<div class="col-sm-9 control-value">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat widget-header-small">
											<h4 class="widget-title">
												<i class="ace-icon fa fa-comment blue"></i>
												Customer Latest Comments
											</h4>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">                                                                                                
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
											</div><!-- /.widget-main -->
										</div><!-- /.widget-body -->
									</div><!-- /.widget-box -->
								</div><!-- /.col -->
							</div><!-- /.row -->

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
			
			
			
			  var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
			  var data = [
				{ label: "social networks",  data: 38.7, color: "#68BC31"},
				{ label: "search engines",  data: 24.5, color: "#2091CF"},
				{ label: "ad campaigns",  data: 8.2, color: "#AF4E96"},
				{ label: "direct traffic",  data: 18.6, color: "#DA5430"},
				{ label: "other",  data: 10, color: "#FEE074"}
			  ]
			  function drawPieChart(placeholder, data, position) {
			 	  $.plot(placeholder, data, {
					series: {
						pie: {
							show: true,
							tilt:0.8,
							highlight: {
								opacity: 0.25
							},
							stroke: {
								color: '#fff',
								width: 2
							},
							startAngle: 2
						}
					},
					legend: {
						show: true,
						position: position || "ne", 
						labelBoxBorderColor: null,
						margin:[-30,15]
					}
					,
					grid: {
						hoverable: true,
						clickable: true
					}
				 })
			 }
			 drawPieChart(placeholder, data);
                                                  			
			                          
                         /*Customer Gender*/
                         drawPieChart($('#customer_gender').css({'width':'90%' , 'min-height':'150px'}), [{label:'Male Customer', data: 42, color: "#2091CF"},{label:'Female Customer', data: 58, color: "pink"}]);
			
			
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
			
			
				var d1 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d1.push([i, Math.sin(i)]);
				}
			
				var d2 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d2.push([i, Math.cos(i)]);
				}
			
				var d3 = [];
				for (var i = 0; i <= 6; i += 0.5) {
					d3.push([i, (i/4)]);
				}
				
			
				var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
				$.plot("#sales-charts", [
					{ label: "Special Sales", data: d1 },
					{ label: "Normal Sales", data: d2 },
					{ label: "Promotion Sales", data: d3 }
				], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: { show: true },
						points: { show: true }
					},
					xaxis: {
						tickLength: 0
					},
					yaxis: {
						ticks: 10,
						min: -2,
						max: 2,
						tickDecimals: 3
					},
					grid: {
						backgroundColor: { colors: [ "#fff", "#fff" ] },
						borderWidth: 1,
						borderColor:'#555',
                                                hoverable: true
					}
				});
                                
                                sales_charts.on('plothover', function (event, pos, item) {
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
			
			
				$('.dialogs,.comments').ace_scroll({
					size: 300
			    });
				
				
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