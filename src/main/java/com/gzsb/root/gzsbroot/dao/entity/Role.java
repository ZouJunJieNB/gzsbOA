package com.gzsb.root.gzsbroot.dao.entity;

import java.io.Serializable;

public class Role   {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column GZSB_ROLE.ROLE_CODE
     *
     * @mbg.generated
     */
    private String roleCode;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column GZSB_ROLE.ROLE_NAME
     *
     * @mbg.generated
     */
    private String roleName;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column GZSB_ROLE.ROLE_CODE
     *
     * @return the value of GZSB_ROLE.ROLE_CODE
     *
     * @mbg.generated
     */
    public String getRoleCode() {
        return roleCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column GZSB_ROLE.ROLE_CODE
     *
     * @param roleCode the value for GZSB_ROLE.ROLE_CODE
     *
     * @mbg.generated
     */
    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode == null ? null : roleCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column GZSB_ROLE.ROLE_NAME
     *
     * @return the value of GZSB_ROLE.ROLE_NAME
     *
     * @mbg.generated
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column GZSB_ROLE.ROLE_NAME
     *
     * @param roleName the value for GZSB_ROLE.ROLE_NAME
     *
     * @mbg.generated
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }
}