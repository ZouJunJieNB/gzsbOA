package com.gzsb.root.gzsbroot.dao.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProcessExample   {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table gzsb_process
     *
     * @mbg.generated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table gzsb_process
     *
     * @mbg.generated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table gzsb_process
     *
     * @mbg.generated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_process
     *
     * @mbg.generated
     */
    public ProcessExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_process
     *
     * @mbg.generated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_process
     *
     * @mbg.generated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_process
     *
     * @mbg.generated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_process
     *
     * @mbg.generated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_process
     *
     * @mbg.generated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_process
     *
     * @mbg.generated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_process
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
     * This method corresponds to the database table gzsb_process
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
     * This method corresponds to the database table gzsb_process
     *
     * @mbg.generated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table gzsb_process
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
     * This class corresponds to the database table gzsb_process
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

        public Criteria andProcessIdIsNull() {
            addCriterion("PROCESS_ID is null");
            return (Criteria) this;
        }

        public Criteria andProcessIdIsNotNull() {
            addCriterion("PROCESS_ID is not null");
            return (Criteria) this;
        }

        public Criteria andProcessIdEqualTo(Integer value) {
            addCriterion("PROCESS_ID =", value, "processId");
            return (Criteria) this;
        }

        public Criteria andProcessIdNotEqualTo(Integer value) {
            addCriterion("PROCESS_ID <>", value, "processId");
            return (Criteria) this;
        }

        public Criteria andProcessIdGreaterThan(Integer value) {
            addCriterion("PROCESS_ID >", value, "processId");
            return (Criteria) this;
        }

        public Criteria andProcessIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("PROCESS_ID >=", value, "processId");
            return (Criteria) this;
        }

        public Criteria andProcessIdLessThan(Integer value) {
            addCriterion("PROCESS_ID <", value, "processId");
            return (Criteria) this;
        }

        public Criteria andProcessIdLessThanOrEqualTo(Integer value) {
            addCriterion("PROCESS_ID <=", value, "processId");
            return (Criteria) this;
        }

        public Criteria andProcessIdIn(List<Integer> values) {
            addCriterion("PROCESS_ID in", values, "processId");
            return (Criteria) this;
        }

        public Criteria andProcessIdNotIn(List<Integer> values) {
            addCriterion("PROCESS_ID not in", values, "processId");
            return (Criteria) this;
        }

        public Criteria andProcessIdBetween(Integer value1, Integer value2) {
            addCriterion("PROCESS_ID between", value1, value2, "processId");
            return (Criteria) this;
        }

        public Criteria andProcessIdNotBetween(Integer value1, Integer value2) {
            addCriterion("PROCESS_ID not between", value1, value2, "processId");
            return (Criteria) this;
        }

        public Criteria andTypeCodeIsNull() {
            addCriterion("TYPE_CODE is null");
            return (Criteria) this;
        }

        public Criteria andTypeCodeIsNotNull() {
            addCriterion("TYPE_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andTypeCodeEqualTo(String value) {
            addCriterion("TYPE_CODE =", value, "typeCode");
            return (Criteria) this;
        }

        public Criteria andTypeCodeNotEqualTo(String value) {
            addCriterion("TYPE_CODE <>", value, "typeCode");
            return (Criteria) this;
        }

        public Criteria andTypeCodeGreaterThan(String value) {
            addCriterion("TYPE_CODE >", value, "typeCode");
            return (Criteria) this;
        }

        public Criteria andTypeCodeGreaterThanOrEqualTo(String value) {
            addCriterion("TYPE_CODE >=", value, "typeCode");
            return (Criteria) this;
        }

        public Criteria andTypeCodeLessThan(String value) {
            addCriterion("TYPE_CODE <", value, "typeCode");
            return (Criteria) this;
        }

        public Criteria andTypeCodeLessThanOrEqualTo(String value) {
            addCriterion("TYPE_CODE <=", value, "typeCode");
            return (Criteria) this;
        }

        public Criteria andTypeCodeLike(String value) {
            addCriterion("TYPE_CODE like", value, "typeCode");
            return (Criteria) this;
        }

        public Criteria andTypeCodeNotLike(String value) {
            addCriterion("TYPE_CODE not like", value, "typeCode");
            return (Criteria) this;
        }

        public Criteria andTypeCodeIn(List<String> values) {
            addCriterion("TYPE_CODE in", values, "typeCode");
            return (Criteria) this;
        }

        public Criteria andTypeCodeNotIn(List<String> values) {
            addCriterion("TYPE_CODE not in", values, "typeCode");
            return (Criteria) this;
        }

        public Criteria andTypeCodeBetween(String value1, String value2) {
            addCriterion("TYPE_CODE between", value1, value2, "typeCode");
            return (Criteria) this;
        }

        public Criteria andTypeCodeNotBetween(String value1, String value2) {
            addCriterion("TYPE_CODE not between", value1, value2, "typeCode");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeIsNull() {
            addCriterion("PLAN_STATUS_CODE is null");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeIsNotNull() {
            addCriterion("PLAN_STATUS_CODE is not null");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeEqualTo(String value) {
            addCriterion("PLAN_STATUS_CODE =", value, "planStatusCode");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeNotEqualTo(String value) {
            addCriterion("PLAN_STATUS_CODE <>", value, "planStatusCode");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeGreaterThan(String value) {
            addCriterion("PLAN_STATUS_CODE >", value, "planStatusCode");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeGreaterThanOrEqualTo(String value) {
            addCriterion("PLAN_STATUS_CODE >=", value, "planStatusCode");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeLessThan(String value) {
            addCriterion("PLAN_STATUS_CODE <", value, "planStatusCode");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeLessThanOrEqualTo(String value) {
            addCriterion("PLAN_STATUS_CODE <=", value, "planStatusCode");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeLike(String value) {
            addCriterion("PLAN_STATUS_CODE like", value, "planStatusCode");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeNotLike(String value) {
            addCriterion("PLAN_STATUS_CODE not like", value, "planStatusCode");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeIn(List<String> values) {
            addCriterion("PLAN_STATUS_CODE in", values, "planStatusCode");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeNotIn(List<String> values) {
            addCriterion("PLAN_STATUS_CODE not in", values, "planStatusCode");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeBetween(String value1, String value2) {
            addCriterion("PLAN_STATUS_CODE between", value1, value2, "planStatusCode");
            return (Criteria) this;
        }

        public Criteria andPlanStatusCodeNotBetween(String value1, String value2) {
            addCriterion("PLAN_STATUS_CODE not between", value1, value2, "planStatusCode");
            return (Criteria) this;
        }

        public Criteria andThemeIsNull() {
            addCriterion("THEME is null");
            return (Criteria) this;
        }

        public Criteria andThemeIsNotNull() {
            addCriterion("THEME is not null");
            return (Criteria) this;
        }

        public Criteria andThemeEqualTo(String value) {
            addCriterion("THEME =", value, "theme");
            return (Criteria) this;
        }

        public Criteria andThemeNotEqualTo(String value) {
            addCriterion("THEME <>", value, "theme");
            return (Criteria) this;
        }

        public Criteria andThemeGreaterThan(String value) {
            addCriterion("THEME >", value, "theme");
            return (Criteria) this;
        }

        public Criteria andThemeGreaterThanOrEqualTo(String value) {
            addCriterion("THEME >=", value, "theme");
            return (Criteria) this;
        }

        public Criteria andThemeLessThan(String value) {
            addCriterion("THEME <", value, "theme");
            return (Criteria) this;
        }

        public Criteria andThemeLessThanOrEqualTo(String value) {
            addCriterion("THEME <=", value, "theme");
            return (Criteria) this;
        }

        public Criteria andThemeLike(String value) {
            addCriterion("THEME like", value, "theme");
            return (Criteria) this;
        }

        public Criteria andThemeNotLike(String value) {
            addCriterion("THEME not like", value, "theme");
            return (Criteria) this;
        }

        public Criteria andThemeIn(List<String> values) {
            addCriterion("THEME in", values, "theme");
            return (Criteria) this;
        }

        public Criteria andThemeNotIn(List<String> values) {
            addCriterion("THEME not in", values, "theme");
            return (Criteria) this;
        }

        public Criteria andThemeBetween(String value1, String value2) {
            addCriterion("THEME between", value1, value2, "theme");
            return (Criteria) this;
        }

        public Criteria andThemeNotBetween(String value1, String value2) {
            addCriterion("THEME not between", value1, value2, "theme");
            return (Criteria) this;
        }

        public Criteria andProcessTypeIsNull() {
            addCriterion("PROCESS_TYPE is null");
            return (Criteria) this;
        }

        public Criteria andProcessTypeIsNotNull() {
            addCriterion("PROCESS_TYPE is not null");
            return (Criteria) this;
        }

        public Criteria andProcessTypeEqualTo(String value) {
            addCriterion("PROCESS_TYPE =", value, "processType");
            return (Criteria) this;
        }

        public Criteria andProcessTypeNotEqualTo(String value) {
            addCriterion("PROCESS_TYPE <>", value, "processType");
            return (Criteria) this;
        }

        public Criteria andProcessTypeGreaterThan(String value) {
            addCriterion("PROCESS_TYPE >", value, "processType");
            return (Criteria) this;
        }

        public Criteria andProcessTypeGreaterThanOrEqualTo(String value) {
            addCriterion("PROCESS_TYPE >=", value, "processType");
            return (Criteria) this;
        }

        public Criteria andProcessTypeLessThan(String value) {
            addCriterion("PROCESS_TYPE <", value, "processType");
            return (Criteria) this;
        }

        public Criteria andProcessTypeLessThanOrEqualTo(String value) {
            addCriterion("PROCESS_TYPE <=", value, "processType");
            return (Criteria) this;
        }

        public Criteria andProcessTypeLike(String value) {
            addCriterion("PROCESS_TYPE like", value, "processType");
            return (Criteria) this;
        }

        public Criteria andProcessTypeNotLike(String value) {
            addCriterion("PROCESS_TYPE not like", value, "processType");
            return (Criteria) this;
        }

        public Criteria andProcessTypeIn(List<String> values) {
            addCriterion("PROCESS_TYPE in", values, "processType");
            return (Criteria) this;
        }

        public Criteria andProcessTypeNotIn(List<String> values) {
            addCriterion("PROCESS_TYPE not in", values, "processType");
            return (Criteria) this;
        }

        public Criteria andProcessTypeBetween(String value1, String value2) {
            addCriterion("PROCESS_TYPE between", value1, value2, "processType");
            return (Criteria) this;
        }

        public Criteria andProcessTypeNotBetween(String value1, String value2) {
            addCriterion("PROCESS_TYPE not between", value1, value2, "processType");
            return (Criteria) this;
        }

        public Criteria andApplyTimeIsNull() {
            addCriterion("APPLY_TIME is null");
            return (Criteria) this;
        }

        public Criteria andApplyTimeIsNotNull() {
            addCriterion("APPLY_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andApplyTimeEqualTo(Date value) {
            addCriterion("APPLY_TIME =", value, "applyTime");
            return (Criteria) this;
        }

        public Criteria andApplyTimeNotEqualTo(Date value) {
            addCriterion("APPLY_TIME <>", value, "applyTime");
            return (Criteria) this;
        }

        public Criteria andApplyTimeGreaterThan(Date value) {
            addCriterion("APPLY_TIME >", value, "applyTime");
            return (Criteria) this;
        }

        public Criteria andApplyTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("APPLY_TIME >=", value, "applyTime");
            return (Criteria) this;
        }

        public Criteria andApplyTimeLessThan(Date value) {
            addCriterion("APPLY_TIME <", value, "applyTime");
            return (Criteria) this;
        }

        public Criteria andApplyTimeLessThanOrEqualTo(Date value) {
            addCriterion("APPLY_TIME <=", value, "applyTime");
            return (Criteria) this;
        }

        public Criteria andApplyTimeIn(List<Date> values) {
            addCriterion("APPLY_TIME in", values, "applyTime");
            return (Criteria) this;
        }

        public Criteria andApplyTimeNotIn(List<Date> values) {
            addCriterion("APPLY_TIME not in", values, "applyTime");
            return (Criteria) this;
        }

        public Criteria andApplyTimeBetween(Date value1, Date value2) {
            addCriterion("APPLY_TIME between", value1, value2, "applyTime");
            return (Criteria) this;
        }

        public Criteria andApplyTimeNotBetween(Date value1, Date value2) {
            addCriterion("APPLY_TIME not between", value1, value2, "applyTime");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table gzsb_process
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
     * This class corresponds to the database table gzsb_process
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