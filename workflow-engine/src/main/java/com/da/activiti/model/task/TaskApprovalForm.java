package com.da.activiti.model.task;

import javax.validation.constraints.NotNull;

import com.da.activiti.model.task.AbstractTaskForm;

/**
 \* @author Santosh Pandey
 \* Date: 5/24/17
 */
public class TaskApprovalForm extends AbstractTaskForm {
    @NotNull
    private Boolean approved;

    public Boolean getApproved() {
        return approved;
    }
    public void setApproved(Boolean approved) {
        this.approved = approved;
    }

    @Override public String toString() {
        final StringBuilder sb = new StringBuilder("TaskApproval{");
        sb.append(super.toString());
        sb.append("approved=").append(approved);
        sb.append('}');
        return sb.toString();
    }
}
