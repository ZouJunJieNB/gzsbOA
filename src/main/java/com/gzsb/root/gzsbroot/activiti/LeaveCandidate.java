package com.gzsb.root.gzsbroot.activiti;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author zouJunJie
 * @create 2020-01-19 13:13
 */
@Data
public class LeaveCandidate implements Serializable {
    private List<String> divisionManager;
    private List<String> personnelManager;

}
