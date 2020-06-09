package com.gzsb.root.gzsbroot.dao.entityX;

import com.gzsb.root.gzsbroot.dao.entity.Operator;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author: Pig Xue
 * @Date: 2019/10/25 14:56
 * description:
 */

@Data
public class OperatorRolePositionX extends Operator implements Serializable {
    private String departmentCode;
    private String  departmentName;
    private String roleCode;
    private String roleName;
}
