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
        mine:0
    },
    methods:{

        getClues:function (e) {
            app.activeId = e.target.id;
            var typeid = e.target.id
            $.get(baseURL + "sale/clueslist?typeid="+typeid, function(r){
                // console.log(r);
                app.clues = r.clue;
            });
        },
        add:function () {
            app.cname="";
            app.pname="";
            app.cluename="";
            $.get(baseURL + "customer/customerlist", function(r){
                app.customers = r.customerList;
                // console.log(app.customers);
            });
            $.get(baseURL + "product/productlist", function(r){
                app.products = r.productList;
                // console.log(app.products);
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
            $.post(baseURL + "sale/addclues",
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
        update:function(){
            app.showList = true;
        }

    },
    created:function () {
        $.get(baseURL + "sale/typelist", function(r){
            app.types = r.type;
        });
        $.get(baseURL + "sale/clueslist?typeid="+1, function(r){
            // console.log(r);
            app.clues = r.clue;
        });
        $.getJSON(baseURL +"sys/user/info?_"+$.now(), function(r){
            app.user = r.user;
            // console.log(app.user)
        });
    }
})

