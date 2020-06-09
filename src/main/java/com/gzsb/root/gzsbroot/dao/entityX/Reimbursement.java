package com.gzsb.root.gzsbroot.dao.entityX;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author zouJunJie
 * @create 2020-01-28 17:55
 */
@Data
public class Reimbursement {
    private String id;
    private String status;
    private String operator;
    private String realName;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH")
    @JsonFormat(pattern = "yyyy-MM-dd HH")
    private Date startTime;
}
