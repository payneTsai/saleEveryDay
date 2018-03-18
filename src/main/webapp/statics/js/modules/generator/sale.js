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
        pname: ""
    },
    methods:{

        getClues:function (e) {
            app.activeId = e.target.id;
            var typeid = e.target.id
            $.get(baseURL + "crm/sale/clueslist?typeid="+typeid, function(r){
                console.log(r);
                app.clues = r.clue;
            });
        },
        add:function () {
            $.get(baseURL + "crm/customer/customerlist", function(r){
                app.customers = r.customerList;
                console.log(app.customers);
            });
            $.get(baseURL + "crm/product/productlist", function(r){
                app.products = r.productList;
                console.log(app.products);
            });
            app.showList=false;
        },
        back:function () {
            app.showList=true;
        }
    },
    created:function () {
        $.get(baseURL + "crm/sale/typelist", function(r){
            app.types = r.type;
        });
        $.get(baseURL + "crm/sale/clueslist?typeid="+1, function(r){
            console.log(r);
            app.clues = r.clue;
        });
        $.getJSON("sys/user/info?_"+$.now(), function(r){
            app.user = r.user;
            console.log(app.user)
        });
        $.get(baseURL + "crm/customer/customerlist", function(r){
            app.customers = r.customerList;
            console.log(app.customers);
        });
        $.get(baseURL + "crm/product/productlist", function(r){
            app.products = r.productList;
            console.log(app.products);
        });
    }
})

