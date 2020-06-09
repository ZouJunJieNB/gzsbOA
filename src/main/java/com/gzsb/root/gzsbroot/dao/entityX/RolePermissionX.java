package com.gzsb.root.gzsbroot.dao.entityX;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author: Pig Xue
 * @Date: 2019/10/23 8:52
 * description:
 */
@Data
public class RolePermissionX implements Serializable {
    private Integer id;
    private String roleCode;
    private String roleName;
    private String permissionCode;
    private String permissionName;
    private String permissionUrl;
    private String fatherCode;
    private Integer sort;
}
