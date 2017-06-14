package com.da.activiti.document.dao;

import com.da.activiti.dao.IBaseDao;
import com.da.activiti.model.document.Invoice;
import com.da.activiti.web.PagingCriteria;

import java.util.List;

/**
 \* @author Santosh Pandey
 * Date: 5/20/14
 */
public interface InvoiceDao extends IBaseDao<Invoice> {

    String create(Invoice Invoice);

    void createWithId(Invoice obj);

    Invoice read(String InvoiceId);

    List<Invoice> readAll();

    int getCount();

    void delete(String InvoiceId);

    void update(Invoice Invoice);

    List<Invoice> readPage(PagingCriteria criteria);
}
