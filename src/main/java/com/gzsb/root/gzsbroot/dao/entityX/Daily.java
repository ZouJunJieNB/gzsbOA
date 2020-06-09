package com.gzsb.root.gzsbroot.dao.entityX;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: Pig Xue
 * @Date: 2019/11/4 17:07
 * description:
 */
@Data
public class Daily implements Serializable {
    private Integer id;
    private String typeCode;
    private String operator;
    private String dailyDetails;
    private Date dailySubmitTime;
    private Date dailyUpdateTime;
    private Date dailyStartTime;
    private Date dailyEndTime;
    private String description;
}
