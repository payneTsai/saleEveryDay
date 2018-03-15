var app = new Vue({
    el:'#sales',
    data: {
        showList:true,
        clues:[],
        types:{},
        activeId: 1
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
    }
})

