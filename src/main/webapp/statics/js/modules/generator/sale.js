var app = new Vue({
    el:'#sales',
    data: {
        showList:true,
        clues:[],
        types:{},
        activeId: 1,
        user:{},
        customers:{},
        products:{},
        cname:"",
        pname: "",
        cluename:"",
        mine:0,
        type:1
    },
    methods:{
        getClues:function (e) {
            app.type=e.target.id;
            app.activeId = e.target.id;
            var typeid = e.target.id
            $.get(baseURL + "crm/sale/clueslist?typeid="+typeid, function(r){
                app.clues = r.clue;
            });
        },
        add:function () {
            app.cname="";
            app.pname="";
            app.cluename="";
            $.get(baseURL + "crm/customer/customerlist", function(r){
                app.customers = r.customerList;
            });
            $.get(baseURL + "crm/product/productlist", function(r){
                app.products = r.productList;
            });
            app.showList=false;
        },
        back:function () {
            app.showList=true;
        },
        addClues:function(e){
            var hasuserid = 0 ;
            if (1==app.mine){
                hasuserid = app.user.userId;
            }else{
                hasuserid == 0;
            }
            $.post(baseURL + "crm/sale/addclues",
            {
                cluename:app.cluename,
                productId:app.pname,
                customerId:app.cname,
                userId:hasuserid

            }, function(r){
                console.log(r);
                    app.back();
            });
        },
        pull:function (e) {
            console.log(app.user);
            console.log(app.clues[0].id);
            confirm('确认拉取该线索？', function(){
                $.ajax({
                    type: "POST",
                    url: "sale/pull",
                    data:{
                        cluesId:app.clues[0].id,
                        userId:app.user.userId
                    },
                    success: function(r){
                        $.get(baseURL + "crm/sale/clueslist?typeid="+2, function(r){
                            app.clues = r.clue;
                        });
                        app.activeId = 2;
                        if(r.code == 0){
                            alert('操作成功', function(index){
                            });
                        }else{
                            alert(r.msg);
                        }
                    }
                });
            });
        },
        del: function (e) {
            confirm('确定要删除选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: "sale/delete",
                    data:{
                        id:app.clues[0].id
                    },
                    success: function(r){
                        $.get(baseURL + "crm/sale/clueslist?typeid="+app.type, function(r){
                            app.clues = r.clue;
                        });
                        app.activeId = app.type;
                        if(r.code == 0){
                            alert('操作成功', function(index){
                            });
                        }else{
                            alert(r.msg);
                        }
                    }
                });
            });
        },
    },
    created:function () {
        $.get(baseURL + "crm/sale/typelist", function(r){
            app.types = r.type;
        });
        $.get(baseURL + "crm/sale/clueslist?typeid="+1, function(r){
            app.clues = r.clue;
        });
        $.getJSON("sys/user/info?_"+$.now(), function(r){
            app.user = r.user;
        });
    }
})

