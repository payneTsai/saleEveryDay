package io.renren.modules.generator.dao;

import io.renren.modules.generator.entity.TypeEntity;
import io.renren.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 销售类型
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 13:39:16
 */
@Mapper
public interface TypeDao extends BaseDao<TypeEntity> {
    List<TypeEntity> typeList();
}
