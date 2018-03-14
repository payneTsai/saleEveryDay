

// $(function () {
//     typeid = 1;
//     get(typeid);
//     $.get(baseURL + "clues/typelist", function(r){
//         // console.log(r);
//         vm.types = r.type;
//     });
// });

function get(ids) {
    $("#jqGrid").jqGrid({
        url: baseURL + 'clues/list',
        datatype: "json",
        postData:{
            "typeid":ids
        },
        colModel: [
            { label: '序号', name: 'id', index: 'id', width: 50, key: true },
            // { label: '产品表Id', name: 'productId', index: 'product_id', width: 80 },
            // { label: '客户表id', name: 'customerId', index: 'customer_id', width: 80 },
            { label: '产品名称', name: 'productName', index: 'name', width: 80 },
            { label: '产品描述', name: 'describe', index: 'describe', width: 80 },
            { label: '产品单位', name: 'unit', index: 'unit', width: 80 },
            { label: '产品价格', name: 'price', index: 'price', width: 80 },
            { label: '销售类型id', name: 'typeId', index: 'type_id', width: 80 }	,
            { label: '客户名称', name: 'customerName', index: 'name', width: 80 },
            { label: '客户手机号', name: 'mobile', index: 'mobile', width: 80 },
            { label: '客户所在地址', name: 'address', index: 'address', width: 80 },
            { label: '客户公司', name: 'business', index: 'business', width: 80 },
            { label: '客户邮箱', name: 'email', index: 'email', width: 80 }
            // { label: '销售类型名称', name: 'typeName', index: 'type_name', width: 80 }
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
}
var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		clues: {},
		types:{},
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.clues = {};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.clues.id == null ? "clues/save" : "clues/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.clues),
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
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "clues/delete",
				    contentType: "application/json",
				    data: JSON.stringify(ids),
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
		getInfo: function(id){
			$.get(baseURL + "clues/info/"+id, function(r){
                vm.clues = r.clues;
            });
		},
		reload: function (event) {
            console.log(event.target.id);
			get(event.target.id);
			vm.showList = true;

		}
	},
    created:function () {
        $.get(baseURL + "clues/typelist", function(r){
            vm.types = r.type;
        });
        get(1);
        // var page = $("#jqGrid").jqGrid('getGridParam','page');
        // $("#jqGrid").jqGrid('setGridParam',{
        //     page:page
        // }).trigger("reloadGrid");
    }
});