var app = new Vue({
    el:'#chance',
    data: {
		user:{},
        chances:{},
        success:false,
        chanceId:0,
        contractName:"",
        money:0
    },
    methods:{
        switchFail:function (id) {
            console.log(id);

            confirm('确认转为失败？', function(){
                $.ajax({
                    type: "POST",
                    url: baseURL + "/chance/delete",
                    data:{
                        id:id
                    },
                    success: function(r){
                        $.get(baseURL + "/chance/list?userId="+1, function(r){
                            app.chances=r.chances;
                        });
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
        switchSuccess:function (chance) {
            app.success = true;
            console.log(chance)
            app.chanceId = chance.id;
        },
        turn:function () {
                $.ajax({
                    type: "POST",
                    url: baseURL + "/chance/success",
                    data:{
                        id:app.chanceId,
                        contractName:app.contractName,
                        money:app.money,
                        userId:app.user.userId
                    },
                    success: function(r){
                        app.success = false;
                        $.get(baseURL + "/chance/list?userId="+1, function(r){
                            app.chances=r.chances;
                        });
                        if(r.code == 0){
                            alert('操作成功', function(index){
                            });
                        }else{
                            alert(r.msg);
                        }
                    }
                });
        },
        back:function () {
            app.success = false;
            $.get(baseURL + "/chance/list?userId="+1, function(r){
                app.chances=r.chances;
            });
        },
        getList:function () {
            $.get(baseURL + "/chance/list?userId="+app.user.userId, function(r){
                app.chances=r.chances;
            });
        }
	},
    created:function () {
        $.getJSON(baseURL+"sys/user/info?_"+$.now(), function(r){
            app.user = r.user;
            $.get(baseURL + "/chance/list?userId="+r.user.userId, function(r){
                app.chances=r.chances;
            });
        });
	}

})

