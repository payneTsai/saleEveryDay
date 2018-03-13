$(function () {
    $.get(baseURL + "crm/sale/typelist", function(r){
        console.log(r);
        vm.types = r.type;
    });
})

var vm = new Vue({
    el:'#sales',
    data: {
        types:{}
    },
    method:{},
    created:function () {

    }


})
