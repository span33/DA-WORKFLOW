/**
 * 
 */

var jsonData = {"default":"/process/TaskList.htm","task":"tamp-/process/TaskMappingListByTaskId.htm?mappingId=","tamp":"proc-/process/ProcesslistByTaskMappingId.htm?mappingId="};
		function resolveUrl(searchKey,mappingId){
			for (var key in jsonData) {
				if(searchKey=='default') {
					return  jsonData[key];
				}else {
					var mappingKey = searchKey.substr(0,4);
					if(mappingKey == key  &&  !isNaN(mappingId) ) {
						return jsonData[key]+mappingId;
					}
					
				}
  				 
      		 }
			
		}
		$(document).ready(function() {
			var url = resolveUrl("default");
			
			if(url!= 'undefined') {
				ajaxCall(1,"task" ,resolveUrl("default"));
			}
				
		});
		$("#example-basic").treetable({
			branchAttr : "ttBranch",
			clickableNodeNames : false,
			column : 0,
			columnElType : "td", // i.e. 'td', 'th' or 'td,th'
			expandable : true,
			expanderTemplate : "<a href='#'>&nbsp;</a>",
			indent : 19,
			indenterTemplate : "<span class='indenter'></span>",
			cellTemplate : '',
			initialState : "collapsed",
			nodeIdAttr : "ttId", // <a href="http://www.jqueryscript.net/tags.php?/map/">map</a>s to data-tt-id
			parentIdAttr : "ttParentId", // maps to data-tt-parent-id
			stringExpand : "Expand",
			stringCollapse : "Collapse",

			// Events
			onInitialized : null,
			onNodeCollapse : null,
			onNodeExpand : nodeExpand,
			onNodeInitialized : null
		});
		
		function nodeExpand() {
			if(this.id == 1) {
				//ajaxCall(this.id,"task","/process/TaskList.htm");	
			}else {
				var currentRow= document.getElementById(this.id);
				var mappingIdstr = currentRow.cells[0].id;
				var mappingId = mappingIdstr.substr(6, mappingIdstr.length);
				var url = resolveUrl(this.id,mappingId);
				if (!(typeof url === 'undefined')) {
					var data = url.split('-');
					ajaxCall(this.id,data[0],data[1]);	
				}
				
			}
		
		}
		
		function ajaxCall(parentNodeID,task,url) {
			 $.ajax({
	    	        type: 'GET',
	    	        dataType: 'json',
	    	        url: SERVLET_CONTEXT + url,
	    	        headers: {
	    	            Accept: "application/json"
	    	        },
	    	        success: function (resposeResult) {
	    	            console.dir(resposeResult);
	    	            if (!resposeResult.success) {
	    	                alert("There was an error getting the app ProcessList");
	    	            }
	    	            else {
	    	           
	    	               // console.log(resposeResult.data);
	    	               
	    	                if(resposeResult.success) {
	    	              
	    	                	var parentNode = $("#example-basic").treetable("node", parentNodeID);
	    	                	
	    	                
	    	                $.each(resposeResult.data, function(i, obj) {
	    	                	var nodeToAdd = $("#example-basic").treetable("node",task+i);
	    	              
	    	                
	    	                if( !nodeToAdd) {
	    	                	
	    	                	var row ='<tr  id="'+task+i+'" data-tt-id="'+task + i +'"' +'data-tt-parent-id="' +
	                            parentNodeID + '" ';
	                       
	                            row += ' data-tt-branch="true" ';
	                       
	                        row += ' >';
	                        
	    	                	  
	    	                		  for (var key in obj) {
	    	                			  row += '<td id="td'+task+ obj[key] + '">' + obj[key] + '</td>';
	    	                				 
		    	                		 }
	    	                		  
	    	                		// End row
	    	                          row +="</tr>";
	    	                          
	    	                          $("#example-basic").treetable("loadBranch", parentNode, row);
	    	                	  }
	    	                		 
	    	                		
	    	                		
	    	                	});
	    	            }
	    	                
	    	                
	    	            }
	    	        },
	    	        error: function (error) {
	    	            alert("There was an error getting the ProcessList");
	    	        }
	    	    });
		}