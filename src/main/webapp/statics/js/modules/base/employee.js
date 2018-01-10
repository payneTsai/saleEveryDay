$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'employee/list',
        datatype: "json",
        colModel: [			
			{ label: 'empId', name: 'empId', index: 'emp_id', width: 50, key: true },
			{ label: '员工姓名', name: 'empName', index: 'emp_name', width: 80 }, 			
			{ label: '员工密码', name: 'empPassword', index: 'emp_password', width: 80 }, 			
			{ label: '员工邮箱', name: 'empEmail', index: 'emp_email', width: 80 }, 			
			{ label: '员工手机号码', name: 'empMoblie', index: 'emp_moblie', width: 80 }, 			
			{ label: '员工最后一次登录时间', name: 'lastLogin', index: 'last_login', width: 80 }, 			
			{ label: '员工创建时间', name: 'gmtCreate', index: 'gmt_create', width: 80 }, 			
			{ label: '员工修改时间', name: 'gmtModified', index: 'gmt_modified', width: 80 }			
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
		employee: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.employee = {};
		},
		update: function (event) {
			var empId = getSelectedRow();
			if(empId == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(empId)
		},
		saveOrUpdate: function (event) {
			var url = vm.employee.empId == null ? "employee/save" : "employee/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
			    contentType: "application/json",
			    data: JSON.stringify(vm.employee),
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
			var empIds = getSelectedRows();
			if(empIds == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "employee/delete",
				    contentType: "application/json",
				    data: JSON.stringify(empIds),
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
		getInfo: function(empId){
			$.get(baseURL + "employee/info/"+empId, function(r){
                vm.employee = r.employee;
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