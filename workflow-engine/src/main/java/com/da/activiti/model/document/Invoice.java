package com.da.activiti.model.document;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

/**
 \* @author Santosh Pandey
 */
public class Invoice extends Document {

    /**
	 * 
	 */
	private static final long serialVersionUID = 2580230658381180973L;
	@NotEmpty
    protected String payee;
    @NotNull
    protected BigDecimal amount;

    public Invoice() {
        super();
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getPayee() {

        return payee;
    }

    public void setPayee(String payee) {
        this.payee = payee;
    }
}
