package io.renren.modules.generator.controller;

import io.renren.common.utils.R;
import io.renren.modules.generator.entity.ChanceEntity;
import io.renren.modules.generator.entity.CluesEntity;
import io.renren.modules.generator.entity.CluesExtendsEntity;
import io.renren.modules.generator.entity.TypeEntity;
import io.renren.modules.generator.service.ChanceService;
import io.renren.modules.generator.service.CluesService;
import io.renren.modules.generator.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("sale")
public class salesController {

    @Autowired
    private CluesService cluesService;

    @Autowired
    private TypeService typeService;

    @Autowired
    private ChanceService chanceService;
    /**
     * 查询销售类型
     * @return
     */
    @RequestMapping("/typelist")
    public R list(){
        List<TypeEntity> typeList = typeService.typeList();
        return R.ok().put("type", typeList);
    }


    /***
     * 查询销售线索信息
     */
    @RequestMapping("clueslist")
    public R clueList(@RequestParam Integer typeid){
        List<CluesExtendsEntity> cluesExtendsEntities = cluesService.queryListByTypeId(typeid);
        return R.ok().put("clue",cluesExtendsEntities);
    }

    /**
     * 新增销售线索
    * */
    @PostMapping("/addclues")
    public R addClues(@RequestParam Integer userId,@RequestParam String cluename,@RequestParam String productId,@RequestParam String customerId){
        if ( (cluename == null || cluename.length()==0) || ( productId == null || productId.length() ==0) || (customerId == null || customerId.length() ==0) ) {
            return R.ok("信息不能为空");
        }

        CluesEntity cluesEntity = new CluesEntity();
        cluesEntity.setClueName(cluename);
        cluesEntity.setCustomerId(Integer.valueOf(customerId));
        cluesEntity.setProductId(Integer.valueOf(productId));
        if (userId==0){
            cluesEntity.setTypeId(1);
        }else{
            cluesEntity.setTypeId(2);
        }
        cluesService.save(cluesEntity);
        return R.ok();
    }

    /**
     * 拉取线索
     */
    @RequestMapping("/pull")
    public R pullClues(@RequestParam Integer cluesId,@RequestParam Integer userId){
        CluesEntity cluesEntity = new CluesEntity();
        cluesEntity.setTypeId(2);
        cluesEntity.setId(cluesId);
        cluesService.update(cluesEntity);
        ChanceEntity chanceEntity = new ChanceEntity();
        chanceEntity.setCluesId(cluesId);
        chanceEntity.setUserId(userId);
        chanceService.save(chanceEntity);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody CluesEntity clues){
        cluesService.update(clues);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestParam Integer id){
        cluesService.delete(id);
        return R.ok();
    }



}
