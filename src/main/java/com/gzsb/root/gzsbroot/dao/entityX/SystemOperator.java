package com.gzsb.root.gzsbroot.dao.entityX;

import com.gzsb.root.gzsbroot.dao.entity.Operator;

import java.io.Serializable;
import java.util.List;

/**
 * @author KW-NLL
 * @date 2019/10/10.
 */
public class SystemOperator extends Operator implements Serializable{

    private List<String> roles;

    private List<String> permissions;

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }

    public List<String> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<String> permissions) {
        this.permissions = permissions;
    }


}
