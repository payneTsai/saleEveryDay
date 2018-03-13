$(function () {
    $.get(baseURL + "crm/sale/typelist", function(r){
        vm.types = r.type;
    });
    $.get(baseURL + "crm/sale/clueslist?typeid="+1



        , function(r){
        // console.log(r);
        vm.clues = r.clues;
    });
})

var vm = new Vue({
    el:'#sales',
    data: {
        types:{},
        activeId: 1,
        clues:{}
    },
    methods:{
        getClues:function (e) {
            vm.activeId = e.target.id;
            var typeid = e.target.id
            $.get(baseURL + "crm/sale/clueslist?typeid="+typeid, function(r){
                // console.log(r);
                vm.clues = r.clues;
            });

        }
    },
    created:function () {

    }
})


$(function () {
    /*$("li:first").addClass("active")
    $("div ul li").click(function () {
        $(this).addClass("add").siblings().removeClass("add");
    })*/

})