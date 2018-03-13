package io.renren.modules.generator.controller;

import io.renren.common.utils.R;
import io.renren.modules.generator.entity.CluesExtendsEntity;
import io.renren.modules.generator.entity.TypeEntity;
import io.renren.modules.generator.service.CluesService;
import io.renren.modules.generator.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("sale")
public class salesController {

    @Autowired
    private CluesService cluesService;

    @Autowired
    private TypeService typeService;

    /**
     * 查询销售类型
     * @return
     */
    @RequestMapping("/typelist")
    public R list(){
        List<TypeEntity> typeList = typeService.typeList();
        return R.ok().put("type", typeList);
    }

    @RequestMapping("clueslist")
    public R clueList(@RequestParam Integer typeid){
        List<CluesExtendsEntity> cluesExtendsEntities = cluesService.queryListByTypeId(typeid);
        return R.ok().put("cluesExtendsEntities",cluesExtendsEntities);
    }





}
