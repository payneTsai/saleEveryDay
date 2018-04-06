package io.renren.modules.generator.dao;

import io.renren.modules.generator.entity.ChanceEntity;
import io.renren.modules.generator.entity.ChanceExtendsEntity;
import io.renren.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 销售机会
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-04-05 16:07:07
 */
@Mapper
public interface ChanceDao extends BaseDao<ChanceEntity> {
    /**
     * 根据用户id查询销售机会
     * @return
     */
    List<ChanceExtendsEntity> selectByUserId(Integer userId);

    /**
     * 根据机会id查询销售线索
     * @param id
     * @return
     */
    Integer selectCluesId(Integer id);
}
