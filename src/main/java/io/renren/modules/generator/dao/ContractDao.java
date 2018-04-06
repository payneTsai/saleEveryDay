package io.renren.modules.generator.dao;

import io.renren.modules.generator.entity.ContractEntity;
import io.renren.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import io.renren.modules.generator.entity.ContractExtendsEntity;

import java.util.List;

/**
 * 合同管理
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2018-04-06 17:06:43
 */
@Mapper
public interface ContractDao extends BaseDao<ContractEntity> {
    /**
     * 根据用户id查询合同信息
     * @param userId
     * @return
     */
    List<ContractExtendsEntity>  selectContractByUserId(Integer userId);

}
