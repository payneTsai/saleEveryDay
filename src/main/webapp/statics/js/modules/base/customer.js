$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'customer/list',
        datatype: "json",
        colModel: [			
			{ label: 'customerId', name: 'customerId', index: 'customer_id', width: 50, key: true },
			{ label: '客户名称', name: 'customerName', index: 'customer_name', width: 80 }, 			
			{ label: '客户手机号码', name: 'customerMobile', index: 'customer_mobile', width: 80 }, 			
			{ label: '客户创建时间', name: 'gmtCreate', index: 'gmt_create', width: 80 }, 			
			{ label: '客户修改时间', name: 'gmtModified', index: 'gmt_modified', width: 80 }			
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		customer: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.customer = {};
		},
		update: function (event) {
			var customerId = getSelectedRow();
			if(customerId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(customerId)
		},
		saveOrUpdate: function (event) {
			var url = vm.customer.customerId == null ? "customer/save" : "customer/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.customer),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var customerIds = getSelectedRows();
			if(customerIds == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "customer/delete",
				    contentType: "application/json",
				    data: JSON.stringify(customerIds),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(customerId){
			$.get(baseURL + "customer/info/"+customerId, function(r){
                vm.customer = r.customer;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		}
	}
});