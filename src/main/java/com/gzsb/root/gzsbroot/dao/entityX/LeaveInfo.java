package com.gzsb.root.gzsbroot.dao.entityX;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author zouJunJie
 * @create 2019-10-21 16:45
 */
@Data
public class LeaveInfo implements Serializable {

    private String id;
    private String status;
    private String leaveMsg;
    private String userCode;
    private String realName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date startTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endTime;
    private String projectRemarks;
    private String hrRemarks;
    private String taskId;
}
