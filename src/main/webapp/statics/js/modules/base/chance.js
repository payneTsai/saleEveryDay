$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'chance/list',
        datatype: "json",
        colModel: [			
			{ label: 'chanceId', name: 'chanceId', index: 'chance_id', width: 50, key: true },
			{ label: '员工id', name: 'empId', index: 'emp_id', width: 80 }, 			
			{ label: '客户id', name: 'customerId', index: 'customer_id', width: 80 }, 			
			{ label: '产品id', name: 'productId', index: 'product_id', width: 80 }, 			
			{ label: '销售机会状态', name: 'chanceStatus', index: 'chance_status', width: 80 }, 			
			{ label: '销售机会名称', name: 'chanceName', index: 'chance_name', width: 80 }, 			
			{ label: '销售机会id', name: 'gmtCreate', index: 'gmt_create', width: 80 }, 			
			{ label: '销售机会修改时间', name: 'gmtModified', index: 'gmt_modified', width: 80 }			
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
		chance: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.chance = {};
		},
		update: function (event) {
			var chanceId = getSelectedRow();
			if(chanceId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(chanceId)
		},
		saveOrUpdate: function (event) {
			var url = vm.chance.chanceId == null ? "chance/save" : "chance/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.chance),
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
			var chanceIds = getSelectedRows();
			if(chanceIds == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "chance/delete",
				    contentType: "application/json",
				    data: JSON.stringify(chanceIds),
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
		getInfo: function(chanceId){
			$.get(baseURL + "chance/info/"+chanceId, function(r){
                vm.chance = r.chance;
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