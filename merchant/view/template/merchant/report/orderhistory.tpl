<? echo $header; ?>            
                                                        <div class="row">
								<div class="col-xs-12">									
									<div class="table-header">
										Results for "Latest Order History"
									</div>

									<!-- <div class="table-responsive"> -->

									<!-- <div class="dataTables_borderWrap"> -->
									<div>
										<table id="sample-table-2" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>Product Name</th>
													<th style="width:100px">Price</th>
                                                                                                        <th class="hidden-480">Customer</th>
													<th style="width:50px" class="hidden-480">Qty</th>
													<th class="hidden-480">Option</th>
                                                                                                        <th class="hidden-480">Order Date</th>
													<th class="hidden-480">Status</th>
													<th></th>
												</tr>
											</thead>

											<tbody>
                                                                                                <?php
                                                                                                    $data = array(
                                                                                                        '26 inch Foldable Bike|RM 245|James Anderson|1|Color:Blue|2014-05-28 09:38:22|Pending',
                                                                                                        'HeelTastic for Intensive Heel Therapy|RM 45|David Lai|3|Size:L|2014-05-03 13:21:42|Pending',
                                                                                                        'Happy Call Double Grill Non-stick Pressure Pan|RM 85|John Cart|1|Color:Red|2014-04-13 16:26:31|Completed'
                                                                                                    );
                                                                                                    for($i=0; $i<sizeof($data); $i++){
                                                                                                        $record = explode("|",trim($data[$i],"|"));
                                                                                                        
                                                                                                        $label = "<span class=\"label label-primary\">PENDING</span>";
                                                                                                        if(strtolower($record[6])=="completed"){
                                                                                                            $label = "<span class=\"label label-success arrowed-in arrowed-in-right\">".strtoupper($record[6])."</span>";
                                                                                                        }
                                                                                                    
                                                                                                ?>
                                                                                            
												<tr>
													<td><? echo $record[0]; ?></td>
													<td><? echo $record[1]; ?></td>
													<td class="hidden-480"><? echo $record[2]; ?></td>
													<td class="hidden-480"><? echo $record[3]; ?></td>
													<td class="hidden-480"><? echo $record[4]; ?></td>
                                                                                                        <td class="hidden-480"><? echo $record[5]; ?></td>
                                                                                                        <td class="hidden-480"><? echo $label; ?></td>
													<td>
                                                                                                            <!--
														<div class="hidden-sm hidden-xs action-buttons">
															 <a href="#" class="tooltip-info" data-rel="tooltip" title="View">
																<i class="ace-icon fa fa-search-plus bigger-130"></i>
															</a>

															<a class="green" href="#">
																<i class="ace-icon fa fa-pencil bigger-130"></i>
															</a>

															<a class="red" href="#">
																<i class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
														</div>

														<div class="hidden-md hidden-lg">
															<div class="inline position-relative">
																<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto">
																	<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
																</button>

																<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																	<li>
																		<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
																			<span class="blue">
																				<i class="ace-icon fa fa-search-plus bigger-120"></i>
																			</span>
																		</a>
																	</li>

																	<li>
																		<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
																			<span class="green">
																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
																		</a>
																	</li>

																	<li>
																		<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
																			<span class="red">
																				<i class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
																		</a>
																	</li>
																</ul>
															</div>
														</div>
                                                                                                            -->
													</td>
												</tr>
                                                                                                
                                                                                                <?php
                                                                                                    }
                                                                                                ?>
                                                                                                
											</tbody>
										</table>
									</div>
								</div>
							</div>
<? echo $footer; ?>

<!-- page specific plugin scripts -->
		<script src="/merchant/view/js/jquery.dataTables.min.js"></script>
		<script src="/merchant/view/js/jquery.dataTables.bootstrap.js"></script>

<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
				var oTable1 = 
				$('#sample-table-2')
				//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
				.dataTable( {
					bAutoWidth: false,                                        
					"aoColumns": [					  
					  null, null,null, null, null, null, null,
					  { "bSortable": false }
					]                                        
					
					//,
					//"sScrollY": "200px",
					//"bPaginate": false,
			
					//"sScrollX": "100%",
					//"sScrollXInner": "120%",
					//"bScrollCollapse": true,
					//Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
					//you may want to wrap the table inside a "div.dataTables_borderWrap" element
			
					//"iDisplayLength": 50
			    } );
				
			
			
				$(document).on('click', 'th input:checkbox' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
				});
                                $('.hidden-sm [data-rel="tooltip"]').tooltip({container:'body'});                                
				$('.hidden-md [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}                                
			})
		</script>
                