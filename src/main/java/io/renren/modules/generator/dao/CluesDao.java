package io.renren.modules.generator.dao;

import io.renren.modules.generator.entity.CluesEntity;
import io.renren.modules.generator.entity.CluesExtendsEntity;
import io.renren.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 市场线索表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-03-12 13:39:15
 */
@Mapper
public interface CluesDao extends BaseDao<CluesEntity> {
    List<CluesExtendsEntity> queryListByTypeId(Integer typeId);
	
}
