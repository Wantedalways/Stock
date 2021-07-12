package com.qiheshengwu.stock.settings.service.impl;

import com.qiheshengwu.stock.settings.dao.DicTypeDao;
import com.qiheshengwu.stock.settings.dao.DicValueDao;
import com.qiheshengwu.stock.settings.entity.DicType;
import com.qiheshengwu.stock.settings.service.DicService;
import com.qiheshengwu.stock.workbench.dao.FreezerDao;
import com.qiheshengwu.stock.workbench.dao.ParkDao;
import com.qiheshengwu.stock.workbench.entity.Freezer;
import com.qiheshengwu.stock.workbench.entity.Park;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Wantedalways
 */
@Service(value = "dicService")
public class DicServiceImpl implements DicService {

    @Resource
    private ParkDao parkDao;

    @Resource
    private DicTypeDao dicTypeDao;

    @Resource
    private DicValueDao dicValueDao;

    @Resource
    private FreezerDao freezerDao;
    
    @Override
    public Map<String, Object> getDic() {

        Map<String,Object> dicMap = new HashMap<>(20);

        // 园区信息
        List<Park> parkList = parkDao.selectAll();
        dicMap.put("park",parkList);

        // 其他类型信息
        List<DicType> dicTypeList = dicTypeDao.selectAll();

        // 冷库信息
        List<Freezer> freezerList = freezerDao.selectAll();
        dicMap.put("freezer",freezerList);

        for (DicType dicType : dicTypeList) {

            dicMap.put(dicType.getCode(),dicValueDao.selectByCode(dicType.getCode()));

        }

        return dicMap;
    }
}
