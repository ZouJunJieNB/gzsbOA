package com.gzsb.root.gzsbroot.dao.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class PermissionExample   {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    public PermissionExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andPermissionCodeIsNull() {
            addCriterion("PERMISSION_CODE is null");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeIsNotNull() {
            addCriterion("PERMISSION_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeEqualTo(String value) {
            addCriterion("PERMISSION_CODE =", value, "permissionCode");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeNotEqualTo(String value) {
            addCriterion("PERMISSION_CODE <>", value, "permissionCode");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeGreaterThan(String value) {
            addCriterion("PERMISSION_CODE >", value, "permissionCode");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeGreaterThanOrEqualTo(String value) {
            addCriterion("PERMISSION_CODE >=", value, "permissionCode");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeLessThan(String value) {
            addCriterion("PERMISSION_CODE <", value, "permissionCode");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeLessThanOrEqualTo(String value) {
            addCriterion("PERMISSION_CODE <=", value, "permissionCode");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeLike(String value) {
            addCriterion("PERMISSION_CODE like", value, "permissionCode");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeNotLike(String value) {
            addCriterion("PERMISSION_CODE not like", value, "permissionCode");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeIn(List<String> values) {
            addCriterion("PERMISSION_CODE in", values, "permissionCode");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeNotIn(List<String> values) {
            addCriterion("PERMISSION_CODE not in", values, "permissionCode");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeBetween(String value1, String value2) {
            addCriterion("PERMISSION_CODE between", value1, value2, "permissionCode");
            return (Criteria) this;
        }

        public Criteria andPermissionCodeNotBetween(String value1, String value2) {
            addCriterion("PERMISSION_CODE not between", value1, value2, "permissionCode");
            return (Criteria) this;
        }

        public Criteria andPermissionNameIsNull() {
            addCriterion("PERMISSION_NAME is null");
            return (Criteria) this;
        }

        public Criteria andPermissionNameIsNotNull() {
            addCriterion("PERMISSION_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andPermissionNameEqualTo(String value) {
            addCriterion("PERMISSION_NAME =", value, "permissionName");
            return (Criteria) this;
        }

        public Criteria andPermissionNameNotEqualTo(String value) {
            addCriterion("PERMISSION_NAME <>", value, "permissionName");
            return (Criteria) this;
        }

        public Criteria andPermissionNameGreaterThan(String value) {
            addCriterion("PERMISSION_NAME >", value, "permissionName");
            return (Criteria) this;
        }

        public Criteria andPermissionNameGreaterThanOrEqualTo(String value) {
            addCriterion("PERMISSION_NAME >=", value, "permissionName");
            return (Criteria) this;
        }

        public Criteria andPermissionNameLessThan(String value) {
            addCriterion("PERMISSION_NAME <", value, "permissionName");
            return (Criteria) this;
        }

        public Criteria andPermissionNameLessThanOrEqualTo(String value) {
            addCriterion("PERMISSION_NAME <=", value, "permissionName");
            return (Criteria) this;
        }

        public Criteria andPermissionNameLike(String value) {
            addCriterion("PERMISSION_NAME like", value, "permissionName");
            return (Criteria) this;
        }

        public Criteria andPermissionNameNotLike(String value) {
            addCriterion("PERMISSION_NAME not like", value, "permissionName");
            return (Criteria) this;
        }

        public Criteria andPermissionNameIn(List<String> values) {
            addCriterion("PERMISSION_NAME in", values, "permissionName");
            return (Criteria) this;
        }

        public Criteria andPermissionNameNotIn(List<String> values) {
            addCriterion("PERMISSION_NAME not in", values, "permissionName");
            return (Criteria) this;
        }

        public Criteria andPermissionNameBetween(String value1, String value2) {
            addCriterion("PERMISSION_NAME between", value1, value2, "permissionName");
            return (Criteria) this;
        }

        public Criteria andPermissionNameNotBetween(String value1, String value2) {
            addCriterion("PERMISSION_NAME not between", value1, value2, "permissionName");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlIsNull() {
            addCriterion("PERMISSION_URL is null");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlIsNotNull() {
            addCriterion("PERMISSION_URL is not null");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlEqualTo(String value) {
            addCriterion("PERMISSION_URL =", value, "permissionUrl");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlNotEqualTo(String value) {
            addCriterion("PERMISSION_URL <>", value, "permissionUrl");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlGreaterThan(String value) {
            addCriterion("PERMISSION_URL >", value, "permissionUrl");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlGreaterThanOrEqualTo(String value) {
            addCriterion("PERMISSION_URL >=", value, "permissionUrl");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlLessThan(String value) {
            addCriterion("PERMISSION_URL <", value, "permissionUrl");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlLessThanOrEqualTo(String value) {
            addCriterion("PERMISSION_URL <=", value, "permissionUrl");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlLike(String value) {
            addCriterion("PERMISSION_URL like", value, "permissionUrl");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlNotLike(String value) {
            addCriterion("PERMISSION_URL not like", value, "permissionUrl");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlIn(List<String> values) {
            addCriterion("PERMISSION_URL in", values, "permissionUrl");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlNotIn(List<String> values) {
            addCriterion("PERMISSION_URL not in", values, "permissionUrl");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlBetween(String value1, String value2) {
            addCriterion("PERMISSION_URL between", value1, value2, "permissionUrl");
            return (Criteria) this;
        }

        public Criteria andPermissionUrlNotBetween(String value1, String value2) {
            addCriterion("PERMISSION_URL not between", value1, value2, "permissionUrl");
            return (Criteria) this;
        }

        public Criteria andFatherCodeIsNull() {
            addCriterion("FATHER_CODE is null");
            return (Criteria) this;
        }

        public Criteria andFatherCodeIsNotNull() {
            addCriterion("FATHER_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andFatherCodeEqualTo(String value) {
            addCriterion("FATHER_CODE =", value, "fatherCode");
            return (Criteria) this;
        }

        public Criteria andFatherCodeNotEqualTo(String value) {
            addCriterion("FATHER_CODE <>", value, "fatherCode");
            return (Criteria) this;
        }

        public Criteria andFatherCodeGreaterThan(String value) {
            addCriterion("FATHER_CODE >", value, "fatherCode");
            return (Criteria) this;
        }

        public Criteria andFatherCodeGreaterThanOrEqualTo(String value) {
            addCriterion("FATHER_CODE >=", value, "fatherCode");
            return (Criteria) this;
        }

        public Criteria andFatherCodeLessThan(String value) {
            addCriterion("FATHER_CODE <", value, "fatherCode");
            return (Criteria) this;
        }

        public Criteria andFatherCodeLessThanOrEqualTo(String value) {
            addCriterion("FATHER_CODE <=", value, "fatherCode");
            return (Criteria) this;
        }

        public Criteria andFatherCodeLike(String value) {
            addCriterion("FATHER_CODE like", value, "fatherCode");
            return (Criteria) this;
        }

        public Criteria andFatherCodeNotLike(String value) {
            addCriterion("FATHER_CODE not like", value, "fatherCode");
            return (Criteria) this;
        }

        public Criteria andFatherCodeIn(List<String> values) {
            addCriterion("FATHER_CODE in", values, "fatherCode");
            return (Criteria) this;
        }

        public Criteria andFatherCodeNotIn(List<String> values) {
            addCriterion("FATHER_CODE not in", values, "fatherCode");
            return (Criteria) this;
        }

        public Criteria andFatherCodeBetween(String value1, String value2) {
            addCriterion("FATHER_CODE between", value1, value2, "fatherCode");
            return (Criteria) this;
        }

        public Criteria andFatherCodeNotBetween(String value1, String value2) {
            addCriterion("FATHER_CODE not between", value1, value2, "fatherCode");
            return (Criteria) this;
        }

        public Criteria andSortIsNull() {
            addCriterion("SORT is null");
            return (Criteria) this;
        }

        public Criteria andSortIsNotNull() {
            addCriterion("SORT is not null");
            return (Criteria) this;
        }

        public Criteria andSortEqualTo(Integer value) {
            addCriterion("SORT =", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotEqualTo(Integer value) {
            addCriterion("SORT <>", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortGreaterThan(Integer value) {
            addCriterion("SORT >", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortGreaterThanOrEqualTo(Integer value) {
            addCriterion("SORT >=", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortLessThan(Integer value) {
            addCriterion("SORT <", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortLessThanOrEqualTo(Integer value) {
            addCriterion("SORT <=", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortIn(List<Integer> values) {
            addCriterion("SORT in", values, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotIn(List<Integer> values) {
            addCriterion("SORT not in", values, "sort");
            return (Criteria) this;
        }

        public Criteria andSortBetween(Integer value1, Integer value2) {
            addCriterion("SORT between", value1, value2, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotBetween(Integer value1, Integer value2) {
            addCriterion("SORT not between", value1, value2, "sort");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table GZSB_PERMISSION
     *
     * @mbg.generated
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}