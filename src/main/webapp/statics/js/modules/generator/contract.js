var app = new Vue({
    el:'#contract',
    data: {
        user:{},
        contracts:{}
    },
    methods:{

	},
    created:function () {
        $.getJSON(baseURL+"sys/user/info?_"+$.now(), function(r){
            app.user = r.user;
        });
        $.get(baseURL + "/contract/list?userId="+1, function(r){
            app.contracts=r.contracts;
        });
    }
})